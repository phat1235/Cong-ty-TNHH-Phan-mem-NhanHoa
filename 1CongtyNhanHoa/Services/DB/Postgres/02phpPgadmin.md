PostgreSQL: Cài đặt phpPgAdmin

Cài đặt phpPgAdmin để vận hành PostgreSQL trên trình duyệt web từ máy tính Client.
Cài đặt Apache2,
Cài đặt PHP,
Cài đặt phpPgAdmin.
```
root@dlp:~# apt -y install phppgadmin php-pgsql
root@dlp:~# vi /etc/phppgadmin/config.inc.php
```
#### dòng 105: đổi thành [false] nếu bạn cho phép đăng nhập bằng người dùng có đặc quyền như postgres, root
```
$conf['extra_login_security'] = true;
```
#### dòng 111: đổi thành [true] nếu bạn thiết lập cấu hình để chủ sở hữu cơ sở dữ liệu chỉ có thể xem cơ sở dữ liệu của riêng họ
```
$conf['owned_only'] = false;
root@dlp:~# vi /etc/apache2/conf-enabled/phppgadmin.conf
```
#### dòng 12: thiết lập quyền truy cập cho phpPgAdmin
```
Require local
Require ip 10.0.0.0/24
```
`root@dlp:~# systemctl restart apache2`

Truy cập vào [http://(tên máy chủ hoặc địa chỉ IP của máy chủ)/phppgadmin/] bằng trình duyệt web từ bất kỳ Máy khách nào trong Mạng mà bạn thiết lập cho phép. 

Sau đó, trang phpPgAdmin được hiển thị, Nhấp vào liên kết [PostgreSQL] ở ngăn bên trái.###

![](https://img001.prntscr.com/file/img001/NxUfoGVzTXipa9RQfS_qUQ.png)
