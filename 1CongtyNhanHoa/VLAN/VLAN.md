### 1.VLAN
VLAN (Virtual LAN) là kỹ thuật được sử dụng trên Switch, dùng để chia một Switch vật lý thành nhiều Switch luận lý. Mỗi một Switch luận lý gọi là một VLAN hoặc có thể hiểu VLAN là một tập hợp của các cổng trên Switch nằm trong cùng một miền quảng bá. Các cổng trên Switch có thể được nhóm vào các VLAN khác nhau trên một Switch hoặc được triển khai trên nhiều Switch.

![]( https://img001.prntscr.com/file/img001/GZjiJVHTSKGXOzl-UZ-hZg.png)


Khi có một gói tin quảng bá được gửi bởi một thiết bị nằm trong một VLAN sẽ được chuyển đến các thiết bị khác nằm trong cùng VLAN đó, gói tin quảng bá sẽ không được chuyển tiếp đến các thiết bị thuộc VLAN khác.
VLAN cho phép người quản trị tổ chức mạng theo luận lý chứ không theo vật lý. Sử dụng VLAN có ưu điểm là:
v Tăng khả năng bảo mật
v Thay đổi cấu hình LAN dễ dàng
V Di chuyển máy trạm trong LAN dễ dàng
v Thêm máy trạm vào LAN dễ dàng.
VLAN = broadcast domain = logical network
 
### 2.  Phân Loại VLAN
####    VLAN tĩnh
![]( https://img001.prntscr.com/file/img001/5KyBVmKNTuGixe8uBwSzOA.png)

Đối với loại này, các cổng của Switch được cấu hình thuộc về một VLAN nào đó, các thiết bị gắn vào cổng đó sẽ thuộc về VLAN đã định trước. Đây là loại VLAN dùng phổ biến.

#### VLAN động (dynamic VLAN)

![]( https://img001.prntscr.com/file/img001/ARxebpnYSj2YhPXjvvCo1A.png)

Loại VLAN này sử dụng một server lưu trữ địa chỉ MAC của các thiết bị và qui định VLAN mà thiết bị đó thuộc về, khi một thiết bị gắn vào Switch, Switch sẽ lấy địa chỉ MAC của thiết bị và gửi cho server kiểm tra và cho vào VLAN định trước.

### 3. CẤU HÌNH VLAN
 
**Bước 1. Tạo VLAN**

        Switch (config) #vlan <vlan-id>
        Switch (config-vlan)#name <vlan-name>
        Ví dụ:
        Switch (config) #vlan 10
        Switch (config-if)#name P.KyThuat
        
**Bước 2. Gán các cổng cho VLAN**
- Gán 1 cổng vào LAN

       Switch (config)#interface <interface>
       Switch (config-if)# switchport mode access
       Switch (config-if)# switchport access vlan <vlan-id>

Ví dụ:

       Switch (config) #interface fa0/5
       Switch (config-if)# switchport mode access
       Switch (config-if)# switchport access vlan 10
- Gán 1 dãy các cổng liên tiếp

        Switch (config)#interface range <start>-<end-intf> 
        Switch (config-if-range)# switchport mode access 
        Switch (config-if-range)# switchport access vlan <vlan-id>
        

Ví dụ:

        Switch (config) #interface fa0/10 - 20
        Switch (config-if-range) # switchport mode access
        Switch (config-if-range) # switchport access vlan 10
        
- Gán nhiều cổng không liên tiếp

        Switch (config)#interface  range <interfacel,interface2,...>
        Switch (config-if-range) # switchport mode access
        Switch (config-if-range) # switchport access vlan <vlan-id> 
Ví dụ:
    Switch (config)# interface fa0/7, fa0/9, fa0/2 Switch 
    (config-if-range)# switchport mode access Switch 
    (config-if-range)# switchport access vlan 10 
    
Xóa VLAN: Xóa một VLAN trên switch bằng cách sử dụng lệnh “no” trước câu lệnh tạo VLAN.


***Đường Trunk***


• Kết nối trunk (đường trunk)
Một kỹ thuật khác để giải quyết vấn đề trên là dùng chỉ một kết nối cho phép dữ liệu của các VLAN có thể cùng lưu thông qua đường này. Người ta gọi kết nối này là đường trunk.


![](https://img001.prntscr.com/file/img001/eSu_B_kJRfOfWegwjGU1OA.png)

Theo như mô hình trên chúng ta chỉ dùng một dây nối Switch 1 với Switch 2, các thành viên trong cùng VLAN ở các Switch khác nhau vẫn có thể giao tiếp với nhau. Đường dây như thế gọi là liên kết trunk lớp 2.
Mỗi thành viên trong cùng VLAN chỉ có thể thấy thành viên khác trong cùng VLAN với nó. Để PC A có thể giao tiếp với PC B hoặc C (không thuộc cùng VLAN), cần phải sử dụng thiết bị ở lớp 3 như router hay switch lớp 3 (Multilayer Switch hay Switch layer 3).
Kết nối “trunk” là liên kết Point-to-Point giữa các cổng trên switch với router hoặc với switch khác. Kết nối “trunk” sẽ vận chuyển dữ liệu của nhiều VLAN thông qua một liên kết đơn và cho phép mở rộng VLAN trên hệ thống mạng.
Vì kỹ thuật này cho phép dùng chung một kết nối vật lý cho dữ liệu của các VLAN đi qua nên để phân biệt được chúng là dữ liệu của VLAN nào, người ta gắn vào các gói tin một dấu hiệu gọi là “tagging”. Hay nói cách khác là dùng một kiểu đóng gói riêng cho các gói tin di chuyển qua đường “trunk” này. Giao thức được sử dụng là **802.1Q (dotlq).**
* Giao thức 802.1Q
Đây là giao thức chuẩn của IEEE dể dành cho việc nhận dạng các VLAN bằng cách thêm vào “frame header” đặc điểm của một VLAN. Phương thức này còn được gọi là gắn thẻ cho VLAN (frame tagging).


![](https://img001.prntscr.com/file/img001/ELmj_9Y7SzC9n8ykgh1c9Q.png)

* Cấu hình VLAN trunking: Để cấu hình đường “trunk”, chúng ta cấu hình 2 cổng “trunk” như sau:

        switch(config)#interface <interface>
        switch (config-if)# switchport mode trunk
        switch (config-if)# switchport trunk encapsulation
Lệnh cuối cùng là mặc định ở một số dòng switch
