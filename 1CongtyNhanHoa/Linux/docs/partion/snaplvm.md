
# 1. Tính năng Snapshot của LVM
____

## Mục lục

- [1.1 Snapshot là gì?](#about)
- [2.2 Cách tạo snapshot](#create)
- [1.3 Cách sử dụng Snapshot](#)
____

## <a name="content">Nội dung</a>

### <a name="about">1.1 Snapshot là gì?</a>

- Snapshot trong LVM là tính năng cho phép tạo một bản sao lưu dữ liệu của một Logical Volume (LV) tại thời điểm cụ thể.
- Snapshot cung cấp khả năng phục hồi dữ liệu cho LV về trạng thái trước thời điểm tạo snapshot.

### <a name="create">1.2 Cách tạo snapshot</a>

Bài viết này sử dụng các tài nguyên từ các phần trước, với các số liệu sau:

- 2 Logical Volumes:
  - `/dev/LVMVolGroup/Public` 2GiB
  - `/dev/LVMVolGroup/Private` 1GiB
- 1 Volume Group:
  - `LVMVolGroup` còn trống 1GiB
- 4 Physical Volumes:
  - `dev/sdb, /dev/sdc, /dev/sdd, /dev/sde`

Snapshot sẽ được tạo cho Logical Volume `/dev/LVMVolGroup/Private`.

#### Các bước tạo Snapshot:

1. Kiểm tra dung lượng trống trong Volume Group:

   ```bash
   vgdisplay LVMVolGroup
   ```

   Kết quả hiển thị:

   ```
   --- Volume group ---
   VG Name               LVMVolGroup
   VG Size               3.98 GiB
   Free  PE / Size       252 / 1008.00 MiB
   ```

   Dung lượng còn trống là `252 PE` tương ứng với `1008.00 MiB`. Ta sẽ sử dụng một phần dung lượng này để tạo snapshot cho `/dev/LVMVolGroup/Private`.

2. Tạo snapshot:

   ```bash
   lvcreate -l 50 --snapshot -n Private_Snapshot /dev/LVMVolGroup/Private
   ```

   Kết quả hiển thị:

   ```
   Logical volume "Private_Snapshot" created.
   ```

3. Kiểm tra kết quả:

   Sử dụng lệnh `lvs` để kiểm tra các Logical Volumes:

   ```
   LV               VG          Attr       LSize    Pool Origin  Data%  Meta%  Move Log Cpy%Sync Convert
   Private          LVMVolGroup owi-aos---    1.00g
   Private_Snapshot LVMVolGroup swi-a-s---  200.00m      Private 0.00
   Public           LVMVolGroup -wi-ao----    2.00g
   ```

   Snapshot `Private_Snapshot` đã được tạo thành công, có kích thước 200MiB.

4. Để thay đổi dung lượng của snapshot hoặc xóa nó, bạn có thể sử dụng các lệnh như sau:

   - Thêm dung lượng cho snapshot:

     ```bash
     lvextend -L +1G /dev/LVMVolGroup/Private_Snapshot
     ```

   - Xóa snapshot:

     ```bash
     lvremove /dev/LVMVolGroup/Private_Snapshot
     ```

### <a name="">1.3 Cách sử dụng Snapshot</a>

Để phục hồi một snapshot cho Logical Volume, bạn cần phải **unmount** LV trước và sau đó sử dụng snapshot.

#### Các bước phục hồi từ snapshot:

1. **Unmount Logical Volume**:

   ```bash
   umount -v /dev/LVMVolGroup/Private
   ```

2. **Merge snapshot vào Logical Volume**:

   ```bash
   lvconvert --merge /dev/LVMVolGroup/Private_Snapshot
   ```

   Sau khi chạy lệnh trên, snapshot `Private_Snapshot` sẽ bị xóa và dữ liệu từ snapshot sẽ được khôi phục vào LV gốc.

____


### **Ví dụ: Sao lưu hệ thống Linux với LVM Snapshot**

Giả sử ta đang quản lý một hệ thống Linux với **Volume Group (VG)** và các **Logical Volume (LV)** như sau:

- **Volume Group (VG)**: `ubuntu-vg`
- **Logical Volume chứa hệ thống (root filesystem)**: `/dev/ubuntu-vg/lv-0` (được mount tại `/`)

### **Mục tiêu**: Tạo snapshot của LV chứa hệ thống `/` để sao lưu mà không cần tắt hệ thống.

#### Bước 1: Kiểm tra trạng thái hệ thống

Trước khi thực hiện thao tác, kiểm tra các Logical Volumes hiện tại trên hệ thống:

```bash
sudo lvdisplay
```

Điều này sẽ hiển thị thông tin về các Logical Volumes, bạn sẽ tìm thấy LV gốc (root filesystem), chẳng hạn như `/dev/ubuntu-vg/lv-0`.

#### Bước 2: Tạo snapshot

Giả sử bạn muốn tạo một snapshot có dung lượng 1GB cho LV gốc `/dev/ubuntu-vg/lv-0` để sao lưu. Bạn có thể làm điều này bằng lệnh:

```bash
sudo lvcreate --size 1G --snapshot --name lv_snapshot /dev/ubuntu-vg/lv-0
```

Giải thích các tham số:
- `--size 1G`: Dung lượng của snapshot (1GB).
- `--snapshot`: Chỉ định đây là một snapshot.
- `--name lv_snapshot`: Tên của snapshot (có thể đặt tên tùy ý).
- `/dev/ubuntu-vg/lv-0`: Logical Volume mà bạn muốn tạo snapshot từ.

#### Bước 3: Kiểm tra snapshot

Sau khi tạo snapshot, bạn có thể kiểm tra lại bằng lệnh:

```bash
sudo lvdisplay
```

Lệnh này sẽ hiển thị thông tin về snapshot mà bạn vừa tạo, ví dụ `/dev/ubuntu-vg/lv_snapshot`.

#### Bước 4: Mount snapshot (nếu cần sao lưu)

Nếu bạn muốn sao lưu dữ liệu từ snapshot này, bạn có thể mount snapshot vào một thư mục tạm thời, ví dụ `/mnt/snapshot`:

```bash
sudo mkdir /mnt/snapshot
sudo mount /dev/ubuntu-vg/lv_snapshot /mnt/snapshot
```

Lúc này, bạn có thể sao lưu các tệp tin từ `/mnt/snapshot` vào bất kỳ hệ thống lưu trữ nào (đĩa cứng ngoài, NAS, v.v.).

#### Bước 5: Sao lưu dữ liệu

Bạn có thể sao lưu dữ liệu từ snapshot bằng cách sao chép hoặc sử dụng các công cụ sao lưu như `rsync`:

```bash
sudo rsync -av /mnt/snapshot/ /path/to/backup/
```

Hoặc sao chép các tệp tin quan trọng từ `/mnt/snapshot` tới một vị trí khác trên hệ thống.

#### Bước 6: Xóa snapshot sau khi sao lưu

Sau khi sao lưu xong, bạn có thể **xóa snapshot** để giải phóng không gian. Điều này có thể thực hiện bằng lệnh:

```bash
sudo lvremove /dev/ubuntu-vg/lv_snapshot
```

Lệnh này sẽ xóa snapshot và giải phóng dung lượng mà nó chiếm dụng trong Volume Group.

#### **Kết quả**:
- Bạn đã sao lưu hệ thống mà không cần phải tắt hệ thống hoặc gián đoạn các dịch vụ đang chạy.
- Snapshot giúp bạn giữ lại trạng thái của hệ thống tại thời điểm snapshot được tạo, và sao lưu các tệp tin từ snapshot mà không ảnh hưởng đến hoạt động của hệ thống.
- Sau khi sao lưu, bạn có thể tiếp tục làm việc mà không phải lo lắng về việc mất dữ liệu.

---

### **Ví dụ 2: Phục hồi hệ thống sau khi thay đổi**

Giả sử bạn đã thực hiện một số thay đổi quan trọng trên hệ thống và muốn đảm bảo rằng bạn có thể quay lại trạng thái ổn định nếu có sự cố.

1. **Tạo snapshot trước khi thay đổi**:
   - Trước khi thay đổi cấu hình hệ thống hoặc nâng cấp phần mềm, tạo snapshot của LV gốc `/dev/ubuntu-vg/lv-0`:
     ```bash
     sudo lvcreate --size 1G --snapshot --name lv_before_update /dev/ubuntu-vg/lv-0
     ```

2. **Thực hiện thay đổi**:
   - Sau đó, bạn có thể thực hiện các thay đổi, ví dụ: nâng cấp phần mềm, thay đổi cấu hình hệ thống.

3. **Phát hiện sự cố**:
   - Sau khi thực hiện thay đổi, bạn phát hiện ra rằng hệ thống gặp vấn đề (chẳng hạn như phần mềm không hoạt động đúng hoặc cấu hình bị sai).

4. **Phục hồi từ snapshot**:
   - Bạn có thể phục hồi hệ thống về trạng thái trước khi thay đổi bằng cách **gỡ bỏ snapshot cũ và restore snapshot**. Để làm điều này, bạn có thể **mount lại snapshot** và sao chép dữ liệu từ snapshot vào LV gốc.

   Ví dụ:
   ```bash
   sudo mount /dev/ubuntu-vg/lv_before_update /mnt/snapshot
   sudo rsync -av /mnt/snapshot/ / 
   ```

5. **Xóa snapshot sau khi phục hồi**:
   - Sau khi khôi phục hệ thống thành công, xóa snapshot để giải phóng không gian:
     ```bash
     sudo lvremove /dev/ubuntu-vg/lv_before_update
     ```

