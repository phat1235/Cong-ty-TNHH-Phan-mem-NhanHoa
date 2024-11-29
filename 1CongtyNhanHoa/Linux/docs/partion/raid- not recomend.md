**Giới thiệu**  
Tiện ích `mdadm` có thể được sử dụng để tạo và quản lý các mảng lưu trữ bằng khả năng RAID phần mềm của Linux. Các quản trị viên có thể phối hợp linh hoạt các thiết bị lưu trữ riêng biệt và tạo ra các thiết bị lưu trữ logic có hiệu suất cao hơn hoặc đặc tính dư thừa.

Hướng dẫn này sẽ hướng dẫn bạn thực hiện các cấu hình RAID khác nhau có thể được thiết lập trên máy chủ Ubuntu.

**Yêu cầu**  
Để thực hiện các bước trong hướng dẫn này, bạn sẽ cần:

- Một người dùng không phải root với quyền sudo trên máy chủ Ubuntu. Để biết cách thiết lập tài khoản với các quyền này, hãy tham khảo hướng dẫn thiết lập máy chủ Ubuntu ban đầu.
- Kiến thức cơ bản về thuật ngữ và khái niệm RAID. Để tìm hiểu thêm về RAID và mức độ RAID phù hợp cho bạn, đọc bài viết giới thiệu về RAID.
- Nhiều thiết bị lưu trữ thô có sẵn trên máy chủ của bạn. Các ví dụ trong hướng dẫn này minh họa cách cấu hình các loại mảng khác nhau trên máy chủ. Vì vậy, bạn sẽ cần một số ổ đĩa để cấu hình.
- Tùy thuộc vào loại mảng, bạn sẽ cần từ hai đến bốn thiết bị lưu trữ. Các ổ đĩa này không cần phải được định dạng trước khi thực hiện theo hướng dẫn này.

**Lưu ý**: Vì RAID không hiệu quả trên các máy chủ ảo, chúng tôi không khuyến khích triển khai RAID trên các máy ảo DigitalOcean. Việc sao chép dữ liệu trong trung tâm dữ liệu làm cho lợi ích của RAID trở nên không đáng kể so với khi sử dụng trên phần cứng vật lý. Hướng dẫn này nhằm mục đích làm tài liệu tham khảo cho một thiết lập RAID thông thường.

**Đặt lại các thiết bị RAID hiện có (Tùy chọn)**  
Bạn có thể bỏ qua phần này nếu chưa thiết lập bất kỳ mảng nào. Hướng dẫn này sẽ giới thiệu nhiều mức RAID khác nhau. Nếu bạn muốn theo dõi và hoàn thành từng mức RAID cho các thiết bị của mình, có thể bạn sẽ muốn tái sử dụng các thiết bị lưu trữ sau mỗi phần. Phần này sẽ giúp bạn đặt lại các thiết bị lưu trữ thành phần trước khi thử nghiệm mức RAID mới.

**Cảnh báo**: Quá trình này sẽ hoàn toàn xóa mảng và mọi dữ liệu đã ghi vào đó. Hãy chắc chắn rằng bạn đang thao tác với mảng chính xác và đã sao lưu dữ liệu cần thiết trước khi xóa mảng.

Bắt đầu bằng cách tìm các mảng hoạt động trong tệp `/proc/mdstat`:

```bash
cat /proc/mdstat
```

Kết quả  
```
Personalities : [raid0] [linear] [multipath] [raid1] [raid6] [raid5] [raid4] [raid10] 
md0 : active raid0 sdc[1] sdd[0]
      209584128 blocks super 1.2 512k chunks
unused devices: <none>
```

Tiếp theo, unmount mảng khỏi hệ thống tệp:

```bash
sudo umount /dev/md0
```

Bây giờ dừng và xóa mảng:

```bash
sudo mdadm --stop /dev/md0
```

Tìm các thiết bị đã được sử dụng để xây dựng mảng bằng lệnh sau:

```bash
lsblk -o NAME,SIZE,FSTYPE,TYPE,MOUNTPOINT
```

Kết quả  
```
NAME     SIZE FSTYPE            TYPE MOUNTPOINT
sda      100G linux_raid_member disk 
sdb      100G linux_raid_member disk 
sdc      100G                   disk 
sdd      100G                   disk 
vda       25G                   disk 
├─vda1  24.9G ext4              part /
├─vda14    4M                   part 
└─vda15  106M vfat              part /boot/efi
vdb      466K iso9660           disk 
```

Sau khi xác định được các thiết bị, bạn cần xóa siêu dữ liệu RAID trên chúng bằng lệnh sau:

```bash
sudo mdadm --zero-superblock /dev/sda
sudo mdadm --zero-superblock /dev/sdb
```

Khuyến nghị bạn cũng nên xóa mọi tham chiếu cố định đến mảng. Chỉnh sửa tệp `/etc/fstab` và chú thích hoặc xóa tham chiếu đến mảng của bạn. Bạn có thể chú thích bằng cách thêm ký hiệu `#` ở đầu dòng, sử dụng nano hoặc trình soạn thảo văn bản ưa thích:

```bash
sudo nano /etc/fstab
```

Chú thích hoặc xóa định nghĩa mảng trong tệp `/etc/mdadm/mdadm.conf`:

```bash
sudo nano /etc/mdadm/mdadm.conf
```

Cuối cùng, cập nhật lại `initramfs` để đảm bảo quá trình khởi động không cố gắng mang mảng không có sẵn vào lúc khởi động:

```bash
sudo update-initramfs -u
```

Từ đây, bạn có thể tái sử dụng các thiết bị lưu trữ cá nhân hoặc là thành phần của một mảng khác.

**Tạo mảng RAID 0**  
Mảng RAID 0 hoạt động bằng cách chia nhỏ dữ liệu thành các khối và phân bổ chúng qua các đĩa có sẵn. Điều này có nghĩa là mỗi đĩa chứa một phần dữ liệu và nhiều đĩa sẽ được tham chiếu khi truy xuất thông tin.

**Yêu cầu**: Tối thiểu 2 thiết bị lưu trữ.  
**Lợi ích chính**: Hiệu suất về đọc/ghi và dung lượng.  
**Điều cần lưu ý**: Hãy chắc chắn rằng bạn có sao lưu hoạt động. Một thiết bị hỏng sẽ làm mất hết dữ liệu trong mảng.

**Xác định các thiết bị thành phần**  
Để bắt đầu, tìm các định danh của các đĩa thô mà bạn sẽ sử dụng:

```bash
lsblk -o NAME,SIZE,FSTYPE,TYPE,MOUNTPOINT
```

Kết quả  
```
NAME     SIZE FSTYPE   TYPE MOUNTPOINT
sda      100G          disk
sdb      100G          disk
vda       25G          disk 
├─vda1  24.9G ext4     part /
├─vda14    4M          part 
└─vda15  106M vfat     part /boot/efi
vdb      466K iso9660  disk 
```

Trong ví dụ này, bạn có hai đĩa không có hệ thống tệp, mỗi đĩa 100G. Các thiết bị này đã được gán các định danh `/dev/sda` và `/dev/sdb` cho phiên làm việc này và sẽ là các thành phần thô để tạo mảng.

**Tạo mảng**  
Để tạo mảng RAID 0 với các thành phần này, hãy đưa chúng vào lệnh `mdadm --create`. Bạn sẽ phải chỉ định tên thiết bị mà bạn muốn tạo, mức RAID và số lượng thiết bị. Ví dụ lệnh này sẽ tạo thiết bị `/dev/md0` và bao gồm hai đĩa sẽ tạo mảng:

```bash
sudo mdadm --create --verbose /dev/md0 --level=0 --raid-devices=2 /dev/sda /dev/sdb
```

Xác nhận rằng RAID đã được tạo thành công bằng cách kiểm tra tệp `/proc/mdstat`:

```bash
cat /proc/mdstat
```

Kết quả  
```
Personalities : [linear] [multipath] [raid0] [raid1] [raid6] [raid5] [raid4] [raid10] 
md0 : active raid0 sdb[1] sda[0]
      209584128 blocks super 1.2 512k chunks
unused devices: <none>
```

**Tạo và mount hệ thống tệp**  
Tiếp theo, tạo một hệ thống tệp trên mảng:

```bash
sudo mkfs.ext4 -F /dev/md0
```

Sau đó, tạo một điểm mount để gắn hệ thống tệp mới:

```bash
sudo mkdir -p /mnt/md0
```

Bạn có thể mount hệ thống tệp với lệnh sau:

```bash
sudo mount /dev/md0 /mnt/md0
```

Sau đó, kiểm tra xem không gian mới có sẵn không:

```bash
df -h -x devtmpfs -x tmpfs
```

Kết quả  
```
Filesystem      Size  Used Avail Use% Mounted on
/dev/vda1        25G  1.4G   23G   6% /
/dev/vda15      105M  3.4M  102M   4% /boot/efi
/dev/md0        196G   61M  186G   1% /mnt/md0
```

Hệ thống tệp mới hiện đã được mount và có thể truy cập.

**Lưu cấu hình mảng**  
Để đảm bảo mảng tự động được ghép lại khi khởi động, bạn sẽ cần chỉnh sửa tệp `/etc/mdadm/mdadm.conf`. Bạn có thể quét

 các mảng hiện tại và ghi lại thông tin:

```bash
sudo mdadm --detail --scan >> /etc/mdadm/mdadm.conf
```

Sau đó, cập nhật lại `initramfs`:

```bash
sudo update-initramfs -u
```

**Kết luận**  
Với các bước trên, bạn đã tạo thành công một mảng RAID 0, cung cấp cho hệ thống của bạn một không gian lưu trữ mạnh mẽ và hiệu suất cao.

---
---
**Tạo Mảng RAID 1**

Mảng RAID 1 được triển khai bằng cách sao chép dữ liệu giữa tất cả các ổ đĩa có sẵn. Mỗi ổ đĩa trong mảng RAID 1 sẽ có một bản sao đầy đủ của dữ liệu, giúp cung cấp sự dự phòng khi một thiết bị bị hỏng.

**Yêu cầu**: Ít nhất 2 thiết bị lưu trữ.  
**Lợi ích chính**: Dự phòng giữa hai thiết bị lưu trữ.  
**Lưu ý**: Vì dữ liệu được sao chép đôi, chỉ một nửa dung lượng của các ổ đĩa có thể sử dụng được.

### Xác Định Các Thiết Bị Thành Phần
Để bắt đầu, bạn cần tìm các nhận dạng cho các ổ đĩa chưa định dạng mà bạn sẽ sử dụng:

```bash
lsblk -o NAME,SIZE,FSTYPE,TYPE,MOUNTPOINT
```

**Ví dụ đầu ra**:
```
NAME     SIZE FSTYPE   TYPE MOUNTPOINT
sda      100G          disk 
sdb      100G          disk 
vda       25G          disk 
├─vda1  24.9G ext4     part /
├─vda14    4M          part 
└─vda15  106M vfat     part /boot/efi
vdb      466K iso9660  disk
```

Ở đây, bạn có hai ổ đĩa không có hệ thống tệp, mỗi ổ có dung lượng 100G. Các thiết bị này có định danh `/dev/sda` và `/dev/sdb` và sẽ được sử dụng để xây dựng mảng.

### Tạo Mảng
Để tạo mảng RAID 1 với các thành phần này, bạn sử dụng lệnh `mdadm --create`. Bạn sẽ phải chỉ định tên thiết bị bạn muốn tạo, cấp độ RAID và số lượng thiết bị. Ví dụ, bạn sẽ tạo mảng với tên `/dev/md0` và bao gồm các ổ đĩa cần thiết:

```bash
sudo mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 /dev/sda /dev/sdb
```

Nếu các thiết bị bạn sử dụng không phải là phân vùng có cờ boot, bạn sẽ nhận được cảnh báo. Bạn có thể trả lời `y` và tiếp tục:

**Ví dụ đầu ra**:
```
mdadm: Note: this array has metadata at the start and
    may not be suitable as a boot device. If you plan to
    store '/boot' on this device please ensure that
    your boot-loader understands md/v1.x metadata, or use
    --metadata=0.90
mdadm: size set to 104792064K
Continue creating array? y
```

Lệnh `mdadm` sẽ bắt đầu quá trình sao chép các ổ đĩa. Quá trình này có thể mất một thời gian, nhưng bạn vẫn có thể sử dụng mảng trong khi quá trình đang diễn ra. Để theo dõi tiến trình, bạn có thể kiểm tra tệp `/proc/mdstat`:

```bash
cat /proc/mdstat
```

**Ví dụ đầu ra**:
```
Personalities : [linear] [multipath] [raid0] [raid1] [raid6] [raid5] [raid4] [raid10]
md0 : active raid1 sdb[1] sda[0]
      104792064 blocks super 1.2 [2/2] [UU]
      [====>................]  resync = 20.2% (21233216/104792064) finish=6.9min speed=199507K/sec
unused devices: <none>
```

Dòng đầu tiên cho thấy mảng `/dev/md0` đã được tạo thành công theo cấu hình RAID 1 sử dụng các ổ đĩa `/dev/sda` và `/dev/sdb`. Dòng thứ hai cho thấy tiến độ sao chép.

### Tạo và Gắn Kết Hệ Thống Tệp
Tiếp theo, tạo hệ thống tệp trên mảng:

```bash
sudo mkfs.ext4 -F /dev/md0
```

Tạo thư mục mount để gắn kết hệ thống tệp:

```bash
sudo mkdir -p /mnt/md0
```

Gắn kết hệ thống tệp vào thư mục:

```bash
sudo mount /dev/md0 /mnt/md0
```

Kiểm tra xem không gian mới có khả dụng không:

```bash
df -h -x devtmpfs -x tmpfs
```

**Ví dụ đầu ra**:
```
Filesystem      Size  Used Avail Use% Mounted on
/dev/vda1        25G  1.4G   23G   6% /
/dev/vda15      105M  3.4M  102M   4% /boot/efi
/dev/md0         99G   60M   94G   1% /mnt/md0
```

Mảng mới đã được gắn kết và có thể truy cập.

### Lưu Cấu Hình Mảng
Để đảm bảo mảng được lắp ráp tự động khi khởi động lại, bạn cần điều chỉnh tệp `/etc/mdadm/mdadm.conf`. Bạn có thể tự động quét mảng hoạt động và thêm vào tệp này:

```bash
sudo mdadm --detail --scan | sudo tee -a /etc/mdadm/mdadm.conf
```

Sau đó, cập nhật lại `initramfs` để mảng có sẵn trong quá trình khởi động:

```bash
sudo update-initramfs -u
```

Thêm các tùy chọn mount hệ thống tệp mới vào tệp `/etc/fstab` để tự động gắn kết khi khởi động:

```bash
echo '/dev/md0 /mnt/md0 ext4 defaults,nofail,discard 0 0' | sudo tee -a /etc/fstab
```

Mảng RAID 1 của bạn giờ sẽ tự động lắp ráp và gắn kết mỗi khi khởi động lại.

### Kết luận
Bạn đã hoàn tất việc thiết lập mảng RAID 1. Nếu muốn thử nghiệm với một loại RAID khác, hãy làm theo hướng dẫn thiết lập lại mảng như trong phần đầu của bài viết này.
