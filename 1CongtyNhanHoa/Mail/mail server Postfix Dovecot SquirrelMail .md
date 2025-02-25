
# Cài đặt Mail Server trên CentOS 7 với Postfix, Dovecot & SquirrelMail  

## 1. Thông tin hệ thống  
- **Hệ điều hành**: CentOS 7 64bit Minimal  
- **Địa chỉ IP**: `172.16.5.12/20`  
- **Tên miền**: `mail.nhanhoa1950.com`  

---

## 2. Gỡ bỏ MTA Sendmail (nếu có)  
Trước khi cài đặt Postfix, cần gỡ bỏ **Sendmail** vì đây là MTA mặc định trên CentOS:  
```bash
yum remove sendmail -y
```
Lệnh này giúp tránh xung đột giữa hai dịch vụ MTA - Mail Transfer Agent.



## 3. Cấu hình hostname  
Thiết lập hostname chính xác cho máy chủ:  
```bash
hostnamectl set-hostname mail.nhanhoa1950.com
```
Sau đó, chỉnh sửa file `/etc/hosts` để ánh xạ hostname với IP:  
```bash
vi /etc/hosts
```
Thêm dòng cuối hoặc chỉnh sửa nó:  
```
127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain4 
::1 localhost localhost.localdomain localhost6 localhost.localdomain6 
172.16.5.12 mail.nhanhoa1950.com
```
Lệnh này giúp đảm bảo máy chủ nhận diện đúng hostname khi gửi mail.

---

## 4. Tắt SELinux  
SELinux có thể gây cản trở dịch vụ mail, do đó cần vô hiệu hóa nó:  
Nên tắt đối với newpie vì nó khá là khó kiểm soát...
```bash
vi /etc/selinux/config
```
Tìm dòng:  
```
SELINUX=enforcing
```
Thay đổi thành:  
```
SELINUX=disabled
```
Sau đó, reboot hệ thống để áp dụng thay đổi:  
```bash
reboot
```

---

## 5. Cài đặt EPEL Repository  
EPEL cung cấp các gói phần mềm bổ sung cần thiết:  
```bash
yum install epel-release -y
```

---

## 6. Mở cổng tường lửa  
Mail Server cần mở các cổng dịch vụ SMTP, IMAP, POP3 và HTTP(S):  
```bash
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=25/tcp
firewall-cmd --permanent --add-port=110/tcp
firewall-cmd --permanent --add-port=143/tcp
firewall-cmd --permanent --add-port=993/tcp
firewall-cmd --permanent --add-port=995/tcp
firewall-cmd --permanent --add-port=587/tcp
firewall-cmd --reload
```
Các cổng này phục vụ:  
- **80**: HTTP (SquirrelMail Webmail)  
- **25**: SMTP (Gửi mail)  
- **110**: POP3 (Nhận mail)  
- **143**: IMAP (Nhận mail)  
- **993**: IMAP SSL  
- **995**: POP3 SSL  
- **587**: SMTP (TLS Authentication)  

---

## 7. Cài đặt và cấu hình Postfix  
Cài đặt Postfix:  
```bash
yum install postfix -y
```
Chỉnh sửa file cấu hình:  
```bash
vi /etc/postfix/main.cf
```
Cập nhật các tham số:  
```ini
# Đặt tên máy chủ
### Line 76 - Uncomment and set your mail server FQDN ##
myhostname = mail.nhanhoa1950.com

# Đặt domain chính
### Line 83 - Uncomment and set domain 
mydomain = nhanhoa1950.com

# Thiết lập giá trị gốc khi gửi mail
### Line 101 - Uncomment ##
myorigin = $mydomain

# Cho phép Postfix lắng nghe trên tất cả giao diện mạng
### Line 113 - Uncomment and Set ipv4 ##
inet_interfaces = all
### Line 121 - Change to all ##
inet_protocols = all

# Cấu hình đích mail
## Line 164 - Comment ##
#mydestination = $myhostname, localhost.$mydomain, localhost,
## Line 165 - Uncomment ##
mydestination = $myhostname, localhost.$mydomain, localhost, $mydomain

# Chỉ định mạng tin cậy
## Line 264 Uncomment and add IP range 
mynetworks = 172.16.0.0/20, 127.0.0.0/8

# Lưu email trong thư mục Maildir
## Line 419 - Uncomment ## 
home_mailbox = Maildir/
```
Kích hoạt và khởi động Postfix:  
```bash
systemctl enable postfix
systemctl restart postfix
```

---

## 8. Cài đặt và cấu hình Dovecot  
Cài đặt Dovecot: 

`yum install dovecot `
```bash
Configure
	vi /etc/dovecot/dovecot.conf ## 
		### Line 24 - umcomment ## 
		protocols = imap pop3 Imtp
	vi /etc/dovecot/conf.d/10-mail.conf
		## Line 24 - uncomment ## 
		mail location = maildir:~/Maildir
	vi /etc/dovecot/conf.d/10-auth.conf
		## Line 10 - uncomment## 
		disable plaintext_auth= yes
		## Line 100 - Add the word: "login" ## 
		auth_mechanisms = plain login
	vi /etc/dovecot/conf.d/10-master.conf
		## Line 91, 92 - Ugcomment and add "postfix"
		#mode = 0600
		user = postfix
		group = postfix
		[...]
```
Kích hoạt và khởi động Dovecot:  
```bash
systemctl enable dovecot
systemctl restart dovecot
```

---

## 9. Cài đặt và cấu hình SquirrelMail  
Cài đặt SquirrelMail:  
```bash
yum install squirrelmail -y
```
Chạy trình cấu hình:  
```bash
cd /usr/share/squirrelmail/config
./conf.pl
```
![](https://img001.prntscr.com/file/img001/tiCoDJevRTOH7VW2AMASeg.png)

![] (https://img001.prntscr.com/file/img001/OCfRWoodQAWxKvFt-jesDg.png)

Chỉnh sửa Apache để hỗ trợ SquirrelMail:  
```bash
vi /etc/httpd/conf/httpd.conf
```
Thêm vào cuối file:  
```apache
Alias /webmail /usr/share/squirrelmail 
<Directory /usr/share/squirrelmail> 
 Options Indexes FollowSymLinks 
 RewriteEngine On 
 AllowOverride All 
 DirectoryIndex index.php
 Order allow, deny
 Allow from all
</Directory>
```
Khởi động lại Apache:  
```bash
systemctl restart httpd
```

---

## 10. Tạo tài khoản mail  
Tạo người dùng và đặt mật khẩu:  
```bash
useradd info
passwd info

useradd phat1
passwd phat1

useradd phat2
passwd phat2
```

---

## 11. Truy cập Webmail  
Mở trình duyệt và truy cập:  
```
http://172.16.5.12/webmail
```
Đăng nhập bằng tài khoản vừa tạo (`info`, `phat1`, `phat2`).  
![](https://img001.prntscr.com/file/img001/tSdQ6hI6SpOz3lvjFatz3Q.png)
---

### Tổng kết  
Ta đã hoàn tất cài đặt Mail Server với Postfix, Dovecot và SquirrelMail trên CentOS 7. Hệ thống hiện đã có thể gửi và nhận email nội bộ. Nếu cần gửi email ra bên ngoài, ta sẽ cần cấu hình thêm **DKIM, SPF, DMARC**, cũng như relay SMTP nếu bị chặn port 25.
