### Upload file ISO của hệ điều hành
Bạn có thể boot hệ điều từ ổ đĩa CD/DVD hay một Bootable USB, tuy nhiên nếu phải cài đặt nhiều lần thì việc này thực sự mất thời gian và bất tiện. Nên trong hướng dẫn này sẽ hướng dẫn upload file ISO của HDH lưu trữ luôn trên VMWare ESXi.

#### Từ màn hình quản lý ESXi, truy cập tới `Storage => datastore1 => Bấm vào Datastore browser`
![](https://img001.prntscr.com/file/img001/ZxwhnPnLTLKmMEcdpIHAbw.png)


#### Ở đây tôi đã có một vài file ISO
Nếu các bạn cần upfile thì nhấn vô `upload`  rồi chỉ định file cần upload lên.

Ảnh dưới đây có 1 số lựa chọn:
1. upload: upfile lên datastore
2. Tên của datastore
3. Các file , folder có trong datastore
4. Tạo thêm 1 folder
5. Làm mới giao diện
![](https://img001.prntscr.com/file/img001/KFNEJRuIRHeOIiXkvG-czg.png)

### Tạo máy ảo trên ESXi
#### Ở giao diện quản lý của ESXi, Vào “Virtual machines” => Chọn [ Create/Register VM ] để tạo máy ảo trên ESXi
![](https://img001.prntscr.com/file/img001/Tvzdwhr8SxOktVHNTaqqqg.png)
### Một màn hình popup sẽ hiển thị

### Bước 1: Select creation type
=> Chọn “**Create a new virtual machine**” => bấm [**Next** ]

![](https://img001.prntscr.com/file/img001/nZ_Cyd-wRHWwq91HgG91ug.png)
### Bước 2: Select a name and guest OS
Name: tên máy ảo

Guest OS family: Chọn loại HDH

Guest OS version: Chọn phiên bản của hệ điều hành

=> bấm [ Next ] để tiếp tục
![](https://img001.prntscr.com/file/img001/A2Ja1awHSQqn_cGVHcL-wA.png )  
### Bước 3: Select storage
Chọn vị trí lưu trữ máy ảo => Bấm [ next ]

![](https://img001.prntscr.com/file/img001/lkXEETdrSseunt6eiU-Uqg.png)
### Bước 4: Customize Setting
Tùy chỉnh cài đặt cho máy ảo, ở mục CD/DVD Drive 1, chọn “Datastore ISO file”

Browser tới file .iso của hệ điều hành cần cài đặt => Bấm [ Select ]
![](https://img001.prntscr.com/file/img001/5fCiJY9ORryrpjtICTIeZw.png)

Cấu hình thông số máy ảo sau đó bấm [ Next ] để sang bước tiếp theo.
![](https://img001.prntscr.com/file/img001/19bWZfauRo-P5OLdPMqaoQ.png )  
### Bước 5: Review lại thông tin cài đặt của máy ảo
=> bấm [ Finish ] để hoàn thành tạo máy ảo
![](https://img001.prntscr.com/file/img001/YiCjYiVjTD6fSlRJHukWeg.png)

Chọn máy ảo vừa tạo => Bấm [ Power on ] để khởi động máy ảo
![](https://img001.prntscr.com/file/img001/NTDyH3v0SRCXKkEWn1Yvpg.png)

Ảnh bên dưới là màn hình khởi động của WINDOWN
![](https://img001.prntscr.com/file/img001/-4IrfB39R7uFcO573nISAA.png)

Nếu có key thì ta nhập, nếu không có thì ta click vào `I dont have a product key` để tiếp tục
![](https://img001.prntscr.com/file/img001/DCgW5gR_TjK_SDp7JwRAlQ.png )  

Ở đây ta lựa chọn các phiên bản. Tôi chọn Standard (Desktop Ex)  cho cài LAB này sẽ có giao diện 
![](https://img001.prntscr.com/file/img001/wk-Kc-2YQN6EMO4WvGUD8Q.png)

Click vào đồng ý với các điều khoản rồi nhấn `Next`
![](https://img001.prntscr.com/file/img001/5T9HJW0VSxKW3QtR7vAwQg.png)

Lựa chọn `Custom`: chúng ta sẽ cài đặt các tính năng nâng cao sau để tiếp kiệm thời gian cho quá trình cài đặt bài lab này
![](https://img001.prntscr.com/file/img001/rSV10iIdSC-qO97fKCAzPQ.png)

Lựa chọn ổ cứng: ở đây sẽ là ổ cứng ảo mà ta đã cấu hình khi cài đặt máy ảo lúc đầu
![](https://img001.prntscr.com/file/img001/pVA7ei9HRKmzdQlnJCYkWw.png)
Và chờ đợi là hạnh phúc (đôi khi)
![](https://img001.prntscr.com/file/img001/x9MTLVs5Q1O30A70Fhy0Kw.png)

Tén tèn ten đã xong, và ảnh dưới là màn hình lock window.
Nhấn tổ hợp phím  CRT+ ALT + DEL để ăng lóc
![](https://img001.prntscr.com/file/img001/Ht-hScwYRCCpaim7yYoqsA.png)
Ta nhập password đã set ở bước cấu hình windown
![](https://img001.prntscr.com/file/img001/Eg9roNMRRzKos1M3iz40mQ.png)

Login... Ta show các thông số của OS Windown mà ta vừa tạo...
![](https://img001.prntscr.com/file/img001/EcGtFqWCTSyGL71m8NkTWg.png)
