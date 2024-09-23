### Tôi reset password root bằng phần mềm  GPARTED
Tôi sẽ thực hiện ''bơm'' file ISO qua IDRAC, khá là lâu để thao tác .

Các bạn nên tạo USB boot để cài đặt, thao tác cho nhanh nhé.
![](https://img001.prntscr.com/file/img001/9XXUNtLERXSmNWy91JMCqg.png)
![](https://img001.prntscr.com/file/img001/3RFEbipFRSOe1MzcsRuNmg.png)
![](https://img001.prntscr.com/file/img001/RMEvyr-zTt6_OUwUuQoKfg.png)
![](https://img001.prntscr.com/file/img001/5KiSrU6sTOqYnDRRGFxVZQ.png)
![](https://img001.prntscr.com/file/img001/gyoX3qTbRLGodRwr7y-gqw.png)

### B1:  Sau khi đã vào được  giao diện cài đặt của `GParted`  ta lựa chọn mặc định để tiến hành các bước sau.
![](https://img001.prntscr.com/file/img001/MfKL5EdiRN-rYusJWLuXaw.png)
### Lựa chọn `Dont touch...`
![](https://img001.prntscr.com/file/img001/ieXigYPYQNmCP4UwnKvRHw.png)
### Ta lựa chọn ngôn ngữ bàn phím, nếu sai sẽ sai bố cục bàn phím trong quá trình 
![](https://img001.prntscr.com/file/img001/wzHXFukaSZunuvWQ1K9JPA.png)
### Gparted xuất hiện màn hình sau.
![](https://img001.prntscr.com/file/img001/cSq0Nbz8TuiAnj0aUB4b2w.png)

### B2 .Bạn cần mount /dev/sda5 để khôi phục mật khẩu của VMware ESXi. Bạn cần phải xác định cả về quy mô, kích thước và dấu hiệu.khi bạn đã gắn kết các ổ, bạn có thể xem các tập tin như hình bên dưới.
![](https://img001.prntscr.com/file/img001/x7OtBmeXRe2jfgQsoqR_oA.png)
### Ta bật terminal lên để thực hiện các lệnh
![](https://img001.prntscr.com/file/img001/Y1E6w01_TM-1WLP7ZvPYfQ.png)
```
sudo su
mkdir /boot /temp/
mount dev/nvme0n1p6 /boot
cd /boot/
cp state.tgz /temp
cd /temp/
tar –xf state.tgz
tar –xf local.tgz
rm *.tgz
ls –l
cd etc/
ls –l
```

![](https://img001.prntscr.com/file/img001/BBtcI87LRzyLD07t6N6TuA.png)

![](https://img001.prntscr.com/file/img001/ZXywPA_mTgWjw2XJ2CLpSQ.png)
### Sao chép file “state.tgz” tới thư mục /tmp . Sau đó giải nén file state.tgz sẽ tạO ra tệp tin gọi là local.tgz.

### Giải nén file local.tgz và nó sẽ tạo ra thực mục có tên “etc”.

### Chuyển vào thư mục “etc” và sửa file có tên gọi “shadow” dùng bộ tool vi editor. 
![](https://img001.prntscr.com/file/img001/ZHoQgV_tQuyJQFjHQmZCmA.png)
###  Bạn cần phải xóa các chuỗi giữa dấu : đầu tiên tới dấu : thứ hai.(chính là mật khẩu đã bị mã hóa).
ở tệp shadow bằng trình soạn thảo nano. Tệp shadow lưu trữ mật khẩu đã mã hóa của người dùng hệ thống.
![](https://img001.prntscr.com/file/img001/JIHF0kmySfmaPt_8lblFWA.png)
### Sau khi đã xóa và ta lưu nó lại 
![](https://img001.prntscr.com/file/img001/KnN_T6zJTFCQGYYx_u7hRQ.png)
### trước khi cập nhật(xóa pass mã hóa)
![](https://img001.prntscr.com/file/img001/fX21ZRwhQ6eFk394fE1MuQ.png)

### Sau khi cập nhật (xóa pass mã hóa)
![](https://img001.prntscr.com/file/img001/PR2MQ1iUTnW66q424FBwPA.png)
### Tạo tệp nén local.tgz chứa nội dung của thư mục etc/ (bao gồm các tệp đã chỉnh sửa, ví dụ như tệp shadow).
### Tạo tệp nén state.tgz chứa tệp local.tgz vừa tạo.

### Di chuyển tệp state.tgz mới tạo vào thư mục /boot.

### Tháo gỡ (umount) phân vùng đã gắn kết tại /boot.
### Sau đó ta khởi động lại hệ thống 
![](https://img001.prntscr.com/file/img001/wzI1xATvRdCOUee82vn0kQ.png)
### Sau khid đã khởi động lại hệ thống ta nhấn F2 để vào cấu hình 
![](https://img001.prntscr.com/file/img001/oKm4_LMxSf-PYZv-jojXFg.png)

### Lúc này giao diện đăng nhập sẽ hiển thị lên, ta chỉ cần ghi username: root

### password: ta để trống

### Sau đó ta nhấn enter để login vô
![](https://img001.prntscr.com/file/img001/7uHQ45-uTU2hdLYpRNLOqg.png)


![](https://img001.prntscr.com/file/img001/XB_Aeg5nR-2DnBoNAsy2kA.png)
### Tiếp theo ta cấu hình pass root
![](https://img001.prntscr.com/file/img001/gNV6hWFVQeqLxgAIcHglLQ.png)

### Tại mục old pass ta để trống, còn lại nhập như hướng dẫn 
![](https://img001.prntscr.com/file/img001/lRfqcn-yT5WC1c6m84zJpA.png)
![](https://img001.prntscr.com/file/img001/DZfrxaelQwKGpG-aQBojqw.png)

### Sau khi đã đổi pass root thành công ta login băng giao diện web, dùng 1 web brower để đăng nhập.

![](https://img001.prntscr.com/file/img001/X4m-stO4SfWCODVs_bDF7g.png)
