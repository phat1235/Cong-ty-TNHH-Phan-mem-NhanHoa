## Hệ điều hành Ubuntu 18.04

### Cấu trúc hệ điều hành Linux
- Kiến trúc hệ điều hành **Linux** gồm 3 phần: **Kernel**, **Shell**, **Application**

<p align="center"><img src="https://i.imgur.com/rxmES6P.png" width="50%"></p>

### 1) Kernel (nhân)
- Phần cốt lõi của hệ điều hành, là cầu nối giữa phần cứng và các ứng dụng.
- **Kernel** chứa các module và thư viện để quản lý, giao tiếp với phần cứng và các ứng dụng. **VD:** Phiên bản Red Hat Linux 5 có dung lượng khoảng 2,5GB, nhưng phần nhân chỉ chiếm 47MB (khoảng 2%).
- **Kernel** trên **Ubuntu 18.04** có version `4.15.0`.
- Kernel cung cấp dịch vụ cho phần mềm thông qua các điểm vào (entry points), gọi là các lời gọi hệ thống (system calls).

<p align="center"><img src="https://i.imgur.com/hoTDKvB.png" width="70%"></p>

#### Các loại Kernel:
- **Microkernel:** Gồm các tính năng cần thiết như quản lý bộ vi xử lý, bộ nhớ và IPC, có tính linh hoạt cao và bảo mật tốt.
- **Monolithic Kernel:** Bao quát rộng, quản lý bộ vi xử lý, bộ nhớ, IRC, trình điều khiển, hệ thống file, và giao tiếp. **Linux** sử dụng loại này, cho phép truy cập trực tiếp đến phần cứng nhưng có thể gây bất ổn do nhiều chương trình chạy ở chế độ giám sát.
- **Hybrid Kernel:** Linh hoạt, chọn lựa các ứng dụng nào chạy ở chế độ user hoặc supervisor. **Windows** và **Mac OS X** sử dụng loại này.

#### Cấu trúc Module của Kernel:
- Các module chỉ tải vào kernel khi cần, giúp kernel có kích thước nhỏ và có thể thay thế mà không cần khởi động lại.
- Module phổ biến bao gồm điều khiển driver, file hệ thống...
- File kernel nằm trong `/boot`, ví dụ `vmlinuz-4.15.0-29-generic`, còn các module ở `/lib/modules/<phiên bản kernel>`.

#### Kiểm tra phiên bản Kernel hiện tại:
```bash
# uname -r
4.15.0-29-generic
```
- Ý nghĩa các phần:
    - `4`: phiên bản kernel.
    - `15`: phiên bản sửa đổi chính.
    - `0`: phiên bản sửa đổi phụ.
    - `29`: bản vá cuối cùng.

#### Xóa kernel cũ không cần dùng:
```bash
# apt remove linux-image-4.15.0-29-generic
```

### 2) Shell
- **Shell** là chương trình nhận lệnh từ người dùng hoặc ứng dụng, chuyển cho **Kernel** xử lý.
- Các loại Shell phổ biến:
    - **sh (Bourne Shell):** Shell nguyên thủy, đơn giản, dung lượng nhỏ.
    - **bash (Bourne-again Shell):** Mặc định trên **Linux**, hỗ trợ nhiều lệnh và cú pháp.
    - **csh (C Shell):** Được viết bằng ngôn ngữ C, hỗ trợ nhiều tính năng nâng cao.
    - Các loại khác như **ash**, **tsh**, **zsh**.

#### Dấu nhắc Shell (Shell Prompt)
- Dấu nhắc dòng lệnh thường kết thúc với ký tự `$` cho user thông thường và `#` cho user `root`.

### 3) Applications
- Là các ứng dụng và tiện ích mà người dùng cài đặt trên Linux như ftp, samba, proxy,...
