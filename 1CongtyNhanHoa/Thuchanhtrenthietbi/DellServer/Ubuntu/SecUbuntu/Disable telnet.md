
### Bước 1: Cài đặt Telnet
1. **Cài đặt gói `telnetd`:**

   Tiếp theo, cài đặt Telnet bằng lệnh sau:

   ```bash
   sudo apt-get install telnetd -y
   ```
![](https://img001.prntscr.com/file/img001/azsvXQiBRjm3kAyh_70JYw.png)
2. **Kiểm tra trạng thái dịch vụ Telnet:**

   Để đảm bảo rằng dịch vụ Telnet đang chạy, bạn có thể kiểm tra trạng thái của dịch vụ:

   ```bash
   sudo systemctl status inetd
   ```
![](https://img001.prntscr.com/file/img001/jIZMob8HSY-7iK70_CRGQQ.png)
   Nếu nó đang chạy, bạn sẽ thấy thông báo rằng dịch vụ này đang hoạt động.

### Bước 2: Xóa hoàn toàn Telnet

1. **Gỡ bỏ gói Telnet và dịch vụ inetd:**

   Để xóa Telnet và gói `inetd`, bạn sử dụng lệnh sau:

   ```bash
   sudo apt-get remove --purge telnetd openbsd-inetd -y
   ```

![](https://img001.prntscr.com/file/img001/jIZMob8HSY-7iK70_CRGQQ.png)
   Lệnh này sẽ xóa gói và các tệp cấu hình của nó.

2. **Xóa các gói không cần thiết:**

   Sau khi gỡ bỏ, hãy chạy lệnh sau để dọn dẹp các gói không còn cần thiết:

   ```bash
   sudo apt-get autoremove -y
   ```

![](https://img001.prntscr.com/file/img001/3X0mYtZBRCSILCNA72FSWg.png)
3. **Kiểm tra lại dịch vụ:**

   Cuối cùng, kiểm tra lại xem dịch vụ `inetd` đã bị xóa hoàn toàn hay chưa:

   ```bash
   sudo systemctl status inetd
   ```

![](https://img001.prntscr.com/file/img001/4nAS_233TVSa9ULwgxdSlQ.png)
   Bạn sẽ nhận được thông báo cho biết dịch vụ không tồn tại nếu nó đã bị gỡ bỏ thành công.


