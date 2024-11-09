**Bước 1: Cài đặt các phụ thuộc**  
Trên hệ thống Ubuntu của bạn, bạn cần cài đặt tất cả các phụ thuộc cần thiết để xây dựng và chạy WebVirtCloud trên Ubuntu 24.04 (Noble Numbat). Bắt đầu với việc cập nhật hệ thống.  
```bash
sudo apt update && sudo apt upgrade -y
```
Nếu cần khởi động lại, hãy thực hiện lệnh sau:
```bash
[ -e /var/run/reboot-required ] && sudo reboot
```
Sau khi hệ thống đã được cập nhật, tiếp tục cài đặt các gói phụ thuộc.
```bash
sudo apt install -y git libvirt-dev libxml2-dev libxslt1-dev \
libxslt1-dev zlib1g-dev libffi-dev libssl-dev supervisor gcc \
pkg-config libsasl2-dev libssl-dev libldap2-dev
```

**Bước 2: Cài đặt Python và các module**  
Phiên bản Python mới nhất trên Ubuntu 24.04 sẽ hoạt động tốt cho việc cài đặt WebVirtCloud. Cài đặt các gói bằng lệnh apt.
```bash
sudo apt install python3 python3-pip python3-venv
```
Kiểm tra phiên bản Python đã cài đặt.
```bash
$ python --version
Python 3.12.3
```

**Bước 3: Cài đặt máy chủ web Nginx**  
Chúng ta sẽ sử dụng nginx để phục vụ trang web WebVirtCloud. Cài đặt nginx.
```bash
sudo apt install nginx
```
Khởi động và kích hoạt dịch vụ nginx.
```bash
sudo systemctl enable --now nginx
```
Để kiểm tra xem dịch vụ có đang chạy không, sử dụng lệnh sau:
```bash
systemctl status nginx
```

**Bước 4: Cài đặt WebVirtCloud trên Ubuntu 24.04**  
Sử dụng git để lấy mã nguồn mới nhất của WebVirtCloud:
```bash
git clone https://github.com/retspen/webvirtcloud.git
```
Chuyển đến thư mục webvirtcloud:
```bash
cd webvirtcloud
```
Tạo tệp `settings.py` từ mẫu có sẵn.
```bash
cp webvirtcloud/settings.py.template webvirtcloud/settings.py
```
Tiếp theo, tạo mật khẩu bí mật bằng lệnh Python.
```bash
SECRET=$(python3 conf/runit/secret_generator.py)
```
Sử dụng `sed` để chèn mật khẩu vào tệp cấu hình.
```bash
sed -i "s|SECRET_KEY = \"\"|SECRET_KEY = \"$SECRET\"|" webvirtcloud/settings.py
```
Mở tệp `settings.py` và thêm tên máy chủ vào danh sách các nguồn đáng tin cậy cho các yêu cầu không an toàn.
```bash
$ nano webvirtcloud/settings.py
CSRF_TRUSTED_ORIGINS = ['http://localhost','http://webvirtcloud.example.com']
```
Thay thế `webvirtcloud.example.com` bằng tên máy chủ của bạn đã cấu hình trong DNS hoặc trong tệp `/etc/hosts`. Ví dụ:
```bash
192.168.1.10 webvirtcloud.example.com
```
Sao chép cấu hình nginx và supervisord:
```bash
sudo cp conf/nginx/webvirtcloud.conf /etc/nginx/conf.d
sudo cp conf/supervisor/webvirtcloud.conf /etc/supervisor/conf.d
```
Mở tệp cấu hình Nginx để chỉnh sửa.
```bash
sudo nano /etc/nginx/conf.d/webvirtcloud.conf
```
Đặt giá trị chính xác cho tên máy chủ và cấu hình các tệp log.
```nginx
server {
    listen 80;

    server_name webvirtcloud.example.com;
    access_log /var/log/nginx/webvirtcloud-access_log;
    error_log /var/log/nginx/webvirtcloud-error_log;
}
```
Sao chép thư mục webvirtcloud vào thư mục `/srv`.
```bash
cd ..
sudo mv webvirtcloud /srv
```
Tạo môi trường ảo cho WebVirtCloud.
```bash
cd /srv/webvirtcloud
python3 -m venv venv
```
Kích hoạt môi trường và cài đặt yêu cầu.
```bash
source venv/bin/activate
pip3 install -r conf/requirements.txt
```
Khởi tạo cơ sở dữ liệu và tạo các tệp tĩnh bằng các lệnh dưới đây.
```bash
python3 manage.py migrate
python3 manage.py collectstatic --noinput
```
Cấp quyền sở hữu cho người dùng web server.
```bash
sudo chown -R www-data:www-data /srv/webvirtcloud
```
Khởi động và kích hoạt dịch vụ nginx và supervisor.
```bash
sudo systemctl enable nginx supervisor
sudo systemctl restart nginx supervisor
```
Kiểm tra các dịch vụ được quản lý bởi supervisor xem có đang chạy không.
```bash
$ sudo supervisorctl status
novncd                           RUNNING   pid 3786, uptime 0:28:36
socketiod                        RUNNING   pid 3787, uptime 0:28:36
webvirtcloud                     RUNNING   pid 3788, uptime 0:28:36
```
Xác nhận dịch vụ đang hoạt động.
```bash
$ ss -tunelp|grep 8000
tcp   LISTEN 0      2048             127.0.0.1:8000      0.0.0.0:*    uid:33 ino:19338 sk:7 cgroup:/system.slice/supervisor.service <-> 
```

**Bước 5: Truy cập WebVirtCloud Dashboard**  
Truy cập URL cài đặt WebVirtCloud tại `http://yourserverhostname`.

Thông tin đăng nhập mặc định là:
- Tên đăng nhập: admin
- Mật khẩu: admin

Thay đổi mật khẩu của người dùng admin:  
Sau khi đăng nhập, chuyển đến góc trên bên phải nơi tên người dùng admin được hiển thị. Nhấp vào tên người dùng để thấy menu xổ xuống.

Nhấp vào “Profile” > “Edit Profile” > “Change Password”.

Nhập mật khẩu cũ là “admin“, sau đó nhập và xác nhận mật khẩu mới cho người dùng admin.

Đăng xuất khỏi bảng điều khiển quản trị và đăng nhập lại để kiểm tra mật khẩu mới.

