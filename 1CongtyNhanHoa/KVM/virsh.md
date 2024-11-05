**Virsh** là một công cụ dòng lệnh để quản lý ảo hóa trên KVM và các hypervisor hỗ trợ libvirt. Nó cung cấp một giao diện để thực hiện các tác vụ quản lý máy ảo như khởi động, dừng, cấu hình và giám sát.

### Virsh Client

- **Mô tả**: `virsh` là một phần của libvirt, một bộ công cụ giúp quản lý các hypervisor như KVM, QEMU, Xen, và nhiều hệ thống ảo hóa khác. `virsh` cho phép người dùng tương tác với các máy ảo và các nguồn lực ảo hóa từ dòng lệnh.

### Các Option Thông Dụng của Virsh Command

Dưới đây là một số lệnh và tùy chọn thông dụng khi sử dụng `virsh`:



1. **Liệt Kê Máy Ảo**:
   ```bash
   virsh list --all
   ```
   - Hiển thị danh sách tất cả các máy ảo (đang chạy và dừng).
![](https://img001.prntscr.com/file/img001/EHlloiNJQaqQJq5d8oh4Mw.png)
3. **Khởi Động Một Máy Ảo**:
   ```bash
   virsh start <vm-name>
   ```
   - Khởi động một máy ảo theo tên.

4. **Dừng Một Máy Ảo**:
   ```bash
   virsh shutdown <vm-name>
   ```
![](https://img001.prntscr.com/file/img001/csgQGmjvQX6bFXbAngC9Jg.png)
5. **Lập Kế Hoạch Dừng Máy Ảo**:
   ```bash
   virsh destroy <vm-name>
   ```
   - Dừng máy ảo ngay lập tức (không an toàn).

6. **Xóa Máy Ảo**:
   ```bash
   virsh undefine <vm-name>
   ```
   - Xóa định nghĩa của máy ảo (có thể kết hợp với `--remove-all-storage` để xóa luôn các ảnh đĩa).

7. **Xem Thông Tin Chi Tiết về Máy Ảo**:
   ```bash
   virsh dominfo <vm-name>
   ```
   - Hiển thị thông tin chi tiết về máy ảo như trạng thái, địa chỉ MAC, CPU, RAM...
![](https://img001.prntscr.com/file/img001/C_rRZ81SQGqK-yGp-JLUTw.png)
8. **Quản Lý Ảnh Đĩa**:
   ```bash
   virsh vol-list <pool-name>
   ```
   - Liệt kê các ảnh đĩa trong một pool lưu trữ.

9. **Tạo Máy Ảo từ File XML**:
   ```bash
   virsh define <file.xml>
   ```
   - Tạo máy ảo từ file cấu hình XML.


11. **Cập Nhật Cấu Hình**:
    ```bash
    virsh edit <vm-name>
    ```
    - Mở file cấu hình XML của máy ảo để chỉnh sửa.



### Tóm Tắt

`virsh` là một công cụ mạnh mẽ và linh hoạt để quản lý máy ảo trong môi trường KVM. Các lệnh và tùy chọn ở trên là một số lệnh thông dụng mà bạn có thể sử dụng để quản lý máy ảo một cách hiệu quả. Bạn có thể sử dụng `virsh --help` để xem danh sách đầy đủ các lệnh và tùy chọn có sẵn.
