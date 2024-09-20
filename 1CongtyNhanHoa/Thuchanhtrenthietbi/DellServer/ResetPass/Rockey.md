### Sau đây mình sẽ huowgs dẫn các bạn reset password root
### Mình có 2 cách nhưng  2 cách na ná nhau :v
# Cách 1
### **Bước 1: Chỉnh sửa tham số hạt nhân**
Đầu tiên, khởi động lại hệ thống. Ở mục nhập đầu tiên của menu grub, nhấn `'e'` trên bàn phím để truy cập trình soạn thảo GRUB.
1.	![](https://img001.prntscr.com/file/img001/68fZ5aYCRi23Z-xoXZ527g.png)
#### Khi bạn đã truy cập shell của trình soạn thảo grub, hãy cuộn xuống cho đến khi bạn đến dòng bắt đầu bằng ‘linux’. 
#### Sử dụng phím mũi tên chuyển tiếp, điều hướng đến cuối dòng và thêm dòng sau vào lệnh.
Ta xóa rhgb quiet và thay thế bằng
```
rd.break
```

3.	![](https://img001.prntscr.com/file/img001/G51-3BZaRMSWfyCT0hUywg.png)
### Sau khi thay thế như hình bên dưới ta nhấn tổ hợp phím `CRT+X`
### Để có quyền truy cập vào chế độ khẩn cấp, hãy nhấn Ctrl + x.
![](https://img001.prntscr.com/file/img001/3VepgTAHSgumMX8EYOxgVA.png)
### Để đặt lại mật khẩu root, chúng ta cần truy cập vào thư mục `/sysroot` với quyền đọc và ghi. 
### Để làm như vậy, hãy gắn thư mục /sysroot với quyền đọc và ghi.
### Tiếp theo, thay đổi môi trường thư mục thành /sysroot.
4.	![](https://img001.prntscr.com/file/img001/dNPHEJRZT0C-LBpG8G92rw.png)
### Để đặt lại mật khẩu root, chỉ cần gõ lệnh sau. 
### Bạn sẽ được yêu cầu cung cấp mật khẩu mới và sau đó, hãy đặt lại mật khẩu đó.
7.	![](https://img001.prntscr.com/file/img001/_hZNYSu9QQO1QBKMlR4hsg.png)
### Sau khi đã đặt lại mật khẩu thành công ta
### Ta tạo 1 tệp ẩn với tên là `.autorelabel` trong thư mục gốc. Trong quá trình khởi động lại, SElinux sẽ phát hiện tệp này và gán nhãn lại tất cả các tệp trên hệ thống với nhãn thích hợp 
8.	![](https://img001.prntscr.com/file/img001/FD3BT2GHQVqUIX5X9q3PkA.png)
### Khi bạn đã hoàn tất, hãy thoát khỏi môi trường /sysroot
9.	![](https://img001.prntscr.com/file/img001/qlDV7M0-RDCaH1kmShV-8A.png)
### Khởi động lại hệ thống và chờ đời, khá là lâu vì nó đang thực hiện gán nhãn lại các tệp file hệ thống.
10.	![](https://img001.prntscr.com/file/img001/cOVP28SlQw-gkFpaBkmvRw.png)

# Cách 2
### Đầu tiên, khởi động lại hệ thống. Ở mục nhập đầu tiên của menu grub, nhấn `'e'` trên bàn phím để truy cập trình soạn thảo GRUB.
11.	![](https://img001.prntscr.com/file/img001/YF1NjrOET1a3z6HDn3rM0A.png)
### Ta sửa `ro` thành `rw init=/sysroot/bin/sh`
12.	![](https://img001.prntscr.com/file/img001/XHoooKaFQc-F_7B4CaV0yQ.png)
### Dùng lệnh `chroot /sysroot` để chuyển tới thư mục gốc
### Sau đó dùng lệnh `passwd username` để đặt lại mật khẩu của tài khoản bạn cần đặt lại
### Ta tạo 1 tệp ẩn với tên là `.autorelabel` trong thư mục gốc. Trong quá trình khởi động lại, SElinux sẽ phát hiện tệp này và gán nhãn lại tất cả các tệp trên hệ thống với nhãn thích hợp 
### Rồi exit exit, and reboot lại 
13.	![](https://img001.prntscr.com/file/img001/uFFwOkONTGiuszzWUQyc-w.png)
### Tut
14.	![](https://img001.prntscr.com/file/img001/A8i98XYxQ6yeT2EJlSx3CQ.png)
15.	![](https://img001.prntscr.com/file/img001/BeWQRytDTKKaRIzsk6q6yg.png)
