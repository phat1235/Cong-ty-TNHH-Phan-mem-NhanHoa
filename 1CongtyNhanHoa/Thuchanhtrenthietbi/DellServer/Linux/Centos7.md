### Bước đầu tiên vẫn như mọi khi :v
## 1. Tạo máy ảo trên ESXi
#### Ở giao diện quản lý của ESXi, Vào “Virtual machines” => Chọn [ Create/Register VM ] để tạo máy ảo trên ESXi

![Image 1](https://img001.prntscr.com/file/img001/-xRmNkVuQ4WJCOX0ve3SIQ.png)
### Bước 1: Select creation type
=> Chọn “**Create a new virtual machine**” => bấm [**Next** ]

### Bước 2: Select a name and guest OS
Name: tên máy ảo

Guest OS family: Chọn loại HDH

Guest OS version: Chọn phiên bản của hệ điều hành
![Image 2](https://img001.prntscr.com/file/img001/Ffd-1vXET5qocaZMOtsC9A.png)
### Bước 3: Select storage
Chọn vị trí lưu trữ máy ảo => Bấm [ next ]
![Image 3](https://img001.prntscr.com/file/img001/1kCPDyqARFmzb_jX2FDjkQ.png)
### Bước 4: Customize Setting
Tùy chỉnh cài đặt cho máy ảo, ở mục CD/DVD Drive 1, chọn “Datastore ISO file”

Browser tới file .iso của hệ điều hành cần cài đặt => Bấm [ Select ]
![Image 4](https://img001.prntscr.com/file/img001/thWtd8h3SEOmAxzB7Ua4tw.png)
Cấu hình thông số máy ảo sau đó bấm [ Next ] để sang bước tiếp theo.
![Image 5](https://img001.prntscr.com/file/img001/vlAHnEWdSaqXemOrBiwV1w.png)
### Bước 5: Review lại thông tin cài đặt của máy ảo
=> bấm [ Finish ] để hoàn thành tạo máy ảo
![Image 6](https://img001.prntscr.com/file/img001/3W7Z-dzjQ1yds7eTRmzl6w.png)
Chọn máy ảo vừa tạo => Bấm [ Power on ] để khởi động máy ảo
![Image 7](https://img001.prntscr.com/file/img001/F9nR-iV8QBasE1oA3RnvMw.png)
## 2. Cài đặt Centos
- Khởi động VMware và chọn cài đặt Centos 7
![Image 8](https://img001.prntscr.com/file/img001/31_hyyABQdW4jlKfhI-ZGw.png)
![Image 9](https://img001.prntscr.com/file/img001/3aURrp4hRf2t832nGPK0qQ.png)
Lựa chọn ngôn ngữ: Tại bước này có thể chọn ngôn ngữ cài đặt, mặc định nên chọn English
![Image 10](https://img001.prntscr.com/file/img001/8fFP5T4GSf28WOu0WeDRFw.png)
+ Lựa chọn Date & Time.
![Image 11](https://img001.prntscr.com/file/img001/A_Osb0IMTTSIR1VKskva5Q.png)
+ Chọn của Việt Nam
![Image 12](https://img001.prntscr.com/file/img001/7XIBGE49QHSYOEoq8rPnEw.png)
+  Tiếp theo là lựa chọn các software cài đặt kèm. Mặc định Centos 7 sẽ cài bản "minimal" cho bạn, nếu bạn muốn xài GUI thì bạn có thể chọn KDE hoặc GNOME ... ngoài ra bạn có thể cài các service như DNS, FTP, SAMBA ... 
![Image 13](https://img001.prntscr.com/file/img001/CAKWJfAuT4Ow8b-0WVENKw.png)
- Ở đây các bạn có thể chọn chế đồ cài đặt tự động. Nhưng mình thích config bằng tay hơn
![Image 14](https://img001.prntscr.com/file/img001/8rLYg4ZPTgSrKlfb8GY-5w.png)
![Image 15](https://img001.prntscr.com/file/img001/9P1rDVzjT_ulPXNIDXFvaw.png)
- Partition "swap" các bạn nên để = 1,5 đến 2 lần RAM, partition "boot" = 256MB và còn lại là "/".
![Image 16](https://img001.prntscr.com/file/img001/pNQ1dcpXQWep9ctCYqr9Og.png)
- Mặc định file system của Centos 7 là "xfs". Nếu bạn đã quen xài EXT4 bạn có thể thay đổi vì nhiều người thích xài ext4 vì độ ổn định, tốc độ... mà các bản Centos trước hay dùng EXT4 Mình sẽ để mặc định để khám phá xem "xfs" có gì hot hơn EXT4 không 
![Image 17](https://img001.prntscr.com/file/img001/dc4M2BXcRMGUBtcCq85tzQ.png)
- Sau khi cấu hình xong ta lưu lại, lựa chọn `Accept Changes`
![Image 18](https://img001.prntscr.com/file/img001/nue1xDAaTfCRlvzTcP47Jg.png)
- Lựa chọn Network & Hostname
![Image 20](https://img001.prntscr.com/file/img001/wfNnnzytT02Z9gsFSOeXqA.png)
- Lưu ý: Nhớ bật card mạng lên nhé: nó sẽ tự bắt DHCP 
![Image 19](https://img001.prntscr.com/file/img001/n1lWSFHbR8G_6tfytycKfw.png)
- Ta cài đặt mật khẩu root
![Image 21](https://img001.prntscr.com/file/img001/EMCQMrLkR1-8StBTsfCiKQ.png)
- Ta tạo user luôn
![Image 22](https://img001.prntscr.com/file/img001/GO_QktevQT2XmhT-G3aI5w.png)
- Khung phía dưới thể hiện tiến trình cài đặt Centos đang chạy ? %
![Image 23](https://img001.prntscr.com/file/img001/S_jf8B3WSTKhEiS7tkBz2w.png)
- Sau khi chạy xong các tiến trình, ta chọn REBOOT để khởi động CentOS
![](https://img001.prntscr.com/file/img001/keB2dHs-SrKtluuo7D82XA.png)

- Sau khi khởi động lại ta sẽ được đưa vào màn hình đăng nhập
![](https://img001.prntscr.com/file/img001/yeMMgKpPQg-87_DabnUctA.png)
- Ảnh dưới là màn hình quen thuộc của Centos 7
![](https://img001.prntscr.com/file/img001/22YQT6XtTeSCjJ9kLPb7sQ.png)
