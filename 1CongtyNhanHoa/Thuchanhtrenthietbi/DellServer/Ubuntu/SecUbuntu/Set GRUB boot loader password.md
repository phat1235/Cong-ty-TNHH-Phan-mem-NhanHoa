Dưới đây là ví dụ cụ thể về cách thiết lập mật khẩu cho GRUB boot loader trên Ubuntu 20:

### Bước 1: Tạo mật khẩu mã hóa cho GRUB

1. Mở terminal và chạy lệnh sau:
   ```bash
   sudo grub-mkpasswd-pbkdf2
   ```

2. Bạn sẽ được yêu cầu nhập mật khẩu mới (ví dụ: `my_secure_password`). Nhập và xác nhận mật khẩu:
   ```plaintext
   Enter password:
   Reenter password:
   ```

3. Sau khi hoàn tất, bạn sẽ nhận được một đầu ra tương tự như sau:
   ```plaintext
   PBKDF2 hash of your password is grub.pbkdf2.sha512.10000.XXXXXXXXXXXXXX...
   ```
![](https://img001.prntscr.com/file/img001/wVoPCiP9Q8W1xBPSEYdyXA.png)
   Ghi lại chuỗi mã hóa (hash) này. 

### Bước 2: Cập nhật tệp cấu hình GRUB

1. Mở tệp cấu hình GRUB bằng lệnh:
   ```bash
   sudo nano /etc/grub.d/40_custom
   ```

2. Thêm vào cuối tệp dòng sau (thay thế `GRUB_PASSWORD_HASH` bằng chuỗi mã hóa bạn đã tạo ở bước 1):
   ```bash
   set superusers="admin"
   password_pbkdf2 admin grub.pbkdf2.sha512.10000.XXXXXXXXXXXXXX...
   ```
![](https://img001.prntscr.com/file/img001/2TC0knKCRO2226-dNa4abQ.png)

Lưu lại và reboot lại máy thì phải nhập tk mật khẩu mớ vô được!
### Bước 3: Kiểm tra mật khẩu
![](https://img001.prntscr.com/file/img001/yV0IjBzpT4uz1NKqiwLCbQ.png)
1. Khởi động lại máy tính.
2. Khi màn hình GRUB xuất hiện, bạn sẽ thấy yêu cầu nhập mật khẩu. Nhập mật khẩu bạn đã thiết lập (trong ví dụ này là `...`).

Phòng trường hợp reset mật khẩu root!!!
