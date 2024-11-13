### Swap File Trên Ubuntu 24.04

**Swap** là bộ nhớ ảo dùng trên Linux, sử dụng ổ cứng làm bộ nhớ khi hết RAM, nhưng tốc độ thấp hơn RAM, nhất là với máy không dùng **SSD**. Thiếu **swap** có thể dẫn đến lỗi dịch vụ như **MySQL** ngừng hoạt động. 

#### Các Bước Tạo Swap File

1. **Kiểm tra phân vùng swap hiện tại:**
   ```bash
   swapon -s
   ```
2. **Kiểm tra dung lượng còn trống:**
   ```bash
   df -h
   ```
3. **Tạo file swap 2GB:**
   ```bash
   dd if=/dev/zero of=/var/swapfile bs=1M count=2048
   ```
4. **Tạo phân vùng swap:**
   ```bash
   mkswap /var/swapfile
   ```
5. **Kích hoạt swap:**
   ```bash
   swapon /var/swapfile
   ```
6. **Kiểm tra trạng thái swap:**
   ```bash
   swapon -s
   ```
7. **Lưu cấu hình vào `/etc/fstab`:**
   ```bash
   echo '/var/swapfile none swap defaults 0 0' | sudo tee -a /etc/fstab
   ```
8. **Bảo mật file swap:**
   ```bash
   chown root:root /var/swapfile
   chmod 0600 /var/swapfile
   ```

#### Cấu Hình Swappiness

**Swappiness** quyết định mức RAM còn lại để kích hoạt swap, với giá trị từ `0` đến `100`. Đặt **swappiness** gần `0` (ví dụ `10`) để ưu tiên dùng RAM hơn.

- **Kiểm tra mức swappiness hiện tại:**
  ```bash
  cat /proc/sys/vm/swappiness
  ```
- **Chỉnh swappiness về 10:**
  ```bash
  sysctl vm.swappiness=10
  ```
- **Lưu vào `/etc/sysctl.conf`:**
  ```bash
  echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
  ```
  Khởi động lại hệ thống để áp dụng.

#### Thay Đổi Dung Lượng Swapfile

1. **Tắt swap:**
   ```bash
   swapoff /var/swapfile
   ```
2. **Xóa file swap:**
   ```bash
   rm -f /var/swapfile
   ```
3. **Tạo lại file swap mới (ví dụ 4GB):**
   ```bash
   dd if=/dev/zero of=/var/swapfile bs=1M count=4096
   ```
4. **Tạo phân vùng swap:**
   ```bash
   mkswap /var/swapfile
   ```
5. **Kích hoạt swap:**
   ```bash
   swapon /var/swapfile
   ```
6. **Bảo mật file swap:**
   ```bash
   chown root:root /var/swapfile
   chmod 0600 /var/swapfile
   ```
7. **Kiểm tra lại swap:**
   ```bash
   swapon -s
   ```

Lưu ý : Khi thay đổi dung lượng , Swappiness vẫn được giữ nguyên 
