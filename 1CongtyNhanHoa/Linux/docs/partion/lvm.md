Quản lý thiết bị lưu trữ trong Linux bao gồm việc cấu hình, giám sát, phân vùng, định dạng, và gắn kết (mount) các thiết bị lưu trữ như ổ cứng, ổ SSD, ổ USB, hoặc các thiết bị mạng.    mount

### 1. **Kiểm tra các thiết bị lưu trữ hiện có**
Để kiểm tra các thiết bị lưu trữ đã kết nối với hệ thống, bạn có thể sử dụng các lệnh sau:

- **`lsblk`** (Liệt kê các thiết bị lưu trữ và phân vùng):
  ```bash
  lsblk
  ```
  Lệnh này hiển thị tất cả các thiết bị lưu trữ (bao gồm phân vùng) và cấu trúc của chúng.

- **`fdisk -l`** (Hiển thị thông tin chi tiết về các phân vùng):
  ```bash
  sudo fdisk -l
  ```

- **`blkid`** (Hiển thị UUID của các thiết bị lưu trữ):
  ```bash
  sudo blkid
  ```

- **`df`** (Kiểm tra dung lượng đã sử dụng của các thiết bị lưu trữ):
  ```bash
  df -h
  ```

### 2. **Phân vùng thiết bị lưu trữ**
Phân vùng giúp chia tách không gian của một thiết bị lưu trữ thành các phần nhỏ hơn, mỗi phần có thể sử dụng hệ thống tệp khác nhau.

- **`fdisk`**: Là công cụ phân vùng dòng lệnh phổ biến cho MBR (Master Boot Record).
  ```bash
  sudo fdisk /dev/sdX
  ```
  (Thay `sdX` bằng thiết bị thực tế, ví dụ `/dev/sda`).

  Các lệnh cơ bản trong `fdisk`:
  - **`n`**: Tạo phân vùng mới.
  - **`d`**: Xóa phân vùng.
  - **`t`**: Thay đổi loại phân vùng.
  - **`w`**: Lưu thay đổi.

- **`parted`**: Là công cụ phân vùng mạnh mẽ hỗ trợ cả MBR và GPT (GUID Partition Table).
  ```bash
  sudo parted /dev/sdX
  ```

- **`gparted`**: Giao diện đồ họa cho `parted`, rất dễ sử dụng nếu bạn muốn phân vùng mà không sử dụng dòng lệnh.

### 3. **Định dạng thiết bị lưu trữ**
Sau khi phân vùng, bạn cần phải định dạng mỗi phân vùng với một hệ thống tệp (filesystem). Một số hệ thống tệp phổ biến là ext4, xfs, và ntfs.

- **`mkfs`**: Dùng để định dạng phân vùng với hệ thống tệp cụ thể. Ví dụ:
  - Định dạng với **ext4**:
    ```bash
    sudo mkfs.ext4 /dev/sdX1
    ```
  - Định dạng với **xfs**:
    ```bash
    sudo mkfs.xfs /dev/sdX1
    ```
  - Định dạng với **ntfs** (cho Windows):
    ```bash
    sudo mkfs.ntfs /dev/sdX1
    ```

### 4. **Gắn kết (Mount) và hủy gắn kết (Unmount)**
Khi phân vùng và định dạng xong, bạn cần gắn kết phân vùng đó vào hệ thống tệp để có thể truy cập dữ liệu.

- **Gắn kết phân vùng**:
  - Để gắn kết phân vùng vào một thư mục, bạn dùng lệnh `mount`:
    ```bash
    sudo mount /dev/sdX1 /mnt/mydrive
    ```
    Trong đó, `/mnt/mydrive` là thư mục mà bạn muốn gắn kết thiết bị vào.

- **Kiểm tra các thiết bị đã gắn kết**:
  ```bash
  mount | grep /dev/sdX
  ```

- **Hủy gắn kết phân vùng**:
  - Để hủy gắn kết một thiết bị, dùng lệnh `umount`:
    ```bash
    sudo umount /mnt/mydrive
    ```

### 5. **Tự động gắn kết khi khởi động**
Để tự động gắn kết phân vùng khi hệ thống khởi động, bạn cần thêm thông tin vào tệp `/etc/fstab`.

- **Mở tệp fstab để chỉnh sửa**:
  ```bash
  sudo nano /etc/fstab
  ```

- **Thêm một dòng để gắn kết tự động**:
  ```bash
  UUID=<UUID_của_phân_vùng> /mnt/mydrive ext4 defaults 0 2
  ```
  Thay `<UUID_của_phân_vùng>` bằng UUID thực tế, mà bạn có thể lấy từ lệnh `blkid`.

### 6. **Kiểm tra và sửa lỗi hệ thống tệp**
- **`fsck`**: Công cụ dùng để kiểm tra và sửa lỗi hệ thống tệp. Ví dụ:
  ```bash
  sudo fsck /dev/sdX1
  ```

### 7. **Xóa phân vùng và thiết bị lưu trữ**
Nếu bạn không còn muốn sử dụng một phân vùng, bạn có thể xóa nó.

- **Dùng `fdisk` để xóa phân vùng**:
  - Chạy lệnh `fdisk` để xóa phân vùng:
    ```bash
    sudo fdisk /dev/sdX
    ```
  - Chọn `d` để xóa phân vùng và sau đó chọn phân vùng bạn muốn xóa.

- **Xóa hệ thống tệp**: Nếu bạn chỉ muốn xóa dữ liệu trên phân vùng mà không thay đổi cấu trúc phân vùng:
  ```bash
  sudo rm -rf /mnt/mydrive/*
  ```

### 8. **Quản lý LVM (Logical Volume Management)**
LVM cung cấp khả năng quản lý các nhóm lưu trữ (volume group) và các phân vùng ảo (logical volume), giúp bạn dễ dàng thay đổi kích thước phân vùng và nhóm lưu trữ.

- **Tạo volume group**:
  ```bash
  sudo vgcreate my_volume_group /dev/sdX
  ```

- **Tạo logical volume**:
  ```bash
  sudo lvcreate -L 10G -n my_logical_volume my_volume_group
  ```

- **Định dạng và gắn kết logical volume**:
  ```bash
  sudo mkfs.ext4 /dev/my_volume_group/my_logical_volume
  sudo mount /dev/my_volume_group/my_logical_volume /mnt/mydrive
  ```

### Tóm lại
Quản lý thiết bị lưu trữ trong Linux bao gồm nhiều thao tác như kiểm tra thiết bị, phân vùng, định dạng, gắn kết, và giám sát thiết bị lưu trữ. Các công cụ như `fdisk`, `parted`, `mkfs`, `mount`, và `lsblk` giúp bạn quản lý các thiết bị lưu trữ hiệu quả, trong khi các công cụ như `LVM` cung cấp sự linh hoạt cao hơn khi quản lý không gian lưu trữ.

---
---

Có, bạn có thể giảm kích thước của một Logical Volume (LV) trong LVM, nhưng việc này cần thận trọng để tránh mất dữ liệu. Quá trình giảm dung lượng thường yêu cầu bạn phải làm các bước sau:  

1. **Kiểm tra dung lượng đã sử dụng**:  
   Trước khi giảm, kiểm tra dung lượng thực tế đang sử dụng bằng lệnh:  
   ```bash
   df -h /đường/dẫn/gắn/kết
   ```

2. **Giảm kích thước hệ thống tệp (filesystem)**:  
   Nếu hệ thống tệp của bạn hỗ trợ giảm kích thước (như `ext4`), hãy thu nhỏ nó bằng lệnh:  
   ```bash
   resize2fs /dev/volume_group/logical_volume kích_thước_mới
   ```  
   Ví dụ:  
   ```bash
   resize2fs /dev/my_vg/my_lv 10G
   ```  

3. **Tháo Logical Volume** (nếu cần):  
   Đảm bảo không có hoạt động ghi/đọc bằng cách gỡ gắn kết:  
   ```bash
   umount /đường/dẫn/gắn/kết
   ```

4. **Giảm kích thước Logical Volume**:  
   Sau khi thu nhỏ hệ thống tệp, sử dụng lệnh sau để giảm kích thước Logical Volume:  
   ```bash
   lvreduce -L kích_thước_mới /dev/volume_group/logical_volume
   ```  
   Ví dụ:  
   ```bash
   lvreduce -L 10G /dev/my_vg/my_lv
   ```  

5. **Kiểm tra lại hệ thống tệp**:  
   Sau khi giảm kích thước, kiểm tra lại tính toàn vẹn của hệ thống tệp:  
   ```bash
   e2fsck -f /dev/volume_group/logical_volume
   ```

6. **Gắn lại Logical Volume**:  
   Nếu đã tháo Logical Volume, hãy gắn lại:  
   ```bash
   mount /dev/volume_group/logical_volume /đường/dẫn/gắn/kết
   ```  

### Lưu ý:  
- Sao lưu dữ liệu trước khi thực hiện, vì quá trình giảm có thể gây mất dữ liệu nếu không cẩn thận.  
- Một số hệ thống tệp không hỗ trợ giảm kích thước (như `xfs`). Trong trường hợp này, bạn cần tạo Logical Volume mới với kích thước mong muốn, sao chép dữ liệu và sau đó xóa Logical Volume cũ.
