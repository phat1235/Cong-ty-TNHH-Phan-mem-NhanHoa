
---

**Cài đặt cPanel trên Rocky Linux 9**  
**Mục lục**  
**Các bước chuẩn bị**  
1. Tạo khóa SSH trên máy tính cục bộ và thêm vào nhà cung cấp đám mây.  
2. Đăng nhập qua SSH, cập nhật và cài đặt các gói.  
3. Đổi tên máy chủ (hostname).  
4. Thêm hostname vào DNS của Cloudflare.  
5. Tạo tệp swap.  
6. Vô hiệu hóa SELinux.  
7. Cài đặt cPanel.  

**Sau khi cài đặt:**  
8. Cấu hình tường lửa Firewalld trên Rocky Linux.  
9. Kích hoạt giấy phép cPanel/WHM.  

**Bảo mật máy chủ cPanel:**  
10. Cài đặt CSF (ConfigServer Security & Firewall).  
11. Đổi cổng SSH.  

**Các lệnh bổ sung.**  

---

### **Các bước chuẩn bị**  

**1. Tạo khóa SSH trên máy tính cục bộ và thêm vào nhà cung cấp đám mây**  
Tạo khóa SSH và thêm nó vào nhà cung cấp đám mây để sử dụng khi triển khai máy chủ. Tạo thư mục để lưu trữ khóa SSH và sau đó tạo khóa SSH loại ed25519. Ví dụ bên dưới lưu khóa tên là `mynewsshkeys` trong `~/.ssh/myrockykeys`.

```bash
mkdir -p ~/.ssh/myrockykeys
ssh-keygen -t ed25519 -f ~/.ssh/myrockykeys/mynewsshkeys
```

**2. Đăng nhập qua SSH, cập nhật và cài đặt các gói**  
Đăng nhập vào máy chủ bằng khóa SSH:  

```bash
ssh user@server-ip-address -i ~/.ssh/path-to-private-key
```

Sau đó cập nhật máy chủ và cài đặt các gói như `perl`, `wget`, `vim`, v.v. Một số gói có thể đã được cài đặt.  

```bash
sudo dnf update -y && sudo dnf install -y epel-release
sudo dnf install -y perl curl wget vim screen
```

**3. Đổi tên máy chủ (hostname)**  
Đặt hostname:  

```bash
hostnamectl set-hostname server.example.com
```

Sau đó thêm hostname vào tệp `/etc/hosts` như sau:  

```bash
# Sao lưu tệp hosts gốc
sudo cp /etc/hosts /etc/hosts.bak

# Thêm hostname mới
echo '192.0.3.3 server.example.com server' | sudo tee -a /etc/hosts
```

**4. Thêm hostname vào DNS của Cloudflare**  
Hướng dẫn thêm DNS vào Cloudflare.  

**5. Tạo tệp swap**  
Tạo tệp swap bằng một lệnh duy nhất (có thể thay đổi dung lượng (4G) hoặc tên (`mySwapfile`) nếu cần):  

```bash
sudo fallocate -l 4G /mySwapfile ; sudo chmod 600 /mySwapfile ; sudo mkswap /mySwapfile && sudo swapon /mySwapfile ; sudo sed -i '$a\/mySwapfile swap swap defaults 0 0' /etc/fstab
```

**6. Vô hiệu hóa SELinux**  
Mở tệp `/etc/selinux/config` và thay đổi trạng thái SELinux thành `disabled`:  

```bash
sudo vi /etc/selinux/config
# Sau khi chỉnh sửa, lưu và khởi động lại máy chủ
sudo reboot
```

Vô hiệu hóa tường lửa trước khi cài đặt:  

```bash
iptables-save > ~/firewall.rules
systemctl stop firewalld.service
systemctl disable firewalld.service
```

**7. Cài đặt cPanel**  
Sử dụng lệnh `screen` để đảm bảo phiên SSH không bị ngắt quãng. Nếu bị ngắt, có thể kết nối lại bằng `screen -r`.

```bash
screen
cd /home && curl -o latest -L https://securedownloads.cpanel.net/latest && sh latest
```

Đăng nhập vào cPanel/WHM:

```bash
# WHM
https://hostname.example.com:2087

# cPanel
https://hostname.example.com:2083

# Đặt mật khẩu cho root
passwd root
```

---
**Sau khi cài đặt:**  

**8. Cấu hình tường lửa Firewalld trên Rocky Linux**  
Các bản phân phối dựa trên RHEL, như Rocky Linux, sử dụng Firewalld làm giao diện cho tường lửa.  

Các cổng được cPanel sử dụng được liệt kê và mô tả [ở đây](https://docs.cpanel.net/installation-guide/system-requirements-rockylinux/).  

Cài đặt, kích hoạt và khởi động Firewalld (nó có thể đã được cài đặt sẵn):  

```bash
sudo dnf install firewalld -y && sudo systemctl enable --now firewalld
```

Cấu hình quy tắc tường lửa cho cPanel:  

```bash
/usr/local/cpanel/scripts/configure_firewall_for_cpanel
```

Kiểm tra trạng thái tường lửa:  

```bash
sudo firewall-cmd --state
```

Xem trạng thái hiện tại của tường lửa (những gì được phép):  

```bash
sudo firewall-cmd --list-all
# Hoặc chỉ kiểm tra các quy tắc cố định:
firewall-cmd --permanent --list-all
```

Liệt kê các dịch vụ có thể được kích hoạt/cho phép qua tường lửa:  

```bash
firewall-cmd --get-services
```

Cho phép một dịch vụ cụ thể qua tường lửa:  

```bash
firewall-cmd --permanent --add-service=http

# Cho phép nhiều dịch vụ
firewall-cmd --add-service={http,https}
```

Thêm một cổng cụ thể:  

```bash
sudo firewall-cmd --permanent --add-port=2053/tcp

# Thêm nhiều cổng
sudo firewall-cmd --permanent --add-port={80,8080,443}/tcp

# Thêm một dải cổng
sudo firewall-cmd --permanent --add-port=2379-2385/tcp
```

Liệt kê tất cả các cổng đã được cho phép:  

```bash
sudo firewall-cmd --list-ports
```

Xóa một cổng đã được cho phép:  

```bash
sudo firewall-cmd --permanent --remove-port=2053/tcp
```

Tải lại Firewalld để áp dụng các thay đổi:  

```bash
sudo firewall-cmd --reload
```

**9. Kích hoạt giấy phép cPanel/WHM**  
Kích hoạt giấy phép trong bảng điều khiển WHM sau khi đăng nhập.  

---

**Bảo mật máy chủ cPanel:**  

**10. Cài đặt CSF (ConfigServer Security & Firewall)**  
CSF không hoạt động cùng với Firewalld, vì vậy cần tắt Firewalld trước.  

```bash
sudo systemctl stop firewalld && sudo systemctl disable firewalld
```

Cài đặt CSF:  

```bash
cd /root &&
wget https://download.configserver.com/csf.tgz &&
tar -xzf csf.tgz &&
cd csf &&
./install.cpanel.sh
```

Sau khi cài đặt, bạn có thể thiết lập CSF qua giao diện WHM tại: **WHM » Home » Plugins » ConfigServer Security & Firewall**.  

**11. Đổi cổng SSH**  
Thêm cổng SSH mới vào Firewalld và chỉnh sửa cấu hình SSH.  

```bash
# Thêm cổng vào tệp cấu hình SSH
sudo vi /etc/ssh/sshd_config

# Thêm dòng: Port 999
```

Trong WHM, sử dụng chức năng "Quick Allow Port" của CSF để cho phép cổng SSH mới.  

Đăng nhập qua cổng mới:  

```bash
ssh user@server_ip -i ~/.ssh/path-to-private-key -p NewPortNumber
```

---

**Các lệnh bổ sung:**  

1. Chỉnh sửa SSH để chỉ cho phép xác thực bằng khóa cho root:  

```bash
vi /etc/ssh/sshd_config.d/mysshconfig
# Thêm dòng:
PermitRootLogin prohibit-password
```

2. Tạo alias (bí danh) cho tiện ích, thêm vào tệp `.bashrc` của người dùng:  

```bash
alias syd="systemctl reload"
alias syt="systemctl restart"
alias syp="systemctl stop"
alias de="dnf update"
alias dl="dnf install"
```

---
