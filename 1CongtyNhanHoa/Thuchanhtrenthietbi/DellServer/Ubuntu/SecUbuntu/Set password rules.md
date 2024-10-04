### Cách Thiết Lập Chính Sách Mật Khẩu trên Linux Sử Dụng PAM

Thiết lập chính sách mật khẩu mạnh là yếu tố then chốt để bảo vệ hệ thống Linux khỏi các nguy cơ bảo mật. Trên Linux, công cụ chính để định nghĩa và quản lý các chính sách mật khẩu là **PAM** (Pluggable Authentication Modules), cụ thể là module **pam_pwquality** (trước đây được biết đến với tên pam_cracklib hoặc pam_passwdqc). Hướng dẫn này sẽ giúp bạn cấu hình chính sách mật khẩu bằng cách sử dụng pam_pwquality.

### Hướng Dẫn Cấu Hình Chính Sách Mật Khẩu

#### Bước 1: Cài Đặt

Đầu tiên, hãy đảm bảo rằng pam_pwquality đã được cài đặt trên hệ thống của bạn. Bạn có thể sử dụng trình quản lý gói của mình để cài đặt. Trên các hệ điều hành dựa trên Debian, bạn có thể sử dụng lệnh sau:

Cập nhật hệ thống trước bằng lệnh:

```bash
sudo apt-get update
```

Sau đó, cài đặt gói pam_pwquality bằng lệnh:

```bash
sudo apt-get install libpam-pwquality -y
```

#### Bước 2: Cấu Hình

Việc cấu hình pam_pwquality thường được thực hiện trong file `/etc/pam.d/common-password` trên các hệ điều hành dựa trên Debian, hoặc trong một file cấu hình ứng dụng cụ thể như `/etc/pam.d/sshd` cho SSH.

Chạy lệnh sau để chỉnh sửa file cấu hình:

```bash
sudo nano /etc/pam.d/common-password
```

Sau đó, thêm hoặc chỉnh sửa dòng sau trong file:

```bash
password requisite pam_pwquality.so retry=3 minlen=12 difok=3
```

Giải thích các tham số:
- `retry=3`: Cho phép người dùng thử lại nhập mật khẩu 3 lần nếu không đạt yêu cầu.
- `minlen=12`: Đặt độ dài mật khẩu tối thiểu là 12 ký tự.
- `difok=3`: Yêu cầu ít nhất 3 ký tự khác biệt so với mật khẩu trước đó.

#### Bước 3: Kiểm Tra và Áp Dụng

Sau khi cấu hình pam_pwquality, bạn có thể kiểm tra chính sách bằng cách thêm người dùng mới bằng lệnh `adduser`:

```bash
sudo adduser tomcat
```

Nếu bạn đặt mật khẩu ít hơn 12 ký tự, hệ thống sẽ hiển thị cảnh báo **BAD PASSWORD**.

#### Bước 4: File Cấu Hình Toàn Cục

Ngoài ra, bạn cũng có thể cấu hình các quy tắc chất lượng mật khẩu toàn cục trong file `/etc/security/pwquality.conf`. Mở file cấu hình bằng lệnh:

```bash
sudo nano /etc/security/pwquality.conf
```
![](	https://img001.prntscr.com/file/img001/NsX4EPIuQjq8UOhI6EbE9g.png)
Chỉnh sửa các dòng sau để thiết lập yêu cầu mật khẩu:

- `difok=3`: Yêu cầu ít nhất 3 ký tự phải khác với mật khẩu trước đó.
- `minlen=12`: Đặt độ dài mật khẩu tối thiểu là 12 ký tự.
- `dcredit=-1`: Yêu cầu ít nhất một chữ số.
- `ucredit=-1`: Yêu cầu ít nhất một ký tự viết hoa.
- `ocredit=-1`: Yêu cầu ít nhất một ký tự đặc biệt (như @, #, v.v.).
- `lcredit=-1`: Yêu cầu ít nhất một ký tự viết thường.


Dưới đây là kết quả khi ta tạo 1 mật khẩu không đúng với chính sách mật khẩu!
![](https://img001.prntscr.com/file/img001/_lDX4TTNQFOxHjDhB2DLJw.png)
