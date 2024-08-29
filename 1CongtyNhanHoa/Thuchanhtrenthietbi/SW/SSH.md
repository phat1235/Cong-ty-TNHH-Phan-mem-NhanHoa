
- Để có thể `Telnet/SSH` vào `SW` ta cần phải cấu hình `username` `password ` đăng nhập, số phiên làm việc tối đa có thể kết nối tại cùng một thời điểm.
- Mà trên `SW` ta không thể cài đặt địa chỉ IP trên các `interface` của `SW` được nên ta cần phải tạo 1 VLAN  trên  `interface` kết nối với `Router`.
- Sau đó, ta cài đặt các thông số IP cho `VLAN ` đó.

Dưới đây là hướng dẫn chi tiết để cài đặt và cấu hình SSH trên một switch Cisco:

### 1. **Kiểm tra phiên bản SSH được hỗ trợ**
   Trước khi bắt đầu cấu hình SSH, hãy chắc chắn rằng thiết bị bạn hỗ trợ phiên bản SSH. Bạn có thể kiểm phiên bản hỗ trợ bằng lệnh:

   ```plaintext
  nhanhoa>show ssh
    %No SSHv2 server connections running.
    %No SSHv1 server connections running.
   ```

### 2. **Đặt hostname và domain name cho switch**
   Để sử dụng SSH, bạn cần cấu hình tên thiết bị (hostname) và tên miền (domain name). Điều này cần thiết để tạo ra `khóa mã hóa` cho SSH.

   ```plaintext
nhanhoa#conf t
nhanhoa(config)#hostname nhanhoa
nhanhoa(config)#ip domain-name local.com
   ```

### 3. **Tạo khóa mã hóa RSA**
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
   
  

### 4. **Cấu hình người dùng và mật khẩu**
   Bạn cần tạo người dùng với mật khẩu để đăng nhập SSH. Sử dụng lệnh sau để tạo tài khoản người dùng:

   ```plaintext
   nhanhoa(config)#username phat privilege 15 password phat123
   ```

   - `phat` là tên người dùng bạn muốn tạo.
   - `privilege 15` là mức độ quyền hạn cao nhất. Có mức độ từ 0-15
   - `phat123` là mật khẩu bảo mật của bạn.

### 5. **Cấu hình vty lines để sử dụng SSH**
   Bước tiếp theo là cấu hình các dòng vty (Virtual Terminal Lines) để chỉ cho phép truy cập SSH và vô hiệu hóa Telnet:

   ```plaintext
nhanhoa(config)#line vty 0 5
nhanhoa(config-line)#transport input ssh
nhanhoa(config-line)#login local
   ```

   - `line vty 0 5` chỉ định cho phép 5 phiên kết nối đồng thời.
   - `transport input ssh` chỉ cho phép SSH.
   - `login local` yêu cầu xác thực với cơ sở dữ liệu người dùng cục bộ mà bạn đã tạo..

### 6. **Lưu cấu hình**
   Sau khi hoàn tất các bước trên, hãy lưu cấu hình để đảm bảo các thay đổi sẽ không bị mất khi khởi động lại switch:

   ```plaintext
   nhanhoa#write memory 
   ```

### 7. **Kiểm tra cấu hình SSH**
   Cuối cùng, bạn có thể kiểm tra xem SSH đã được cấu hình đúng chưa bằng cách sử dụng lệnh:

   ```plaintext
   show ip ssh
   ```

   Và kiểm tra trạng thái của các dòng vty:

   ```plaintext
   show running-config | include vty
   ```


### 8. **Kết nối SSH đến switch**
   Bây giờ, tq có thể thử kết nối SSH vào switch từ một thiết bị khác. Sử dụng ứng dụng SSH client như PuTTY, OpenSSH (trên Linux), hoặc các công cụ tương đương. 
   
   Ở đây tôi dùng mobaXterm để thực hiện phiên kết nối SSH vào SW
   
![](https://img001.prntscr.com/file/img001/Iggc3e88SQKKw5Vi9bpkpg.png)
