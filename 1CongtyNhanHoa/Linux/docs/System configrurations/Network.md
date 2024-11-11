# Network Configurations
## **1) Các file cấu hình Network**
### **1.1) `/etc/hosts`**
- Dùng để phân giải những hostname không thể phân giải được .
- Có thể dùng thay DNS trong hệ thống mạng LAN
    - `127.0.0.1` <=> `localhost.localdomain`
    - `::1` <=> `localhost.localdomain`<br><br>
<img src=https://img001.prntscr.com/file/img001/F2JFch4OSsadLR9aCecv1Q.png>

### **1.2) `/etc/resolv.conf`**
- Dùng để cấu hình DNS<br><br>
    <img src=https://i.imgur.com/bXQ9tZQ.png width=80%>

### **1.3) `/etc/netplan/...`**
- Chứa thông tin cấu hình của từng card mạng
   

    <img src=https://img001.prntscr.com/file/img001/SaKh7gf6Srua71ud6LDe-Q.png>

## **2) Các lệnh Network cơ bản**
### **2.1) Xem địa chỉ IP**
```
# ifconfig       ( Ethernet + Loopback )
# iwconfig       ( Wifi )
# ifconfig -a    ( đầy đủ thông tin )
# ip a s         ( đầy đủ thông tin )
```
<img src=https://img001.prntscr.com/file/img001/SnMmQqsQT1y5Hp4nILytrA.png>

### **2.2) Tắt / Bật card mạng**
```
# ifup [tên_card_mạng]       : bật card mạng
# ifdown [tên_card_mạng]     : tắt card mạng
```
### **2.3) Khởi động lại `network.service`**
```
    # service network restart
<=> # /etc/init.d/network restart
<=> # systemctl restart network.service
```
### **2.4) Xem thông tin gateway**
```
# route
# ip route
```
<br>
    <img src=https://img001.prntscr.com/file/img001/18KpCzE6SQaFYKo8u-79Mw.png>

## **3) Cấu hình IP**
### **3.1) Cấu hình bằng lệnh ( tạm thời )**
```
# ifconfig [tên_card_mạng] [IP] netmask [subnet_mask] up
```
> ***Chú ý*** : IP sẽ mất mỗi khi tắt mở card mạng hay restart `network.service` . Đây còn gọi là cách đặt IP tạm thời , thường dùng để test .
### **3.2) Cấu hình bằng file**
- Thay đổi nội dung trong file cấu hình của card mạng :
```
# vi etc/netplan/...
```
```
network:

  version: 2

  renderer: networkd

  ethernets:

    eth0:

      dhcp4: true

    eth1:

      dhcp4: true
```

thành

```
network:

  version: 2

  renderer: networkd

  ethernets:

    eth0:

      addresses: [192.168.1.10/24]

      gateway4: 192.168.1.1

      nameservers:

        addresses: [8.8.8.8, 8.8.4.4]

    eth1:

      dhcp4: true
```


## Sau đó apply

```
sudo netplan apply
```
