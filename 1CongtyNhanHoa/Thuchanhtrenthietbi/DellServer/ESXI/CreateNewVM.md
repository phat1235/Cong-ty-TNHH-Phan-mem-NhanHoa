Upload file ISO của hệ điều hành
Bạn có thể boot hệ điều từ ổ đĩa CD/DVD hay một Bootable USB, tuy nhiên nếu phải cài đặt nhiều lần thì việc này thực sự mất thời gian và bất tiện. Nên trong hướng dẫn này sẽ hướng dẫn upload file ISO của HDH lưu trữ luôn trên VMWare ESXi.

### Từ màn hình quản lý ESXi, truy cập tới Storage => datastore1 => Bấm vào Datastore browser
### Tạo máy ảo trên ESXi
Ở giao diện quản lý của ESXi, Vào “Virtual machines” => Chọn [ Create/Register VM ] để tạo máy ảo trên ESXi
![](https://img001.prntscr.com/file/img001/COkWqBcUS2OUbK3aL9tXOg.png)
Một màn hình popup sẽ hiển thị

### Bước 1: Select creation type
=> Chọn “Create a new virtual machine” => bấm [ Next ]
![](https://img001.prntscr.com/file/img001/Ky4VFWn6TXiVJHwImfrPaw.png)
### Bước 2: Select a name and guest OS
Name: tên máy ảo

Guest OS family: Chọn loại HDH

Guest OS version: Chọn phiên bản của hệ điều hành

=> bấm [ Next ] để tiếp tục
![](https://img001.prntscr.com/file/img001/mEC-I1QMQg-83TRICI5grQ.png)
### Bước 3: Select storage
Chọn vị trí lưu trữ máy ảo => Bấm [ next ]
![](https://img001.prntscr.com/file/img001/-XNjUXZYQo2PKbzizI9NmA.png)

![](https://img001.prntscr.com/file/img001/DkoAXTBnTWm70Do25u8U7A.png)
### Bước 4: Customize Setting
Tùy chỉnh cài đặt cho máy ảo, ở mục CD/DVD Drive 1, chọn “Datastore ISO file”
![](https://img001.prntscr.com/file/img001/8QbdIQqfSf60y7NDgDzJiQ.png)
Cấu hình thông số máy ảo sau đó bấm [ Next ] để sang bước tiếp theo.
![](https://img001.prntscr.com/file/img001/5XDybJ0VSqOjofuJnz2wwA.png)
### Bước 5: Review lại thông tin cài đặt của máy ảo
=> bấm [ Finish ] để hoàn thành tạo máy ảo
![](https://img001.prntscr.com/file/img001/lu02a-lZScGJ7lSwTPwK4Q.png)
### Chọn máy ảo vừa tạo => Bấm [ Power on ] để khởi động máy ảo
![](https://img001.prntscr.com/file/img001/GfoJJThlQiCHAMd-yDDUxQ.png)
### Máy ảo đã được khởi động, bạn có thể bắt đầu cài đặt máy ảo được rồi.
### Và dưới đây là máy ảo sau khi đã cài đặt thành công
![](https://img001.prntscr.com/file/img001/PuXY5wtuREyPAIuSXH3Nyg.png)
