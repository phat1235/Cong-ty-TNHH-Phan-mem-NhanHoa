# Hướng dẫn cấu hình và sử dụng iDRAC trên server Dell

## 1. Tổng quan về iDRAC
iDRAC (Integrated Dell Remote Access Controller) là một công cụ quản lý từ xa được tích hợp sẵn trên các dòng máy chủ Dell, giúp giám sát, chẩn đoán sự cố, và quản lý phần cứng mà không cần truy cập trực tiếp vào server. Đặc biệt, iDRAC hỗ trợ quản trị hệ thống từ xa qua giao diện web, giúp người quản trị thao tác mà không cần di chuyển đến trung tâm dữ liệu.

Đối với dòng **PowerEdge Server** thế hệ 12 trở lên, iDRAC được tích hợp sẵn và sử dụng một cổng RJ45 riêng để cấu hình mạng, cho phép kết nối và quản lý từ xa. Chức năng này giúp kỹ sư hệ thống tiết kiệm thời gian và nhanh chóng xử lý các sự cố tiềm ẩn.

![](https://img001.prntscr.com/file/img001/x0CK0ynVRwO2QA5Re0Zguw.png)


## 2. Cài đặt IDRAC

### B1: Thực hiện Boot máy sau khi màn hình hiển thị các thông tin như trên màn hình, ta lựa chọn `F2` để vào `System Setup`.
![](https://img001.prntscr.com/file/img001/lKLZUzfBRJeJkfxaX_tgGw.png)

### Ta đợi quá trình boot vào setting

![](https://img001.prntscr.com/file/img001/Uh4KD98LQ0qua5McWJ0pYA.png)

### B2: Sau khi đã load xong vào setting, ta lựa chọn `IDRAC SETTING` để cài đặt IDRAC

![](https://img001.prntscr.com/file/img001/GshUnRSSTfWGY-BBAeQFcQ.png)

### B3: Sau khi vào được `IDRAC Setting` giao diện sẽ hiển thị các lựa chọn, ta chọn `Network` để cấu hình địa chỉ `IP` cho cổng `IDRAC`

![](https://img001.prntscr.com/file/img001/0IHl3vi6SGCM8VI3qAfXmw.png)

### B4: Cấu hình các thông số của IP 

![](https://img001.prntscr.com/file/img001/eElb4V4HT3qYIj_fk6bNWA.png)

### Quay trở lại tab Setup chọn `User Configuration`
![](https://img001.prntscr.com/file/img001/79RjvqtMQoO1kietJch6zA.png)

### B5:  Ta đặt `password` cho  `user ROOT`
![](https://img001.prntscr.com/file/img001/_SrunwqxSquhUbjyjtorWQ.png)

### Comfirm thay đổi và Reboot lại Server

![](https://img001.prntscr.com/file/img001/VmoYdBUWRi2MyQiaBJh8ng.png)

### B6: Ta dùng 1 Web Browser nhập địa chỉ IP vừa cấu hình ở phần setting IDRAC.
Đăng nhập bằng tài khoản - mật khẩu vừa tạo

User: root

Pass: *****
![](https://img001.prntscr.com/file/img001/UMFwQeURRmeklfOk4xm0ZA.png)

### Login thành công và hiển thi giao diện quản lý như bên dưới

![](https://img001.prntscr.com/file/img001/Fxdiv_QlR2-74jQfdeKCiw.png)

### Như vậy là mình đã hướng dẫn 1 số bước để cấu hình IDRAC cơ bản!
