Tiến hành Tạo USB Boot ESXI 7


Cài đặt VMware ESXi 7
Quá trình Boot USB diễn ra
![](https://img001.prntscr.com/file/img001/w2htFuoZRqieQP2CUCHZZQ.png)
![](https://img001.prntscr.com/file/img001/NP83qfnkQJuUyjUL99_OqQ.png)
### Nhấn phím Enter để tiếp tục bắt đầu quá trình cài đặt ESXi.

![](https://img001.prntscr.com/file/img001/Ap89jnkGT3ieIy1kx_P2pg.png)
### Chấp nhận Thỏa thuận Người dùng Cuối của VMware bằng cách nhấn phím F11.

![](https://img001.prntscr.com/file/img001/-mcrv3jiS9OeVEvuhmDf2w.png)
### Chọn đĩa cứng mà trên đó hệ điều hành ESXi sẽ được cài đặt. Trong trường hợp này, tôi chỉ có 1 thiết bị lưu trữ ổ đĩa ảo, nhấn phím Enter để tiếp tục.

![](https://img001.prntscr.com/file/img001/5iYJl-JwSd-e5dl9rlo5Qg.png)


![](https://img001.prntscr.com/file/img001/gRYi_0ctSO-uCyU4pEh20w.png)

### Giữ nguyên mặc định cho bố cục bàn phím “US Default”, nhấn phím Enter để tiếp tục.
![](https://img001.prntscr.com/file/img001/1Fzl9tMGQGykbCyv43XTUQ.png)
### Tiếp theo, nhập mật khẩu root và xác nhận rằng các mật khẩu khớp nhau sau khi đã xác nhận, nhấn nút Enter để tiếp tục
![](https://img001.prntscr.com/file/img001/Xw-KO0iGQdaFxVxv3QXjEw.png)
### F11 để cài đặt
![](https://img001.prntscr.com/file/img001/03RlYI4XQNet8yCCaVW-vw.png)
### Đợi chờ
![](https://img001.prntscr.com/file/img001/jJfqZmeQSyKPZqrjiYY3ew.png)
### Reboot sau khi đã cài đặt xong
![](https://img001.prntscr.com/file/img001/hgQs35FHQLqDZjwLOH57Pw.png)

![](https://img001.prntscr.com/file/img001/f7P5FJ8lSBaPZIAPYZNgtA.png)
### Ta dùng web browser rồi nhập địa chỉ 2 ip ở dưới để đăng nhập giao điện quản lý của WMWare ESXI
![](https://img001.prntscr.com/file/img001/e3KzdN1PSjCEWJN4G41jPA.png)
### Đây là giao diện của VMWare ESXI sau khi cài đặt xong
![](https://img001.prntscr.com/file/img001/pqdT9h1sRMm5Ljz_hE4xpg.png)
### Ta chỉnh IP động thành IP tĩnh thông qua IDRAC
![](https://img001.prntscr.com/file/img001/e3KzdN1PSjCEWJN4G41jPA.png)
### Nhấn F2 để vào chỉnh sửa hệ thống
### Đăng nhập tài khoản root
![](https://img001.prntscr.com/file/img001/xnDaJK2fTHOXO6UgcSTBKQ.png)
### Tiếp đến ta chọn `Configure Management Network ` để cấu hình địa chỉ IP 
### ENTER để vào
![](https://img001.prntscr.com/file/img001/Unx0G6eeT8G6pvu2-AbwsA.png)
### Đặt các thông số IP
![](https://img001.prntscr.com/file/img001/jRtXdnGKQDifyvDLiFK2sQ.png)
![](https://img001.prntscr.com/file/img001/pgXv5ysUQqWItFaaN4EMYQ.png)
