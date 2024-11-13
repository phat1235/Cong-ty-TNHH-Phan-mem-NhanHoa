# Linux Partition
## **1) MBR và GPT**
- Là 2 tiêu chuẩn ổ cứng quy định cách thức nhập xuất dữ liệu , sắp xếp và phân vùng ổ đĩa .
- **MBR ( Master Boot Record )** : là `512 bytes` đầu tiên của 1 thiết bị lưu trữ . Nó chứa hệ thống nạp khởi động và **partition table** của ổ cứng . Nó đóng vai trò quan trọng trong quá trình khởi động hệ thống **BIOS** .
    - Hỗ trợ ổ cứng tối đa `2TB` 
    - Hỗ trợ tối đa `4` phân vùng / `1` ổ đĩa ( `3` **primary** + `1` **extended** )
- **GPT ( GUID Partition Table )** : là chuẩn mới thay thế cho **MBR** . Nó kết hợp với **UEFI** - đang thay thế **BIOS** trên nhiều mainboard
    - Hỗ trợ ổ cứng tối đa `1ZB` ( = `1 tỷ TB` )
    - Hỗ trợ tối đa `128` phân vùng / `1` ổ đĩa ( `128` **primary** )
    - Chỉ hỗ trợ các máy tính dùng chuẩn **UEFI**
## **2) Công cụ phân vùng ổ cứng**
### **2.1 ) `fdisk`**
- Chỉ để tạo phân vùng dưới `2TB`
- Chỉ hỗ trợ ổ cứng chuẩn **MBR** 
- Cấu trúc lệnh :
    ```
    # fdisk [options] [/dev/...]
    ```
    - **Options :** `-l` : liệt kê tất cả các ổ cứng và các partition
    - **Command** sử dụng trong lệnh :
        - `n` : tạo mới 1 partition
        - `p` : hiển thị **partition table**
        - `q` : thoát mà không lưu thay đổi
        - `w` : lưu thay đổi và thoát
        - `d` : xóa 1 partition
### **2.2) `gdisk`**
- Hỗ trợ ổ cứng chuẩn **GPT**
- Cấu trúc lệnh :
    ```
    # gdisk [options] [/dev/...]
    ```
    - **Options :** 
        - `-l` : liệt kê các ổ cứng và phân vùng chuẩn **GPT**
        - `-g` : chuyển ổ cứng từ **MBR** sang **GPT**
        - `-m` : chuyển ổ cứng từ **GPT** sang **MBR**
    - **Command** : tương đương lệnh `fdisk`
### **2.3) `parted`**
- Tên đầy đủ là **GNU Parted 3.x**
- Hoạt động với tất cả các chuẩn ổ cứng như **MBR** , **GPT** ,...
- Hỗ trợ nhiều tính năng hơn `fdisk` và cũng dễ sử dụng hơn .
- Cấu trúc lệnh : 
    ```
    # parted [options] [/dev/...]
    ```
    - **Options :** 
        - `-l` : liệt kê các ổ cứng và phân vùng
        - `-v` : hiển thị version của **GNU Parted**
    - **Command** :
        - `mkpart [type] [start] [end]` : tạo 1 phân vùng mới
            - **Type** : "`btrfs`" , "`ext3`" , "`ext4`" , "`fat16`" , "`fat32`" , "`hfs`" , "`linux-swap`" , "`ntfs`" , "`reiserfs`" , "`xfs`" + "`primary`" , "`logical`" , "`extended`"
            - **Start** , **End** : mặc định là đơn vị `MB`
        - `mklabel [label type]` : tạo nhãn cho ổ cứng
            - **Label Type** : "`gpt`" , "`msdos`" , "`loop`" , "`sun`" , "`mac`"
        - `name [partition_name]` : đặt tên cho phân vùng
            - Chỉ hoạt động trên ổ cứng chuẩn GPT , MAC , PC98
        - `print` : in ra ***partition table*** của ổ cứng
        - `quit` : thoát khỏi `parted`
        - `resizepart [partition][end]` : thay đổi kích cỡ partition
        - `rm [partition]` : xóa partition
        - `set [partition] [flag] [state]` : gắn cờ
            - **Flag** : "`boot`" , "`root`" , "`swap`" , "`hidden`" , "`raid`" , "`lvm`" , "`lba`" , "`legacy-boot`" , "`palo`"
            - **State** : `on` / `off`
        - `unit [unit]` : chọn đơn vị khi hiển thị trong `parted`
            - **Unit** : "`s`" ( sectors ) , "`B`" ( Bytes ) , "`kB`" , "`MB`" , "`MiB`" , "`GB`" , "`TB`" , "`TiB`" , "`%`" ( phần trăm ổ đĩa ) , "`cyl`" ( cylinders )
### **2.4) `mkfs`**
- Là công cụ để format phân vùng
- Cấu trúc lệnh :
    ```
    # mkfs.[type] [/dev/...]
    ```
    - **Type :** "`xfs`" , "`ext4`" ,...Mặc định là `ext2`
### **2.5) `mkdir`**
### **2.6) `mount`**
### **VD : Tạo phân vùng 10GB từ 1 ổ cứng mới**
Để thêm và định dạng ổ cứng mới trên Ubuntu tại vị trí `/dev/sdb`, bạn có thể làm theo các bước sau:

1. **Xác định ổ đĩa mới**  
   Xác minh sự xuất hiện của ổ đĩa `/dev/sdb`:
   ```bash
   sudo fdisk -l
   ```
![](https://img001.prntscr.com/file/img001/h3D1ySsHTui1x6Leu3WDBQ.png)

2. **Tạo phân vùng mới**  
Chọn một tiêu chuẩn phân vùng Để thực hiện việc này, trước tiên bạn cần chỉ định tiêu chuẩn phân vùng để sử dụng.

Có hai tùy chọn: GPT và MBR. GPT là tiêu chuẩn hiện đại hơn, trong khi MBR được hỗ trợ rộng rãi hơn trong các hệ điều hành cũ hơn. 

Đối với máy chủ đám mây thông thường, GPT là tùy chọn tốt hơn. Để chọn tiêu chuẩn GPT, hãy chuyển đĩa bạn đã xác định để chia tách bằng mklabel gpt:
   Sử dụng `parted` để tạo phân vùng trên `/dev/sdb`:
   ```bash
  sudo parted /dev/sdb mklabel gpt
   ```
![](https://img001.prntscr.com/file/img001/wVCjcaa9SMiIC4-bZV5LKA.png)

3. **Tạo file system**  
   Tạo hệ thống tệp `ext4` trên phân vùng mới (giả sử phân vùng là `/dev/sdb1`):
   ```bash
   sudo mkfs.ext4 /dev/sdb1
   ```

4. **Tạo thư mục mount point**  
   Tạo thư mục để gắn kết ổ đĩa, ví dụ:
   ```bash
   sudo mkdir /mnt/newdisk
   ```

5. **Mount ổ đĩa**  
   Gắn phân vùng vào thư mục vừa tạo:
   ```bash
   sudo mount /dev/sdb1 /mnt/newdisk
   ```

6. **Cấu hình mount tự động (tùy chọn)**  
   Để ổ đĩa tự động mount khi khởi động, chỉnh sửa tệp `/etc/fstab`:
   ```bash
   sudo nano /etc/fstab
   ```
   Thêm dòng sau vào cuối tệp (đảm bảo UUID là chính xác):
   ```bash
   UUID=$(sudo blkid -s UUID -o value /dev/sdb1) /mnt/newdisk ext4 defaults 0 0
   ```

7. **Kiểm tra mount**  
   Đảm bảo ổ đĩa được mount thành công:
   ```bash
   df -h /mnt/data
   ```

![](https://img001.prntscr.com/file/img001/2t9zgd0cS7-2BoWZBn932w.png)
![](https://img001.prntscr.com/file/img001/g24jbw1ZSyi-heifs9_HoQ.png)
Ổ đĩa mới hiện đã được gắn kết và sẵn sàng sử dụng tại thư mục `/mnt/newdisk`.


---
# XÓA
Để tháo và xóa ổ đĩa đã thêm vào Ubuntu (ở đây là `/dev/sdb1`), bạn có thể thực hiện các bước sau:

1. **Unmount (tháo) ổ đĩa**  
   Tháo ổ đĩa khỏi thư mục mount point:
   ```bash
   sudo umount /mnt/newdisk
   ```

2. **Xóa cấu hình tự động mount trong `/etc/fstab`**  
   Nếu đã cấu hình để ổ đĩa tự động mount khi khởi động, mở tệp `/etc/fstab` và xóa dòng cấu hình cho `/dev/sdb1`:
   ```bash
   sudo nano /etc/fstab
   ```
   Xóa dòng tương ứng với `/mnt/newdisk` và lưu lại.

3. **Xóa phân vùng (nếu muốn)**  
   Để xóa phân vùng trên ổ đĩa `/dev/sdb`, sử dụng `fdisk`:
   ```bash
   sudo fdisk /dev/sdb
   ```
   - Nhấn `d` để xóa phân vùng.
   - Chọn phân vùng muốn xóa (hoặc chỉ cần nhấn `Enter` nếu có một phân vùng duy nhất).
   - Nhấn `w` để lưu và thoát.

4. **Xóa thư mục mount point (nếu cần)**  
   Nếu không cần dùng thư mục mount nữa, bạn có thể xóa nó:
   ```bash
   sudo rmdir /mnt/newdisk
   ```

Ổ đĩa `/dev/sdb` đã được tháo và các phân vùng đã được xóa nếu bạn đã thực hiện các bước trên.


