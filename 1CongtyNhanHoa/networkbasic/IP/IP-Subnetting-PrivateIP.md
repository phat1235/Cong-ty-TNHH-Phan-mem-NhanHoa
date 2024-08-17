# Mục Lục

1. [IPv4](#1-ipv4)
   
2. [Cấu trúc của Địa chỉ IP](#2-c%E1%BA%A5u-tr%C3%BAc-c%E1%BB%A7a-%C4%91%C3%ACa-chi-ip)
   - [Network ID và Host ID](#network-id-v%C3%A0-host-id)

3. [Lớp Địa chỉ Mạng (Network Class)](#3-l%C3%B3p-%C4%91%C3%ACa-chi-m%E1%BA%A1ng-network-class)
   - [Các lớp địa chỉ](#c%C3%A1c-l%E1%BB%9Bp-%C4%91%C3%ACa-chi)
 

4. [Subnet Mask](#4-subnet-mask)
   - [Chức năng và Ví dụ](#ch%C6%B0c-n%C4%83ng-v%C3%A0-v%C3%AD-d%E1%BB%99)

5. [Chia nhỏ Mạng](#5-chia-nh%E1%BB%8F-m%E1%BA%A1ng)
   - [Phương pháp chia mạng](#ph%C6%B0%C6%A1ng-ph%C3%A1p-chia-m%E1%BA%A1ng)

6. [Gộp Mạng](#6-g%E1%BB%99p-m%E1%BA%A1ng)
   - [Phương pháp gộp mạng](#ph%C6%B0%C6%A1ng-ph%C3%A1p-g%E1%BB%99p-m%E1%BA%A1ng)

7. [Địa chỉ IP Cá nhân (Private IP Addresses)](#7-%C4%91%C3%ACa-chi-ip-c%C3%A1-nh%C3%A2n-private-ip-addresses)
   - [Khái niệm](#kh%C3%A1i-ni%E1%BB%87m)
   - [NAT (Network Address Translation)](#nat-network-address-translation)

8.[Gateway Mặc Định](#8-gateway-m%E1%BA%B7c-%C4%91%E1%BB%8Bnh)
   - [Chức năng của Default Gateway](#ch%C6%B0c-n%C4%83ng-c%E1%BB%A7a-default-gateway)


---
1. **IPv4**:
   - IPv4 có độ dài 32 bit, được chia thành 4 nhóm (octet), mỗi nhóm gồm 8 bit, và được biểu diễn dưới dạng: `octet1.octet2.octet3.octet4`.
 ![](https://img001.prntscr.com/file/img001/zbASzPz2SNubZSpiT3HnOg.png)

2. **Cấu trúc của Địa chỉ IP**:
![](https://img001.prntscr.com/file/img001/wAl4c4iPQamv22nzRAzMew.png)
   - Địa chỉ IP được chia thành hai phần chính: **Network ID** và **Host ID**.
   - **Network ID**: Được xác định bởi octet đầu tiên và phân loại theo 5 lớp (Class) là A, B, C, D, E.(để nhận dạng)
   - **Host ID**: Được xác định bởi các octet còn lại. Một địa chỉ IP cụ thể không được phép có giá trị Host ID là 0 hoặc 255, bởi vì giá trị 0 thường được dùng để xác định địa chỉ của một mạng, còn 255 dùng để phát tín hiệu broadcast trong mạng.

3. **Lớp Địa chỉ Mạng (Network Class)**:

![](https://img001.prntscr.com/file/img001/gTFuh6EIQwmCdMZhuhioOw.png)
   - Lớp (Class) của địa chỉ mạng được xác định bởi 4 bit đầu tiên của Octet1.
   - **Class A (0000)**: Sử dụng Octet1 là Network ID, các octet còn lại là Host ID.
   - **Class B (1000)**: Sử dụng Octet1 và Octet2 là Network ID, các octet còn lại là Host ID.
   - **Class C (1100)**: Sử dụng Octet1, Octet2, và Octet3 là Network ID, octet cuối là Host ID.
   - **Class D (1110)** và **Class E (1111)**: Được sử dụng cho mục đích đặc biệt, không dành cho việc phân chia mạng thông thường.
   
   Theo mặc định, các Subnet mask tương ứng với từng Class như sau:
   - **Class A**: 255.0.0.0
   - **Class B**: 255.255.0.0
   - **Class C**: 255.255.255.0

   **CIDR (Classless Inter-Domain Routing)** cho phép chia nhỏ mạng một cách chi tiết hơn bằng cách quy định các mạng con (subnet) trong mỗi Class.

4. **Subnet Mask**:
![](https://img001.prntscr.com/file/img001/83gVyqPmS02dAXEuUHKCGA.png)
   - Subnet mask được sử dụng để chia một mạng lớn thành các mạng con nhỏ hơn. Nó giúp xác định xem một host đang thuộc cùng một subnet nội bộ hay nằm trên một mạng từ xa (remote network).
   - Ví dụ về Subnet mask 24-bit:
     - **Địa chỉ IP**: 192.168.123.132 (biểu diễn nhị phân: 11000000.10101000.01111011.10000100)
     - **Subnet mask**: 255.255.255.0 (biểu diễn nhị phân: 11111111.11111111.11111111.00000000)
     - **Network Address**: 192.168.123.0 (11000000.10101000.01111011.00000000)
     - **Host Address**: 132 (00000000.00000000.00000000.10000100)

5. **Chia nhỏ Mạng**:

![](https://img001.prntscr.com/file/img001/d3fDES11Qtq_VmosrVrb8g.png)
   - Để chia một mạng lớn thành nhiều mạng con, người ta có thể mượn thêm bit từ phần Host ID. Ví dụ, nếu mượn 2 bit từ octet cuối (Octet4), ta có thể chia một mạng thành 4 subnet nhỏ hơn với Subnet mask 26-bit (255.255.255.192).
   - Ví dụ:
     - Các mạng con: 
       - 192.168.123.0/26 (192.168.123.1-62)
       - 192.168.123.64/26 (192.168.123.65-126)
       - 192.168.123.128/26 (192.168.123.129-190)
       - 192.168.123.192/26 (192.168.123.193-254)

6. **Gộp Mạng**:
   - Để tăng số lượng host trong một mạng, bạn có thể gộp hai mạng nhỏ thành một mạng lớn hơn. Ví dụ, gộp hai subnet 192.168.123.128/26 và 192.168.123.192/26 thành một mạng 192.168.123.128/25.

7. **Địa chỉ IP Cá nhân (Private IP Addresses)**:

![](https://img001.prntscr.com/file/img001/pABXszMNT86leAlNKpbbAQ.png)


7.1 **Khái niệm**:
   - Địa chỉ IP cá nhân (Private IP addresses) là những địa chỉ được dành riêng cho các mạng nội bộ và không được định tuyến qua Internet công cộng. Điều này giúp bảo mật các mạng nội bộ khỏi sự truy cập từ bên ngoài và giảm bớt sự cạn kiệt địa chỉ IP công cộng.

7.2 **Khoảng địa chỉ IP cá nhân**:
   - IPv4 phân bổ các khoảng địa chỉ sau cho các mạng riêng:
     - **10.0.0.0 đến 10.255.255.255**: Đây là khoảng địa chỉ 10.0.0.0/8, cung cấp khoảng địa chỉ rộng lớn cho các mạng riêng.
     - **172.16.0.0 đến 172.31.255.255**: Đây là khoảng địa chỉ 172.16.0.0/12, cho phép tạo ra nhiều mạng nhỏ hơn trong khoảng này.
     - **192.168.0.0 đến 192.168.255.255**: Đây là khoảng địa chỉ 192.168.0.0/16, thường được sử dụng trong các mạng nhỏ và văn phòng.

7.3 **Ứng dụng**:
   - Các địa chỉ IP cá nhân thường được sử dụng trong các mạng nội bộ của tổ chức, gia đình, hoặc các thiết bị không cần truy cập trực tiếp từ Internet. Ví dụ:
     - **Mạng gia đình**: Các router gia đình thường sử dụng địa chỉ IP cá nhân để kết nối các thiết bị như máy tính, điện thoại, và máy in.
     - **Mạng doanh nghiệp**: Các công ty sử dụng địa chỉ IP cá nhân để tạo mạng nội bộ cho nhân viên và thiết bị trong văn phòng.

7.4 **NAT (Network Address Translation)**:
   - Để kết nối các thiết bị trong mạng nội bộ với Internet, các địa chỉ IP cá nhân thường sử dụng NAT. NAT cho phép một địa chỉ IP công cộng duy nhất đại diện cho nhiều địa chỉ IP cá nhân trong mạng nội bộ khi giao tiếp với các mạng ngoài.
   - NAT được thực hiện trên router hoặc thiết bị mạng, giúp ẩn địa chỉ IP cá nhân khỏi Internet và chỉ hiển thị địa chỉ IP công cộng khi kết nối ra ngoài.



**Tóm lại**, địa chỉ IP cá nhân giúp quản lý mạng nội bộ một cách hiệu quả, bảo mật và tiết kiệm địa chỉ IP công cộng. Việc sử dụng NAT trong các mạng này giúp kết nối với Internet mà không cần phải cấp phát địa chỉ IP công cộng cho từng thiết bị trong mạng nội bộ.

Nếu có nhiều tiền thì ta cũng có thể thuê IP Public dùng cho tất cả các thiết bị cũng được.!!!

7. **Gateway Mặc Định**:

![](https://img001.prntscr.com/file/img001/Ra5ZYy41RTW02RqpU3Hqog.png)
   - Để kết nối các host thuộc các mạng khác nhau, cần sử dụng các router để định tuyến lưu lượng. Router được chỉ định thực hiện việc này được gọi là **Default Gateway**.

