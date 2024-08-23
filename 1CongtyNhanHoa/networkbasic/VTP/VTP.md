
### 1. VLAN TRUNKING PROTOCOL (VTP)

VTP là giao thức hoạt động ở tầng 2 trong mô hình OSI. VTP giúp cho việc cấu hình VLAN luôn `đồng nhất` khi thêm, xóa, sửa thông tin về VLAN trong hệ thống mạng.

### Hoạt động của VTP
VTP gửi thông điệp quảng bá qua “VTP domain” mỗi 5 phút một lần, hoặc khi có sự thay đổi xảy ra trong cấu hình VLAN. 

Một thông điệp VTP bao gồm

        `rivision-number`, 
         tên VLAN (VLAN name), 
         số hiệu VLAN (VLAN number), 
         và thông tin về các switch có cổng gắn với mỗi VLAN.
         
Bằng sự cấu hình VTP Server và việc quảng bá thông tin VTP, tất cả các switch đều đồng bộ về tên VLAN và số hiệu VLAN của tất cả các VLAN.

Một trong những thành phần quan trọng trong các thông tin quảng bá VTP là tham số `revision number`. Mỗi lần VTP server điều chỉnh thông tin VLAN, nó tăng `revision-number` lên 1, rồi sau đó VTP Server mới gửi thông tin quảng bá VTP đi. Khi một switch nhận một thông điệp VTP với “revision-number” lớn hơn, nó sẽ cập nhật cấu hình VLAN.

![](https://img001.prntscr.com/file/img001/LIQk3iByRmOiLOe6SpvW5g.png)

![](https://img001.prntscr.com/file/img001/-6JUPrzHSX27BcRsjQL5qA.png)

**Switch** ở chế độ VTP **server** `có thể` tạo, chỉnh sửa và xóa VLAN. VTP server lưu cấu hình VLAN trong `NVRAM` của nó. VTP Server gửi thông điệp ra tất cả các cổng “trunk”.

**Switch** ở chế độ VTP **client** `không` tạo, sửa và xóa thông tin VLAN. VTP Client có chức năng đáp ứng theo mọi sự thay đổi của VLAN từ Server và gửi thông điệp ra tất cả các cổng “trunk” của nó. VTP Client đồng bộ cấu hình VLAN trong hệ thống.

**Switch** ở chế độ **transparent** sẽ nhận và chuyển tiếp các thông điệp quảng bá VTP do các switch khác gửi đến mà không quan tâm đến nội dung của các thông điệp này. Nếu “transparent switch” nhận được thông tin cập nhật VTP nó cũng không cập nhật vào cơ sở dữ liệu của nó; đồng thời nếu cấu hình VLAN của nó có gì thay đổi, nó cũng không gửi thông tin cập nhật cho các switch khác. Trên “transparent switch” chỉ có một việc duy nhất là chuyển tiếp thông điệp VTP. Switch hoạt động ở “transparent-mode” chỉ có thể tạo ra các VLAN cục bộ. Các VLAN này sẽ không được quảng bá đến các switch khác.

Nếu SW Sever bị thiếu cổng vì tăng đột xuất số lượng máy tính thì ta có thể dùng SW transparent để tạo những id VLAN giống như trên SW server để chống cháy. 

Ví dụ ở SW  có vlan 10 vlan 20, có tầm 48 port, mà hết port thì ta có thể dùng SW Transparent để mở rộng số port của VLAN.

### Cấu hình VTP

Cấu hình VTP domain

    Switch (config) #vtp domain <domain_name>
 Cấu hình VTP mode

        Switch (config) #vtp [client transparent server] 
Lệnh xem cấu hình VTP

        Switch#show vtp status

![](https://img001.prntscr.com/file/img001/K3Kw7z2lQXCp81-z94ytDA.png)


### Mô tả
Hai switch kết nối với nhau qua đường “trunk”.

Tạo 3 vlan: VLAN 10, VLAN 20, VLAN 30 trên SW1

Cấu hình VTP để các thông tin các VLAN trên SW1 cập nhật cho SW2

Trên SW1: VLAN 10 (Fa0/2 – Fa0/4), VLAN 20 (Fa0/5 – Fa0/7), VLAN 30 (Fa0/8 - Fa0/10)

Trên SW2: VLAN 10 (Fa0/4 – Fa0/6), VLAN 20 (Fa0/7 — Fa0/9), VLAN 30 (Fa0/10 - Fa0/12)



***Các bước cấu hình**

Cấu hình **Swl** làm VTP Server:


Thiết lập VTP domain: SPKT, VTP mode Server, và tạo các VLAN

        swl#config terminal
        swl (config) #vtp mode server swl 
        (config)# vtp domain SPKT swl 
        (config)# vlan 10 name CNTT swl 
        (config)# vlan 20 name TTTH swl 
        (config)# vlan 30 name TTCLC
        
Cấu hình đường trunk và cho phép tất cả các VLAN qua đường
trunk

        swl (config)#interface f0/1
        swl (config-if)# switchport mode trunk
        swl (config-if)# switchport trunk encapsulation dotlq
Gán các port vào các VLAN
        
        swl (config) #int range f0/2 - 4
        swl (config-if-range)# switchport mode access 
        swl #switchport access vlan 10 
        swl(config-if)# int range f0/5 - 7
        swl(config-if-range)# switchport mode access 
        swl(config-if-range)# switchport access vlan 20 
        swl(config-if)#int range f0/8 - 10
        swl(config-if-range) # switchport mode access 
        swl(config-if-range) # switchport access vlan 30 

Kiểm tra cấu hình

Sử dụng các lệnh:

    switch#show vlan
    switch# show vtp status

Cấu hình Sw2 làm VTP client:

+ Cấu hình vtp domain: SPKT, vtp mode: client

        SW2 (config) #vtp domain SPKT
        SW2 (config) #vtp mode client
+ Cấu hình trunking trên cổng f0/1 của SW2

        SW2 (config)#int f0/1
        SW2 (config-if)# switchport mode trunk
        SW2 (config-if)# switchport trunk encapsulation dotlq


Gán các port vào các van

        sw2 (config)#int range f0/4 - 6
        sw2 (config-if-range) # switchport mode access 
        sw2 (config-if-range) # switchport access vlan 10 
        sw2 (config)#int range f0/7 - 9
        sw2 (config-if-range) # switchport mode access 
        sw2 (config-if-range) # switchport access vlan 20 
        sw2 (config) #int range f0/10 - 12
        sw2 (config-if-range) # switchport mode access 
        sw2 (config-if-range) # switchport access vlan 30
Sử dụng các câu lệnh sau để kiểm tra

        switch#show vlan
        switch# show int interface
        switch#show vtp status
        switch#show vtp counters
