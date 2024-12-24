Cách cài đặt WordPress 6 trên Ubuntu với LAMP stack  


WordPress là một trong những công cụ xây dựng website phổ biến nhất hiện nay. Đây là một cách đơn giản để có mặt trên mạng và rất phù hợp với những ai không biết lập trình và muốn một cách đơn giản và hiệu quả để chia sẻ và xây dựng câu chuyện của mình trên internet.

Trong bài hướng dẫn này, chúng ta sẽ sử dụng LAMP (Linux, Apache, MySQL/MariaDB, và PHP) để cài đặt WordPress 6 trên Ubuntu, đây là một kiến trúc máy chủ hỗ trợ WordPress bằng cách cung cấp hệ điều hành Linux, máy chủ web Apache, cơ sở dữ liệu MySQL/MariaDB, và ngôn ngữ lập trình PHP.

**Yêu cầu trước khi cài đặt:**  
- **Hệ điều hành:** Ubuntu 22.04 LTS | Ubuntu 20.04 LTS | Ubuntu 18.04 LTS  
- **Cài đặt LAMP stack trên hệ thống.**  
- **PHP 7.4 hoặc cao hơn.**  
- **MariaDB 10.5 hoặc cao hơn (MySQL 5.7 hoặc cao hơn).**  
- **Quyền người dùng:** Người dùng root hoặc người dùng không phải root với quyền root.  

---

### **Bước 1 – Cài đặt các extension PHP cần thiết cho WordPress**  
Đầu tiên, đảm bảo tất cả các gói phần mềm trên hệ thống của bạn đã được cập nhật bằng cách chạy lệnh dưới đây:

```bash
sudo apt update && sudo apt upgrade -y
```

Tiếp theo, cài đặt các extension PHP cần thiết cho WordPress:

```bash
sudo apt install -y vim unzip wget php php-common php-mysql php-xml php-xmlrpc php-curl php-gd php-imagick php-cli php-dev php-imap php-mbstring php-opcache php-soap php-zip php-intl
```

---

### **Bước 2 – Tạo cơ sở dữ liệu cho WordPress**  
Đăng nhập vào MySQL/MariaDB bằng mật khẩu bạn đã thiết lập cho người dùng root:

```bash
sudo mysql -uroot -p
```

Tạo một cơ sở dữ liệu mới tên là wp_db:

```sql
CREATE DATABASE wp_db;
```

Tạo một người dùng mới tên là wp_user và thiết lập mật khẩu là wp_PWD:

```sql
CREATE USER wp_user@localhost IDENTIFIED BY 'wp_PWD';
```

Cấp quyền đầy đủ cho người dùng wp_user đối với cơ sở dữ liệu wp_db:

```sql
GRANT ALL ON wp_db.* TO wp_user@localhost;
```

Tải lại và thoát khỏi máy chủ cơ sở dữ liệu:

```sql
FLUSH PRIVILEGES;
EXIT;
```

---

### **Bước 3 – Tải về phiên bản WordPress mới nhất**  
Trước tiên, vào thư mục `/var/www/html`:

```bash
cd /var/www/html
```

Chạy lệnh dưới đây để tải phiên bản WordPress mới nhất từ trang web chính thức:

```bash
sudo wget https://wordpress.org/latest.zip
```

Đảm bảo rằng bạn đã tải thành công:

```bash
ls
```

Tiếp theo, giải nén file `latest.zip` đã tải:

```bash
sudo unzip latest.zip
```

---

### **Bước 4 – Cấu hình thư mục WordPress**  
Theo mặc định, thư mục được tạo ra có tên là `wordpress`, bạn có thể đổi tên thành tên của mình:

```bash
sudo mv wordpress mysite ### Thay mysite = Tên của bạn
```

Điều chỉnh quyền sở hữu và quyền truy cập thư mục:

```bash
sudo chown -R www-data:www-data mysite
sudo chmod -R 755 mysite
```

---

### **Bước 5 – Cấu hình Apache cho WordPress**  
Tiếp theo, kích hoạt các module và cấu hình virtual host của máy chủ Apache bằng cách tạo một file cấu hình cho website của bạn.

Tạo một file cấu hình mới tên là `mysite.conf` trong thư mục `/etc/apache2/sites-available/`:

```bash
sudo vim /etc/apache2/sites-available/mysite.conf
```

Sao chép và dán nội dung dưới đây:

**Lưu ý:**  
- Thay `domain.com` bằng tên miền của bạn.  
- Thay `mysite` bằng tên bạn đã đặt cho thư mục.

```apache
<VirtualHost *:80>
	ServerAdmin your-email@domain.com

	DocumentRoot /var/www/html/mysite
	ServerName domain.com
	ServerAlias www.domain.com

	<Directory /var/www/html/mysite/>
		Options FollowSymLinks
		AllowOverride All
		Require all granted
	</Directory>

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
```

Lưu và thoát file, bằng cách nhấn **Esc** rồi gõ `:x` và nhấn **Enter**.

Tiếp theo, kích hoạt virtual host, module rewrite và vô hiệu hóa trang kiểm tra mặc định:

```bash
sudo a2ensite mysite.conf
sudo a2enmod rewrite
sudo a2dissite 000-default.conf
```

Sau đó, khởi động lại dịch vụ Apache để áp dụng thay đổi:

```bash
sudo systemctl restart apache2
```

---

### **Bước 6 – Cấu hình WordPress qua giao diện web**  
Giờ đây, cấu hình máy chủ của bạn đã hoàn tất, mở trình duyệt và truy cập vào địa chỉ `http://IP-Server` để thiết lập WordPress.
![](https://img001.prntscr.com/file/img001/EOgPTX6eRUSLk0iH_zIUMQ.png)
Chọn ngôn ngữ bạn muốn sử dụng và nhấn nút **Continues**:

Nhấn nút **Let’s go!** để bắt đầu cài đặt WordPress.

Nhập thông tin cơ sở dữ liệu, bao gồm: Tên cơ sở dữ liệu, Tên người dùng cơ sở dữ liệu, Mật khẩu cơ sở dữ liệu đã tạo ở bước 2 và nhấn nút **Submit**:

Sau đó nhấn **Run the installation**.

Nhập thông tin cho website của bạn, bao gồm: Tiêu đề site, Tên người dùng, Mật khẩu, Email và nhấn nút **Install WordPress**:

Chúc mừng bạn, bạn đã cài đặt thành công và nhấn nút **Log in**:

Cuối cùng, trang đăng nhập Admin sẽ xuất hiện, nhập tên người dùng và mật khẩu của bạn:



---
