
# 1. Giới Thiệu
**NAT** (Network Address Translation) là một kỹ thuật cho phép chuyển đổi từ một địa chỉ IP này thành một địa chỉ IP khác. Thông thường, NAT được sử dụng phổ biến trong các mạng cục bộ cần truy cập đến mạng công cộng (Internet). Vị trí thực hiện NAT là tại router biên kết nối giữa hai mạng.

### Địa chỉ Private và Địa chỉ Public

![](https://img001.prntscr.com/file/img001/Ud1YFl55RYa13UQWeMFglg.png)
- **Địa chỉ Private:** Được định nghĩa trong RFC 1918
  - 10.0.0.0 - 10.255.255.255
  - 172.16.0.0 - 172.31.255.255
  - 192.168.0.0 - 192.168.255.255
- **Địa chỉ Public:** Các địa chỉ còn lại, được cung cấp bởi các tổ chức có thẩm quyền.

### Các loại Địa chỉ trong NAT

![](https://img001.prntscr.com/file/img001/-ake_TKFQDKmj7wPzTI3iA.png)
- **Địa chỉ Inside Local:** Là địa chỉ IP gán cho một thiết bị trong mạng nội bộ. Thường không phải là địa chỉ được cấp bởi NIC (Network Information Center) hay nhà cung cấp dịch vụ.
- **Địa chỉ Inside Global:** Là địa chỉ đã được đăng ký với NIC, dùng để thay thế một hay nhiều địa chỉ IP Inside Local.
- **Địa chỉ Outside Local:** Là địa chỉ IP của một thiết bị bên ngoài khi nó xuất hiện trong mạng nội bộ. Địa chỉ này không nhất thiết phải là địa chỉ đã được đăng ký, có thể lấy từ không gian địa chỉ nội bộ.
- **Địa chỉ Outside Global:** Là địa chỉ IP gán cho một thiết bị ở mạng bên ngoài, được lấy từ không gian địa chỉ có thể dùng để định tuyến toàn cầu.

# 2. Static NAT

![](https://img001.prntscr.com/file/img001/-BvOw9H1R0OT0BO_QaOYtw.png)
**Static NAT** được sử dụng để chuyển đổi cố định một địa chỉ IP này sang một địa chỉ IP khác, thông thường từ một địa chỉ cục bộ sang một địa chỉ công cộng. Quá trình này được cài đặt thủ công, nghĩa là địa chỉ ánh xạ và địa chỉ được ánh xạ phải được chỉ định rõ ràng tương ứng. Static NAT rất hữu ích trong trường hợp những thiết bị cần có địa chỉ cố định để có thể truy cập từ bên ngoài Internet, ví dụ như Web Server, Mail Server.

### Cấu hình Static NAT
- Thiết lập mối quan hệ chuyển đổi giữa địa chỉ nội bộ bên trong và địa chỉ đại diện bên ngoài.
  ```bash
  Router(config)# ip nat inside source static local-ip global-ip
  ```
- Xác định các cổng kết nối vào mạng nội bộ:
  ```bash
  Router(config-if)# ip nat inside
  ```
- Xác định các cổng kết nối ra mạng công cộng bên ngoài:
  ```bash
  Router(config-if)# ip nat outside
  ```

# 3. Dynamic NAT
**Dynamic NAT** được sử dụng để tự động ánh xạ một địa chỉ IP này sang một địa chỉ IP khác, thường là từ một địa chỉ cục bộ sang một địa chỉ công cộng. Bất kỳ một địa chỉ IP nào nằm trong dải địa chỉ công cộng đã được định trước đều có thể được gán cho một thiết bị bên trong mạng.

### Cấu hình Dynamic NAT
- Xác định dải địa chỉ đại diện bên ngoài (public):
  ```bash
  Router(config)# ip nat pool name start-ip end-ip [netmask netmask/prefix-length prefix-length]
  ```
- Thiết lập ACL cho phép những địa chỉ nội bộ bên trong nào được chuyển đổi:
  ```bash
  Router(config)# access-list access-list-number permit source [source-wildcard]
  ```
- Thiết lập mối quan hệ giữa địa chỉ nguồn trong ACL với dải địa chỉ đại diện bên ngoài:
  ```bash
  Router(config)# ip nat inside source list <acl-number> pool <name>
  ```
- Xác định các cổng kết nối vào mạng nội bộ:
  ```bash
  Router(config-if)# ip nat inside
  ```
- Xác định các cổng kết nối ra mạng công cộng bên ngoài:
  ```bash
  Router(config-if)# ip nat outside
  
  
  ```
![](https://img001.prntscr.com/file/img001/tipnLf47RtiRHJSKl1qHog.png)
#### Ví dụ: Cấu hình cho mô hình trong hình trên
```bash
Router(config)# ip nat pool abc 202.1.1.177 202.1.1.185 netmask 255.255.255.0
Router(config)# access-list 1 permit 192.168.1.0 0.0.0.255
Router(config)# ip nat inside source list 1 pool abc
Router(config)# interface fa0/0
Router(config-if)# ip nat inside
Router(config)# interface S0/0/0
Router(config-if)# ip nat outside
```

# 4. NAT Overload
**NAT Overload** là một dạng của Dynamic NAT, nó thực hiện ánh xạ nhiều địa chỉ IP thành một địa chỉ duy nhất (many-to-one) và sử dụng các chỉ số cổng khác nhau để phân biệt cho từng kết nối. NAT Overload còn được gọi là PAT (Port Address Translation). Với chỉ số cổng được mã hóa 16-bit, có tới 65,536 địa chỉ nội bộ có thể được chuyển đổi sang một địa chỉ công cộng duy nhất.

### Cấu hình NAT Overload

- Xác định dải địa chỉ bên trong cần chuyển dịch ra ngoài (private IP addresses range):
  ```bash
  Router(config)# access-list <ACL-number> permit <source> <wildcard>
  ```
- Cấu hình chuyển đổi địa chỉ IP sang cổng nối ra ngoài:
  ```bash
  Router(config)# ip nat inside source list <ACL-number> interface <interface> overload
  ```
- Xác định các cổng nối vào mạng nội bộ:
  ```bash
  Router(config-if)# ip nat inside
  ```
- Xác định các cổng nối ra mạng công cộng bên ngoài:
  ```bash
  Router(config-if)# ip nat outside
  
  
  ```
![](https://img001.prntscr.com/file/img001/4rW6YguFQRWmi0o1zu4_qA.png)
#### Ví dụ: Cấu hình PAT (NAT Overload) trên router
```bash
Router(config)# access-list 1 permit 192.168.1.0 0.0.0.255
Router(config)# ip nat inside source list 1 interface s0/0/0 overload
Router(config)# interface fa0/0
Router(config-if)# ip nat inside
Router(config)# interface S0/0/0
Router(config-if)# ip nat outside
```

### Các lệnh kiểm tra cấu hình
- Hiển thị bảng NAT đang hoạt động:
  ```bash
  Router# show ip nat translation
  ```
- Hiển thị trạng thái hoạt động của NAT:
  ```bash
  Router# show ip nat statistics
  ```
- Xóa bảng NAT:
  ```bash
  Router# clear ip nat translation *
  ```
- Kiểm tra hoạt động của NAT:
  ```bash
  Router# debug ip nat
  ```
