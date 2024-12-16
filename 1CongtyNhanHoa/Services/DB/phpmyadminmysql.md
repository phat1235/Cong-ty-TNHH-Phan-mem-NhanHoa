CREATE USER 'remote_user'@'%' IDENTIFIED BY 'Phat12345@@@';
GRANT ALL PRIVILEGES ON *.* TO 'remote_user'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;


sudo mv server-key.pem /etc/mysql/mysql-server-key.pem
sudo mv server-cert.pem /etc/mysql/mysql-server-cert.pem 
sudo mv server-csr.pem /etc/mysql/mysql-server-csr.pem 

**Chọn phiên bản hoặc bản phân phối khác**  
Ubuntu 22.04  

### **Giới thiệu**  
Mặc dù nhiều người dùng cần sử dụng hệ quản trị cơ sở dữ liệu như MySQL, nhưng họ có thể không thoải mái khi chỉ tương tác với hệ thống qua giao diện dòng lệnh MySQL.  

phpMyAdmin được tạo ra để giúp người dùng tương tác với MySQL thông qua giao diện web. Trong hướng dẫn này, chúng ta sẽ tìm hiểu cách cài đặt và bảo mật phpMyAdmin để bạn có thể sử dụng nó một cách an toàn để quản lý cơ sở dữ liệu trên hệ thống Ubuntu.  

---

### **Hướng dẫn cài đặt và bảo mật phpMyAdmin trên Ubuntu**  

1. **Cài đặt phpMyAdmin**  
2. **Điều chỉnh xác thực và quyền người dùng**  
3. **Bảo mật phiên bản phpMyAdmin của bạn**  

---

### **Điều kiện tiên quyết**  
  
1. **Một máy chủ Ubuntu**: Máy chủ này cần có tài khoản không phải root với quyền quản trị và cấu hình tường lửa với `ufw`. Để thiết lập, hãy tham khảo hướng dẫn thiết lập máy chủ ban đầu cho Ubuntu.  
2. **LAMP stack (Linux, Apache, MySQL và PHP)**: Nếu chưa cài đặt, bạn có thể làm theo hướng dẫn cài đặt LAMP stack trên Ubuntu.  

Ngoài ra, khi sử dụng phần mềm như phpMyAdmin, cần lưu ý các khía cạnh bảo mật quan trọng vì:  
- Nó giao tiếp trực tiếp với MySQL.  
- Xử lý xác thực bằng thông tin đăng nhập MySQL.  
- Thực thi và trả về kết quả của các truy vấn SQL.  

Do đó, vì phpMyAdmin là ứng dụng PHP được sử dụng rộng rãi và thường xuyên bị nhắm mục tiêu tấn công, bạn không bao giờ nên chạy phpMyAdmin qua kết nối HTTP không mã hóa trên các hệ thống từ xa.  

Nếu bạn chưa có tên miền được cấu hình với chứng chỉ SSL/TLS, hãy tham khảo hướng dẫn bảo mật Apache với Let’s Encrypt trên Ubuntu. Điều này yêu cầu bạn đăng ký tên miền, tạo bản ghi DNS cho máy chủ và thiết lập Virtual Host của Apache.  

---

### **Bước 1 — Cài đặt phpMyAdmin**  
Bạn có thể sử dụng APT để cài đặt phpMyAdmin từ kho mặc định của Ubuntu.  

Đầu tiên, cập nhật danh sách gói của máy chủ với quyền sudo:  
```bash
sudo apt update
```  

Sau đó, cài đặt gói `phpmyadmin`. Đồng thời, tài liệu chính thức khuyến nghị cài thêm một số tiện ích mở rộng PHP để kích hoạt các tính năng nhất định và cải thiện hiệu suất.  

Nếu bạn đã cài đặt LAMP stack theo hướng dẫn trước, một số tiện ích mở rộng này đã được cài đặt cùng với gói PHP. Tuy nhiên, bạn nên cài đặt thêm các gói sau:  
- **php-mbstring**: Quản lý chuỗi không phải ASCII và chuyển đổi chuỗi sang mã hóa khác.  
- **php-zip**: Hỗ trợ tải lên các tệp .zip trên phpMyAdmin.  
- **php-gd**: Hỗ trợ Thư viện Đồ họa GD.  
- **php-json**: Cung cấp khả năng hỗ trợ JSON cho PHP.  
- **php-curl**: Cho phép PHP tương tác với các loại máy chủ khác nhau qua các giao thức khác nhau.  

Chạy lệnh sau để cài đặt các gói này:  
```bash
sudo apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl
```  

Khi được nhắc cấu hình, chọn các tùy chọn sau:  
![](https://img001.prntscr.com/file/img001/G9zUdWvqQguk8Qke4eHgbA.png) 

Nếu gặp lỗi với plugin `Validate Password`, thực hiện các bước sau:  

1. Mở MySQL prompt:  
   ```bash
   sudo mysql
   ```  

2. Vô hiệu hóa plugin này:  
   ```sql
   UNINSTALL COMPONENT "file://component_validate_password";
   ```  

3. Thử cài đặt lại:  
   ```bash
   sudo apt install phpmyadmin
   ```  

4. Bật lại plugin sau khi cài đặt:  
   ```sql
   INSTALL COMPONENT "file://component_validate_password";
   ```  

Kích hoạt tiện ích mở rộng `mbstring`:  
```bash
sudo phpenmod mbstring
```  
Khởi động lại Apache để áp dụng thay đổi:  
```bash
sudo systemctl restart apache2
```  

---

### **Bước 2 — Điều chỉnh xác thực và quyền người dùng**  
Hướng dẫn đầy đủ về cấu hình tài khoản MySQL root, tạo người dùng riêng, và thiết lập quyền hạn phù hợp.  

---

### **Bước 3 — Bảo mật phpMyAdmin**  
phpMyAdmin là mục tiêu phổ biến cho các cuộc tấn công, vì vậy bạn cần thực hiện các biện pháp bảo vệ để ngăn chặn truy cập trái phép. Một cách hiệu quả là sử dụng tính năng xác thực và ủy quyền `.htaccess` tích hợp sẵn của Apache.

---

#### **Kích hoạt .htaccess trong cấu hình Apache**

1. **Mở tệp cấu hình Apache của phpMyAdmin**  
   Sử dụng trình soạn thảo yêu thích để chỉnh sửa tệp `phpmyadmin.conf`. Ở đây, ta dùng `nano`:
   ```bash
   sudo nano /etc/apache2/conf-available/phpmyadmin.conf
   ```

2. **Thêm chỉ thị `AllowOverride All`**  
   Tìm phần `<Directory /usr/share/phpmyadmin>` trong tệp và thêm dòng `AllowOverride All`:
   ```
   <Directory /usr/share/phpmyadmin>
       Options SymLinksIfOwnerMatch
       DirectoryIndex index.php
       AllowOverride All
       . . .
   </Directory>
   ```

3. **Lưu tệp cấu hình và khởi động lại Apache**  
   Nhấn `CTRL + X`, sau đó nhấn `Y` và `ENTER` để lưu tệp.  
   Chạy lệnh sau để áp dụng thay đổi:
   ```bash
   sudo systemctl restart apache2
   ```

---

#### **Tạo tệp `.htaccess` cho phpMyAdmin**

1. **Tạo tệp `.htaccess` trong thư mục phpMyAdmin**  
   Sử dụng lệnh sau để tạo và mở tệp `.htaccess`:
   ```bash
   sudo nano /usr/share/phpmyadmin/.htaccess
   ```

2. **Thêm cấu hình bảo mật vào `.htaccess`**  
   Dán nội dung sau vào tệp:
   ```
   AuthType Basic
   AuthName "Restricted Files"
   AuthUserFile /etc/phpmyadmin/.htpasswd
   Require valid-user
   ```

   - **AuthType Basic**: Sử dụng phương pháp xác thực cơ bản.  
   - **AuthName**: Thông báo hiển thị trên hộp thoại xác thực. Hãy giữ chung chung để tránh lộ thông tin nhạy cảm.  
   - **AuthUserFile**: Đường dẫn tới tệp chứa mật khẩu.  
   - **Require valid-user**: Chỉ người dùng đã xác thực mới có quyền truy cập.  

3. **Lưu tệp `.htaccess`**  
   Nhấn `CTRL + X`, sau đó nhấn `Y` và `ENTER`.

---

#### **Tạo tệp mật khẩu với `htpasswd`**

1. **Tạo tệp mật khẩu `htpasswd`**  
   Dùng lệnh sau để tạo tệp `htpasswd` và thêm người dùng đầu tiên:
   ```bash
   sudo htpasswd -c /etc/phpmyadmin/.htpasswd username
   ```

   - Bạn sẽ được yêu cầu nhập và xác nhận mật khẩu.  
   - Tệp được tạo với mật khẩu đã được băm (hashed).

2. **Thêm người dùng bổ sung**  
   Để thêm người dùng khác, sử dụng lệnh này (bỏ cờ `-c`):
   ```bash
   sudo htpasswd /etc/phpmyadmin/.htpasswd additionaluser
   ```

3. **Khởi động lại Apache**  
   Kích hoạt cấu hình `.htaccess` bằng cách khởi động lại Apache:
   ```bash
   sudo systemctl restart apache2
   ```

---
![](https://img001.prntscr.com/file/img001/GBJ8I_rvR5epQQoGJvp2FA.png)
#### **Kiểm tra bảo mật**

1. Truy cập vào phpMyAdmin:
   ```
   https://domain_name_or_IP/phpmyadmin
   ```

2. Bạn sẽ thấy hộp thoại xác thực Apache yêu cầu nhập tài khoản và mật khẩu đã tạo ở trên.  
![](https://img001.prntscr.com/file/img001/bxN2EL0NQI-AGSqAxxXLDg.png)

3. Sau khi xác thực Apache, bạn sẽ được chuyển đến trang đăng nhập phpMyAdmin để nhập thông tin MySQL.  

---

### **Kết luận**

Bằng cách thêm một lớp xác thực không liên quan đến MySQL, bạn đã tăng cường bảo mật cho phpMyAdmin. Điều này giúp bảo vệ cơ sở dữ liệu của bạn khỏi các lỗ hổng bảo mật tiềm tàng.
  
