Cách cài đặt LAMP stack (Linux – Apache – MySQL/MariaDB – PHP) Ubuntu


LAMP stack là một công nghệ cơ bản được sử dụng rộng rãi để xây dựng và triển khai các ứng dụng web động. Thuật ngữ LAMP là viết tắt của các thành phần chính của nó: Linux (hệ điều hành), Apache (máy chủ web), MySQL hoặc MariaDB (hệ quản trị cơ sở dữ liệu), và PHP (ngôn ngữ lập trình).

**Linux (Hệ điều hành):**  
Là hệ điều hành mã nguồn mở và ổn định, thường được chọn làm nền tảng cho LAMP stack.  
Được lựa chọn vì tính linh hoạt, hiệu suất cao và tương thích với nhiều ứng dụng và dự án khác nhau.  

**Apache (Máy chủ web):**  
Apache HTTP Server là một máy chủ web phổ biến, mạnh mẽ và linh hoạt.  
Xử lý các yêu cầu HTTP từ người dùng và phản hồi bằng cách cung cấp nội dung web động và tĩnh.  

**MySQL hoặc MariaDB (Hệ quản trị cơ sở dữ liệu):**  
Cả MySQL và MariaDB đều là hệ quản trị cơ sở dữ liệu quan hệ mã nguồn mở.  
Được sử dụng để lưu trữ và quản lý dữ liệu cho các ứng dụng web.  

**PHP (Ngôn ngữ lập trình):**  
PHP là ngôn ngữ lập trình mã nguồn mở được tích hợp chặt chẽ với HTML.  
Được sử dụng để xây dựng các trang web động và tương tác với cơ sở dữ liệu.  

LAMP stack cung cấp môi trường phát triển đồng bộ và hiệu suất cao cho việc phát triển ứng dụng web. Nó được ưa chuộng trong cộng đồng phát triển vì sự ổn định, tích hợp liền mạch và khả năng mở rộng linh hoạt.

---

### **Yêu cầu trước khi cài đặt**  
- **Hệ điều hành:** Máy chủ Debian 
- **Quyền người dùng:** Người dùng root hoặc người dùng không phải root với quyền sudo.  

---

### **Cách cài đặt LAMP stack trên Debian**  

#### **Bước 1 – Cập nhật hệ thống**  
Để đảm bảo bạn đang sử dụng phiên bản phần mềm mới nhất trên hệ thống Debian của mình, trước khi tiến hành cài đặt, chạy lệnh sau để cập nhật thông tin về các gói phần mềm:

```bash
sudo apt update
```

#### **Bước 2 – Cài đặt Apache webserver**  
Chạy lệnh dưới đây để cài đặt Apache webserver trên hệ thống:

```bash
sudo apt install apache2 -y
```

Khởi động và kích hoạt dịch vụ Apache để tự động chạy cùng hệ thống khi khởi động lại:

```bash
sudo systemctl start apache2
sudo systemctl enable apache2
```

Kiểm tra trạng thái dịch vụ Apache và đảm bảo nó đang chạy trên hệ thống:

```bash
sudo systemctl status apache2
```

Điều chỉnh tường lửa để cho phép các cổng 80 (HTTP) và 443 (HTTPS) qua tường lửa UFW. Bỏ qua bước này nếu bạn không sử dụng tường lửa UFW.

```bash
sudo ufw enable
sudo ufw allow 80
sudo ufw allow 443
sudo ufw reload
sudo ufw status
```

Sau khi cài đặt xong Apache, thử truy cập địa chỉ `http://IP-Server` hoặc `http://FQDN`. Nếu kết quả như hình, có nghĩa là bạn đã cài đặt thành công.

#### **Bước 3 – Cài đặt MySQL/MariaDB server**  
Chạy lệnh dưới đây để cài đặt MySQL hoặc MariaDB server trên hệ thống:

### **Cài MySQL**  
```bash
sudo apt install mysql-server -y
```

### **Cài MariaDB**  
```bash
sudo apt install mariadb-server -y
```

Khởi động và kích hoạt dịch vụ MySQL/MariaDB để tự động khởi động lại cùng hệ thống mỗi khi máy tính khởi động lại:

### **Với MySQL**  
```bash
sudo systemctl start mysql
sudo systemctl enable mysql
```

### **Với MariaDB**  
```bash
sudo systemctl start mariadb
sudo systemctl enable mariadb
```

Kiểm tra trạng thái dịch vụ MySQL/MariaDB và đảm bảo nó đang chạy trên hệ thống:

```bash
sudo systemctl status mariadb
```

Tiếp theo, chúng ta cần cấu hình bảo mật cho MySQL/MariaDB bằng lệnh sau:

```bash
sudo mysql_secure_installation
```

Bạn cần trả lời một số câu hỏi như sau. Hãy chú ý đến thông tin được đánh dấu.

Sau khi thiết lập xong, thử đăng nhập vào MySQL/MariaDB với lệnh sau:

```bash
sudo mysql -uroot -p
```

#### **Bước 4 – Cài đặt PHP**  
PHP là ngôn ngữ lập trình phổ biến và được sử dụng rộng rãi giúp các ứng dụng web cung cấp các trang web động và các chức năng khác với sự trợ giúp của các module khác nhau. Để cài đặt PHP và các module cần thiết, chạy lệnh dưới đây:

```bash
sudo apt install php libapache2-mod-php -y
```

Sau khi cài đặt xong, chạy lệnh sau để kiểm tra phiên bản PHP đã cài:

```bash
php -v
```

Ví dụ, PHP phiên bản 8.2 đã được cài đặt:

#### **Bước 5 – Kiểm tra**  
LAMP stack đã được cài đặt thành công trên hệ thống Debian. Để kiểm tra PHP có hoạt động tốt với Apache, tạo một file tên là `phpinfo.php` trong thư mục gốc của Apache bằng lệnh sau:

```bash
sudo vim /var/www/html/php.info.php
```

Nhấn phím **i** để thêm nội dung mới dưới đây:

```php
<?php
     phpinfo();
?>
```

Lưu file bằng cách nhấn **Esc**, sau đó gõ lệnh `:x` và nhấn Enter.

Khởi động lại dịch vụ Apache để áp dụng các thay đổi:

```bash
sudo systemctl restart apache2
```

Cuối cùng, truy cập địa chỉ `http://IP-Server/phpinfo.php`, nếu kết quả hiển thị như hình dưới đây, có nghĩa là mọi thứ đã được cài đặt thành công.

