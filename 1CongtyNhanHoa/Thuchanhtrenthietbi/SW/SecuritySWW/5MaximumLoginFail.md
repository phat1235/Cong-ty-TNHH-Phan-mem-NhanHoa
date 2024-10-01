Để tạo các tài khoản cục bộ cho việc xác thực người dùng và cấu hình số lần xác thực thất bại tối đa trên thiết bị Cisco, bạn có thể thực hiện theo các bước sau:

### Bước 1: Đăng nhập vào thiết bị

Sử dụng console hoặc SSH để đăng nhập vào switch hoặc router Cisco của bạn.

### Bước 2: Chuyển vào chế độ cấu hình

```bash
enable
configure terminal
```

### Bước 3: Tạo các tài khoản cục bộ

Bạn có thể tạo các tài khoản cục bộ với các quyền khác nhau. Ví dụ:

```bash
username phat privilege 15 secret <mật_khẩu1>
username phat1 privilege 10 secret <mật_khẩu2>
username phat2 privilege 5 secret <mật_khẩu3>
```

**Ví dụ cụ thể**:

```bash
username phat privilege 15 secret PhatSecret123
username phat1 privilege 10 secret Phat1Secret456
username phat2 privilege 5 secret Phat2Secret789
```

### Bước 4: Cấu hình số lần xác thực thất bại tối đa

Bạn có thể cấu hình số lần xác thực thất bại tối đa cho các phiên kết nối (console, vty):

```bash
line vty 0 4
login local
exec-timeout 5 0
transport input ssh
login block-for 120 attempts 3 within 60
```

**Giải thích lệnh**:
- `login local`: Sử dụng xác thực cục bộ.
- `exec-timeout 5 0`: Thời gian chờ trước khi ngắt kết nối (5 phút).
- `login block-for 120 attempts 3 within 60`: Chặn địa chỉ IP nếu có 3 lần xác thực thất bại trong vòng 60 giây, và địa chỉ đó sẽ bị chặn trong 120 giây.

### Bước 5: Lưu cấu hình

Sau khi hoàn tất cấu hình, bạn cần lưu lại để đảm bảo các thay đổi không bị mất khi khởi động lại thiết bị.

```bash
end
write memory
```

### Kiểm tra cấu hình

Để kiểm tra các tài khoản cục bộ và cấu hình xác thực, bạn có thể sử dụng lệnh:

```bash
show running-config | include username
show running-config | include login block-for
```
![](https://img001.prntscr.com/file/img001/Ub40EQKMTKeRNslr9IAmEA.png)
![](https://img001.prntscr.com/file/img001/rl1jBkyEQ_eDE0X2lCJVIA.png)
![](https://img001.prntscr.com/file/img001/qY-w1HmERx6BcyNtPfS75A.png)
![](https://img001.prntscr.com/file/img001/538pPUJlSemici-WjirGbA.png)
![](https://img001.prntscr.com/file/img001/f_uh262MTFSkgStifIN7Pg.png)
![](https://img001.prntscr.com/file/img001/3UjQsfyCR3aMRI3GrZ0WQQ.png)
