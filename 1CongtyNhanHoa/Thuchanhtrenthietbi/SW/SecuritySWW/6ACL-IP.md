
### Bước 1: Đăng nhập vào thiết bị

Sử dụng console hoặc SSH để đăng nhập vào switch hoặc router Cisco của bạn.

### Bước 2: Chuyển vào chế độ cấu hình

```bash
enable
configure terminal
```

### Bước 3: Tạo một ACL

Tạo một Access Control List để cho phép các địa chỉ IP cụ thể truy cập vào thiết bị. Ví dụ, nếu bạn muốn cho phép địa chỉ IP `192.168.1.100` và chặn tất cả các địa chỉ khác:

```bash
ip access-list standard MANAGEMENT_ACCESS
permit 192.168.1.100
deny any
```

### Bước 4: Áp dụng ACL cho các dòng truy cập quản lý

Bạn sẽ áp dụng ACL cho các dòng console hoặc vty. Nếu bạn đang áp dụng cho các dòng vty (SSH, Telnet), thực hiện như sau:

```bash
line vty 0 4
access-class MANAGEMENT_ACCESS in
```

### Bước 5: Lưu cấu hình

Sau khi hoàn tất cấu hình, hãy lưu lại để đảm bảo các thay đổi không bị mất khi khởi động lại thiết bị.

```bash
end
write memory
```

### Bước 6: Kiểm tra cấu hình

Để kiểm tra xem ACL đã được áp dụng đúng cách, bạn có thể sử dụng lệnh sau:

```bash
show access-lists
show running-config | include access-class
```
![](https://img001.prntscr.com/file/img001/KqTvTeWmRFiKuZe7mFFx3g.png)
![](	https://img001.prntscr.com/file/img001/tNDqySc8T52_FLdqOnsOyA.png)
![](	https://img001.prntscr.com/file/img001/hdUQA-xfRF6I8JlEeY-0kg.png)
![](	https://img001.prntscr.com/file/img001/q7Trm9B_S12Tz9UCDpaMig.png)

