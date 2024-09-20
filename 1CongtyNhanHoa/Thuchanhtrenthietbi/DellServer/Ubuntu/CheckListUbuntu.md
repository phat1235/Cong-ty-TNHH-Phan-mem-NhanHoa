###
1.	###
### 1. Ta truy cập file `etc/ssh/sshd_config` và sửa `#Port 22 `thành `Port 2299`
2.	![](https://img001.prntscr.com/file/img001/pFepIgk8QyCiLsXeeCUOKQ.png)
### 2. Ta cấm luôn không cho root SSH 
3.	![](https://img001.prntscr.com/file/img001/0fAtB10pT8G9poTaamvLbw.png)
### Dùng lệnh `systemctl restart sshd` để cài lại cấu hình ssh
### Hiển thị lại xem SSH đã cấu hình lại chưa
4.	![](https://img001.prntscr.com/file/img001/2islQ9F9Tymx2MS0g5kOuQ.png)
### Thêm `RULE` cấm các ip khác không được SSH tới server. Chỉ cho phép ip `172.16.2.201`SSH tới
4.	![](https://img001.prntscr.com/file/img001/06n-0tJLSpWTFn6smjLdRQ.png)
### Test
5.	![](https://img001.prntscr.com/file/img001/s8C5Fj9rTm-HYHdZgeKOhg.png)
### Thử login bằng root và bị cấm
6.	![](https://img001.prntscr.com/file/img001/FnjVAQ6wQyuBtoIDPwfcbA.png)
### Đăng nhập bằng user khác ok
7.	![](https://img001.prntscr.com/file/img001/2Dl2e8bvSuSWu0GNkvlqfA.png)
### Ta sửa ip để xem có cấm bằng ip không
8.	![](https://img001.prntscr.com/file/img001/S6pmY7aXSXKPkJNww4ieqQ.png)
### Đã bị cấm .209 bị máy khác chiếm nên tôi chuyển sang .190
9.	![](https://img001.prntscr.com/file/img001/-p_GuBWXSq-IDZKrVynJJQ.png)
### Đặt lại là .201 và SSH thành công
10.	![](https://img001.prntscr.com/file/img001/P4nFHh94T2qroVARvgNxDw.png)

Dưới đây  phần hướng dẫn về các lệnh thời gian cơ bản:

---

### Các Lệnh Thời Gian Cơ Bản

#### 1. Xem Thời Gian Trên Server
Để xem thời gian hiện tại trên server, chúng ta sử dụng lệnh:
```bash
date
```
![](https://img001.prntscr.com/file/img001/KW2Qb7ptRRe6Uo7CrshT_Q.png)

#### 2. Xem Danh Sách Múi Giờ
Để liệt kê danh sách các múi giờ có sẵn, chúng ta chạy lệnh:
```bash
timedatectl list-timezones
```
![](https://img001.prntscr.com/file/img001/bYiNX9aVRAqRrqQgXfsANg.png)

#### 3. Sửa Múi Giờ
Để thay đổi múi giờ, chúng ta sử dụng lệnh:
```bash
sudo timedatectl set-timezone Asia/Ho_Chi_Minh
```

#### 4. Kiểm Soát Timesyncd với Timedatectl
Chúng ta có thể truy vấn trạng thái của timesyncd bằng cách chạy lệnh:
```bash
timedatectl
```
![](https://img001.prntscr.com/file/img001/sxy3fTlASOC0uxUh_rZsrw.png)

Kết quả sẽ in ra giờ địa phương và giờ quốc tế. Các thông số quan trọng bao gồm:
- `System clock synchronized: yes` - Thời gian đã được đồng bộ hóa thành công.
- `NTP service: active` - Timesyncd đã được thiết lập và chạy.

![](https://img001.prntscr.com/file/img001/tWBnXHy6RH2vszlbfj7ULA.png)

#### 5. Chuyển Sang NTPD
Trước khi cài đặt ntpd, chúng ta cần tắt timesyncd để tránh xung đột. Chúng ta thực hiện việc này bằng lệnh:
```bash
sudo timedatectl set-ntp no
```
![](https://img001.prntscr.com/file/img001/SIuFFaB3RRqYBSu3zDQO6g.png)

#### 6. Cài Đặt NTP
Tiếp theo, chúng ta cài đặt ntp với lệnh:
```bash
sudo apt install ntp
```
Ntpd sẽ tự động khởi động sau khi cài đặt hoàn tất. Chúng ta có thể kiểm tra trạng thái của ntpd bằng lệnh:
```bash
systemctl status ntp
```
![](https://img001.prntscr.com/file/img001/gBfYqWcYQOGK0WHvRRfTGA.png)

#### 7. Cấu Hình NTP
Máy chủ NTP được cấu hình sẵn với một số nhóm máy chủ trong tệp `/etc/ntp.conf`. Để thay đổi, chúng ta chỉnh sửa tệp này và thay thế danh sách mặc định bằng danh sách máy chủ từ trang web support.ntp.org.
![](https://img001.prntscr.com/file/img001/RM2Dd1gmT8CPmtKNfOh_MQ.png)
![](https://img001.prntscr.com/file/img001/5Gj-nXJ4TgSoLQeBSJjF3A.png)

Sau khi thực hiện thay đổi, khởi động lại dịch vụ NTP:
```bash
systemctl restart ntp
```

#### 8. Kiểm Tra Thông Tin Trạng Thái NTP
Để xem thông tin trạng thái đồng bộ hóa NTP và thời gian hệ thống, chúng ta sử dụng lệnh:
```bash
ntpq -p
```
![](https://img001.prntscr.com/file/img001/o7ntxQY9TGWTD1mlLpP0sQ.png)

#### 9. Khởi Động NTP Cùng Hệ Thống
Để đảm bảo ntp khởi động cùng hệ thống, chúng ta sử dụng lệnh:
```bash
systemctl enable ntp
```
![](https://img001.prntscr.com/file/img001/l20Ag8D6QmG3mSyLRvsvNg.png)

---
