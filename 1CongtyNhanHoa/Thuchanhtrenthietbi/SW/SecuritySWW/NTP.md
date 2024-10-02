Để kích hoạt Network Time Protocol (NTP) trên thiết bị Cisco, bạn có thể thực hiện theo các bước sau để đảm bảo rằng tất cả các thiết bị mạng của bạn có thời gian chính xác và đồng bộ. Điều này rất quan trọng cho việc ghi log và phân tích sự cố.

### Bước 1: Đăng nhập vào thiết bị

 SSH để đăng nhập vào switch hoặc router Cisco của bạn.

### Bước 2: Chuyển vào chế độ cấu hình

```bash
enable
configure terminal
```

### Bước 3: Cấu hình NTP

1. **Đặt địa chỉ NTP server**:
   ```bash
   ntp server <name-ip>
   ```

   **Ví dụ**:
   ```bash
   ntp server 192.168.1.1
   ```

   Nếu bạn muốn sử dụng một NTP server công cộng, bạn có thể sử dụng địa chỉ như `pool.ntp.org` hoặc địa chỉ IP của một server NTP công cộng.

2. **Kiểm tra trạng thái NTP** (tùy chọn):
   ```bash
   show ntp associations
   ```

3. **Cấu hình múi giờ (nếu cần)**:
   Nếu bạn muốn đặt múi giờ cho thiết bị, hãy sử dụng lệnh sau:
   ```bash
   clock timezone <tên_múi_giờ> <số_giờ>
   ```

   **Ví dụ**:
   ```bash
   clock timezone UTC +7
   ```



### Kiểm tra cấu hình NTP

Để kiểm tra xem NTP đã được cấu hình đúng cách, bạn có thể sử dụng lệnh:

```bash
show ntp status
show ntp associations
```

### Dưới đây là các NTP server trên thế giới  
![](https://img001.prntscr.com/file/img001/f-sdQx_CRWWlb3sJw1JVsQ.png)
### Ta cấu hình bằng câu lệnh
![](https://img001.prntscr.com/file/img001/6vKXNJBVSUeWTmbvVya-_A.png)

![](https://img001.prntscr.com/file/img001/5JyFfOBsTTuSFP0kvYp5QA.png)

![](https://img001.prntscr.com/file/img001/W64t2f6jS8q2JAi3bEDGCw.png)
