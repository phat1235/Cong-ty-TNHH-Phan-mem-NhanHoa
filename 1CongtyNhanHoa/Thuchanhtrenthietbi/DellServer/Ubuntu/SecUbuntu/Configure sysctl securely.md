Dưới đây là một số quy tắc bổ sung có thể được thêm vào cấu hình `sysctl` để cải thiện bảo mật và kiểm soát lưu lượng mạng:

### 1. Chặn ICMP Echo Reply từ mạng bên ngoài

Ngoài việc chặn phản hồi ping từ mọi nguồn.

```bash
# Chặn phản hồi ICMP Echo Request (ping) từ mọi nguồn
net.ipv4.icmp_echo_ignore_all = 1

```
![](	https://img001.prntscr.com/file/img001/uY2hOdJiTX-T_En1Qa1xnw.png)


### 2. Kích hoạt tính năng bảo vệ đối với các gói SYN

Để tăng cường bảo mật cho các gói SYN, bạn có thể sử dụng các tham số sau:

```bash
# Kích hoạt SYN cookies
net.ipv4.tcp_syncookies = 1

# Giảm số lần thử lại khi gửi SYN-ACK
net.ipv4.tcp_synack_retries = 1
```

### 3. Tăng cường bảo mật cho các gói TCP

```bash
# Tắt việc chấp nhận các gói TCP từ địa chỉ IP không xác thực
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1

# Giới hạn số lượng gói TCP đang chờ xử lý
net.ipv4.tcp_max_syn_backlog = 512
```

### 5. Áp dụng thay đổi

Sau khi thêm các dòng trên vào tệp `/etc/sysctl.conf`, hãy áp dụng các thay đổi bằng lệnh:

```bash
sudo sysctl -p
```
![](https://img001.prntscr.com/file/img001/SGCqG2YKQoyeBbbAgPGimQ.png)
### 6. Kiểm tra cấu hình

Để xác nhận rằng các cấu hình đã được áp dụng, bạn có thể sử dụng lệnh:

```bash
sysctl -a | grep net.ipv4
```
![](https://img001.prntscr.com/file/img001/IhMCTvOrRYKlNKj95kQKbA.png)
