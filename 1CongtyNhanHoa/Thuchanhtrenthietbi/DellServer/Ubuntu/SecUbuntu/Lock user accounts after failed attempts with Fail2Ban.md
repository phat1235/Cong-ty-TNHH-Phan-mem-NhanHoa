
### 1. Cài đặt Fail2Ban

### 2. Cấu hình Fail2Ban
Tạo bản sao của file cấu hình mặc định:
```bash
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
```

Mở file cấu hình để chỉnh sửa:
```bash
sudo nano /etc/fail2ban/jail.local
```

Tìm và chỉnh sửa các phần liên quan đến dịch vụ SSH (hoặc dịch vụ bạn muốn bảo vệ), hoặc là ta làm 1 dịch vụ mới như đăng nhập local.

```bash
[sshd]
enabled = true
logpath = %(sshd_log)s
```
![](	https://img001.prntscr.com/file/img001/3bT3h9_hQryML6ckKAnhAA.png
)
![](	https://img001.prntscr.com/file/img001/h0r8QxXTR2qxAp2FsEDoRg.png)
### 3. Bật Fail2Ban
Sau khi cấu hình, khởi động lại dịch vụ Fail2Ban:
```bash
sudo systemctl restart fail2ban
sudo systemctl enable fail2ban
```

### 4. Kiểm tra Fail2Ban
Để kiểm tra trạng thái của Fail2Ban:
```bash
sudo fail2ban-client status
```

Để kiểm tra trạng thái của jail SSH (hoặc dịch vụ đã cấu hình):
```bash
sudo fail2ban-client status sshd
```
![](	https://img001.prntscr.com/file/img001/7LSpA07pSfuAS3eOgn6yaQ.png)
![](	https://img001.prntscr.com/file/img001/TJ0Is4y7T4OdM-zP83Jshw.png)
![](	https://img001.prntscr.com/file/img001/mYDIhgSxQs6fi1jK8aER1w.png)
Giờ hệ thống của bạn sẽ khóa tài khoản sau một số lần đăng nhập thất bại.
