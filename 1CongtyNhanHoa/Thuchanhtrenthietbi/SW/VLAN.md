## 1. **Giới Thiệu về VLAN**

### VLAN (Virtual Local Area Network)
- VLAN là một công nghệ cho phép chia một mạng vật lý thành nhiều mạng logic nhỏ hơn. Điều này giúp quản lý mạng linh hoạt hơn và tăng cường bảo mật bằng cách cách ly các nhóm người dùng hoặc thiết bị.
- VLAN giúp giảm broadcast domain (vùng quảng bá) trong mạng, giảm tắc nghẽn mạng và tăng hiệu suất tổng thể.

### Ứng Dụng của VLAN
- **Bảo mật**: Tách biệt các nhóm người dùng khác nhau (ví dụ: nhân viên kế toán và nhân viên kỹ thuật).
- **Quản lý lưu lượng mạng**: Giảm lưu lượng không cần thiết và giới hạn broadcast domain.
- **Tổ chức mạng linh hoạt**: Cấu hình lại các phân đoạn mạng mà không cần di chuyển thiết bị vật lý.
- **Phân đoạn mạng cho các dịch vụ khác nhau**: Ví dụ, VLAN cho dữ liệu người dùng, VLAN cho quản lý, VLAN cho VoIP, và VLAN cho video.

## 2. **Cấu Hình VLAN trên Switch Cisco**

Để có thể SSH vào switch qua một VLAN cụ thể, bạn cần cấu hình VLAN và định cấu hình một interface VLAN để quản lý. Dưới đây là các bước cấu hình VLAN và SSH:

### Bước 1: **Tạo và Cấu Hình VLAN**

1. **Tạo VLAN**:
   Để tạo một VLAN, bạn cần vào chế độ cấu hình và sử dụng lệnh `vlan`. Ví dụ để tạo VLAN 10 và đặt tên cho nó là "ketoan":

   ```plaintext
    Switch(config)#vlan 10
    Switch(config-vlan)#name ketoan
    Switch(config-vlan)#exit
   ```

2. **Gán cổng vào VLAN**:
   Bạn cần chỉ định các cổng cụ thể trên switch thuộc về VLAN 10. Ví dụ, nếu bạn muốn gán các cổng `FastEthernet0/1` vào VLAN 10:

   ```plaintext
    Switch(config)#int fastEthernet 0/1
    Switch(config-if)#switchport mode access
    Switch(config-if)#switchport access vlan 10
   ```

### Bước 2: **Cấu Hình Interface VLAN để Quản Lý Switch qua SSH**

1. **Cấu hình Interface VLAN**:
   Interface VLAN là giao diện logic dùng để quản lý switch. Cấu hình địa chỉ IP cho interface VLAN sẽ cho phép SSH truy cập vào switch qua VLAN này.

   ```plaintext
    Switch(config)#int vlan 10
    %LINK-5-CHANGED: Interface Vlan10, changed state to up
    Switch(config-if)#ip address 172.16.2.245 255.255.240.0
   ```

   Lưu ý rằng địa chỉ IP của VLAN này phải nằm trong dải địa chỉ mạng mà bạn muốn quản lý.
   
   Ở đây tôi sử dụng địa chỉ `172.16.2.245/20` làm địa chỉ cho interface VLAN 10.  Khi SSH thì ta sẽ dùng nó làm địa chỉ đích.

2. **Cấu hình Default Gateway (nếu cần thiết)**:
   Nếu switch của bạn nằm trong một mạng con khác và cần truy cập qua một router, bạn sẽ cần cấu hình default gateway:

   ```plaintext
   Switch(config)#ip default-gateway 172.16.10.1
   ```

### Bước 3: **Cấu Hình SSH Trên Switch**
   
[Cấu hình SHH để kết nối tới SW](https://github.com/phat1235/Cong-ty-TNHH-Phan-mem-NhanHoa/blob/main/1CongtyNhanHoa/Thuchanhtrenthietbi/SW/SSH.md)
