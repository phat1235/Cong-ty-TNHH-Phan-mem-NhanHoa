## 1. **Giới Thiệu về VLAN** cơ bản để đọc chi tiết hơn một chút bạn có thể click [Here](https://github.com/phat1235/Cong-ty-TNHH-Phan-mem-NhanHoa/blob/main/1CongtyNhanHoa/networkbasic/VLAN/VLAN.md)

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

- Để có thể `Telnet/SSH` vào `SW` ta cần phải cấu hình `username` `password ` đăng nhập, số phiên làm việc tối đa có thể kết nối tại cùng một thời điểm.
- Mà trên `SW` ta không thể cài đặt địa chỉ IP trên các `interface` của `SW` được nên ta cần phải tạo 1 VLAN  trên  `interface` kết nối với `Router`.
- Sau đó, ta cài đặt các thông số IP cho `VLAN ` đó.

Dưới đây là hướng dẫn chi tiết để cài đặt và cấu hình SSH trên một switch Cisco:

### 3.1. **Kiểm tra phiên bản SSH được hỗ trợ**
   Trước khi bắt đầu cấu hình SSH, hãy chắc chắn rằng thiết bị bạn hỗ trợ phiên bản SSH. Bạn có thể kiểm phiên bản hỗ trợ bằng lệnh:

   ```plaintext
  nhanhoa>show ssh
    %No SSHv2 server connections running.
    %No SSHv1 server connections running.
   ```

### 3.2. **Đặt hostname và domain name cho switch**
   Để sử dụng SSH, bạn cần cấu hình tên thiết bị (hostname) và tên miền (domain name). Điều này cần thiết để tạo ra `khóa mã hóa` cho SSH.

   ```plaintext
nhanhoa#conf t
nhanhoa(config)#hostname nhanhoa
nhanhoa(config)#ip domain-name local.com
   ```

### 3.3. **Tạo khóa mã hóa RSA**
   SSH yêu cầu một cặp khóa RSA để mã hóa phiên làm việc. Bạn có thể tạo khóa RSA bằng lệnh sau:

   ```plaintext
nhanhoa(config)#crypto key generate rsa 
The name for the keys will be: nhanhoa.local.com
```
Thông báo:
```Choose the size of the key modulus in the range of 360 to 4096 for your
  General Purpose Keys. Choosing a key modulus greater than 512 may take a few minutes.
```
Lựa chọn độ dài của khóa  có độ dài từ 360- 4096
Ở đây tôi chọn khóa có độ dài 1024 bit

```How many bits in the modulus [512]: 1024```

Thông báo:
```
% Generating 1024 bit RSA keys, keys will be non-exportable...[OK]
   ```
   
  

### 3.4. **Cấu hình người dùng và mật khẩu**
   Bạn cần tạo người dùng với mật khẩu để đăng nhập SSH. Sử dụng lệnh sau để tạo tài khoản người dùng:

   ```plaintext
   nhanhoa(config)#username phat privilege 15 password phat123
   ```

   - `phat` là tên người dùng bạn muốn tạo.
   - `privilege 15` là mức độ quyền hạn cao nhất. Có mức độ từ 0-15
   - `phat123` là mật khẩu bảo mật của bạn.

### 3.5. **Cấu hình vty lines để sử dụng SSH**
   Bước tiếp theo là cấu hình các dòng vty (Virtual Terminal Lines) để chỉ cho phép truy cập SSH và vô hiệu hóa Telnet:

   ```plaintext
nhanhoa(config)#line vty 0 5
nhanhoa(config-line)#transport input ssh
nhanhoa(config-line)#login local
   ```

   - `line vty 0 5` chỉ định cho phép 5 phiên kết nối đồng thời.
   - `transport input ssh` chỉ cho phép SSH.
   - `login local` yêu cầu xác thực với cơ sở dữ liệu người dùng cục bộ mà bạn đã tạo..

### 3.6. **Lưu cấu hình**
   Sau khi hoàn tất các bước trên, hãy lưu cấu hình để đảm bảo các thay đổi sẽ không bị mất khi khởi động lại switch:

   ```plaintext
   nhanhoa#write memory 
   ```

### 3.7. **Kiểm tra cấu hình SSH**
   Cuối cùng, bạn có thể kiểm tra xem SSH đã được cấu hình đúng chưa bằng cách sử dụng lệnh:

   ```plaintext
   show ip ssh
   ```

   Và kiểm tra trạng thái của các dòng vty:

   ```plaintext
   show running-config | include vty
   ```


### 3.8. **Kết nối SSH đến switch**
   Bây giờ, tq có thể thử kết nối SSH vào switch từ một thiết bị khác. Sử dụng ứng dụng SSH client như PuTTY, OpenSSH (trên Linux), hoặc các công cụ tương đương. 
   
   Ở đây tôi dùng mobaXterm để thực hiện phiên kết nối SSH vào SW
   
![](https://img001.prntscr.com/file/img001/Iggc3e88SQKKw5Vi9bpkpg.png)
