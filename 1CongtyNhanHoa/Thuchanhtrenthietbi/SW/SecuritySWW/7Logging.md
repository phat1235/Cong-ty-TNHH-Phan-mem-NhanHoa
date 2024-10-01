

### Bước 1: Chuyển vào chế độ cấu hình

```bash
enable
configure terminal
```

### Cấu Hình Logging vào Bộ Nhớ Nội Bộ

1. **Kích hoạt logging**:
   ```bash
   logging buffered <level>
   ```
   Trong đó `<level>` có thể là:
   - `debugging`
   - `informational`
   - `notifications`
   - `warnings`
   - `errors`
   - `critical`
   - `alert`
   - `emergencies`

   **Ví dụ**:
   ```bash
   logging buffered informational
   ```

2. **Kiểm tra log trong bộ nhớ**:
   ```bash
   show logging
   ```

### Cấu Hình Logging đến Máy Chủ Log Bên Ngoài

1. **Kích hoạt syslog**:
   ```bash
   logging on
   ```
Để bắt và cấu hình tất cả các cài đặt logging cần thiết cho việc giám sát, phản hồi sự cố và kiểm toán trên thiết bị Cisco, bạn có thể cấu hình các yếu tố sau:

### 1. **Cấu hình logging với buffer nội bộ**
- Lưu trữ logs trong bộ nhớ nội bộ của thiết bị để xem lại khi cần.

```bash
configure terminal
logging buffered 16384 debugging
```
- **16384** là kích thước của bộ đệm, và **debugging** là mức độ logging. Bạn có thể thay đổi kích thước bộ đệm và mức độ nếu cần.

### 2. **Cấu hình gửi logs tới Syslog Server**
- Gửi logs đến máy chủ Syslog bên ngoài để lưu trữ dài hạn và dễ dàng quản lý logs.

```bash
logging 172.16.2.201
logging trap informational
```
- Thay `Địa_chỉ_IP_máy_chủ_Syslog` bằng địa chỉ IP thực của máy chủ Syslog.
- **informational** là mức độ logs gửi tới máy chủ Syslog. Bạn có thể điều chỉnh mức này tùy theo yêu cầu.

### 3. **Kích hoạt timestamps cho logs**
- Thêm dấu thời gian vào logs để biết thời điểm xảy ra sự kiện.

```bash
service timestamps log datetime msec
```

### 4. **Kích hoạt sequence numbers cho logs**
- Đánh số thứ tự logs để theo dõi dễ dàng.

```bash
service sequence-numbers
```

### 5. **Bật logging cho console và monitor**
- Đảm bảo các logs hiển thị trên console và trong các phiên SSH/telnet.

```bash
logging console debugging
logging monitor debugging
```

### 6. **Cấu hình kích thước bộ đệm ngoại lệ**
- Điều chỉnh bộ đệm để ghi nhận các lỗi ngoại lệ (exception logging).

```bash
exception data-corruption
logging exception 4096
```

### 7. **Ghi logs vào file (tuỳ chọn)**
- Nếu bạn muốn ghi logs vào file trên thiết bị (nếu có đủ dung lượng), bạn có thể kích hoạt file logging.

```bash
logging file flash:logs.txt
```

### 8. **Cấu hình tối đa số lần đăng nhập thất bại**
- Giới hạn số lần đăng nhập SSH/Telnet thất bại trước khi khóa tài khoản.

```bash
ip ssh authentication-retries 3
```

### 9. **Xem cấu hình hiện tại của logging**
- Sử dụng lệnh dưới đây để kiểm tra tất cả các thiết lập logging đã cấu hình.

```bash
show running-config | include logging
```

### 10. **Lưu cấu hình**
- Sau khi cấu hình xong, lưu lại để đảm bảo các cài đặt không bị mất khi thiết bị khởi động lại.

```bash
write memory
```

### 11. **Xem logs trong buffer**
- Để kiểm tra logs hiện tại, bạn có thể sử dụng lệnh:

```bash
show logging
```

### Cấu hình tổng hợp:

```bash
configure terminal
logging buffered 16384 debugging
logging <Địa_chỉ_IP_máy_chủ_Syslog>
logging trap informational
service timestamps log datetime msec
service sequence-numbers
logging console debugging
logging monitor debugging
logging exception 4096
logging file flash:logs.txt
ip ssh authentication-retries 3
end
write memory
```

![](https://img001.prntscr.com/file/img001/l3u5byAcT4-1gopw68wUDQ.png)
![](https://img001.prntscr.com/file/img001/kIcu-hVBQS2CNSMz2tliog.png)
![](https://img001.prntscr.com/file/img001/gBxLnAoYT-e-4DNFQ5GdKg.png)
