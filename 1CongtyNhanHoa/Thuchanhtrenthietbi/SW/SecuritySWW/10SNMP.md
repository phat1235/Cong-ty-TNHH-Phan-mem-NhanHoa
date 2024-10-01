
### 


1. **Cấu Hình SNMP Phiên Bản Mới**:
   - Sử dụng SNMPv3, vì nó cung cấp bảo mật tốt hơn so với SNMPv1 và SNMPv2c. SNMPv3 hỗ trợ xác thực và mã hóa.

   ```bash
   configure terminal
   snmp-server group MyGroup v3 priv
   snmp-server user MyUser MyGroup v3 auth sha MyAuthPass priv aes 128 MyPrivPass
   ```

   - **Giải thích**:
     - `MyGroup`: Tên nhóm SNMP.
     - `MyUser`: Tên người dùng SNMP.
     - `MyAuthPass`: Mật khẩu xác thực (thay thế bằng mật khẩu mạnh của bạn).
     - `MyPrivPass`: Mật khẩu mã hóa (thay thế bằng mật khẩu mạnh của bạn).

![](https://img001.prntscr.com/file/img001/NDYt4TqYQpK2M0cQSEqbpA.png)
![](https://img001.prntscr.com/file/img001/NQXbwDO6TAeNJr-FPanhjg.png)
2. **Hạn Chế Truy Cập SNMP**:
   - Bạn có thể hạn chế truy cập SNMP chỉ từ một số địa chỉ IP cụ thể:

   ```bash
   snmp-server host <IP_ADDRESS> version 3 MyUser
   ```

   - Thay thế `<IP_ADDRESS>` bằng địa chỉ IP của hệ thống quản lý SNMP của bạn.

3. **Cấu Hình Thông Báo SNMP Traps (Tùy Chọn)**:

4. **Xác Thực Truy Cập SNMP**:
   - Đảm bảo rằng chỉ các quản trị viên có quyền truy cập SNMP. Bạn có thể cấu hình để hạn chế truy cập từ các IP không được phép.

   ```bash
   access-list 10 permit <AUTHORIZED_IP>
   snmp-server community <COMMUNITY_STRING> RO 10
   ```

   - Thay thế `<AUTHORIZED_IP>` bằng địa chỉ IP được phép truy cập.

5. **Tắt SNMPv1 và SNMPv2c**:
   - Nếu bạn không sử dụng SNMPv1 và SNMPv2c, hãy tắt chúng để tăng cường bảo mật:

   ```bash
   no snmp-server community public
   no snmp-server community private
   ```
   ![](https://img001.prntscr.com/file/img001/deBiGDaAQQCgwqp0XZp0eQ.png)

7. **Lưu Cấu Hình**:
   - Sau khi thực hiện tất cả các thay đổi, lưu cấu hình để đảm bảo các thay đổi được áp dụng ngay cả khi khởi động lại switch.

   ```bash
   end
   write memory
   ```
   ![](https://img001.prntscr.com/file/img001/pRc99Zh7Q7C_-yqqEGNBhw.png)

### Kiểm Tra
- Sau khi cấu hình, hãy kiểm tra lại bằng cách sử dụng một công cụ SNMP để đảm bảo rằng bạn có thể truy cập SNMP với người dùng và mật khẩu mà bạn đã cấu hình.
- 
Để sử dụng `snmpwalk` với SNMPv3 và thông tin xác thực mà bạn đã cung cấp, bạn cần cấu hình lệnh `snmpwalk` như sau:

### Cú Pháp Của Lệnh `snmpwalk`

```bash
snmpwalk -v 3 -u phat20 -l authPriv -a SHA -A phat12345 -x AES -X phat12345 <IP_ADDRESS> <OID>
```

### Giải thích các tham số:
- `-v 3`: Chỉ định phiên bản SNMP là v3.
- `-u phat20`: Tên người dùng SNMP (trong trường hợp này là `phat20`).
- `-l authPriv`: Chỉ định cấp độ bảo mật là `authPriv`, có nghĩa là có xác thực và mã hóa.
- `-a SHA`: Chỉ định phương pháp xác thực là SHA.
- `-A phat12345`: Mật khẩu xác thực (auth password).
- `-x AES`: Phương pháp mã hóa là AES.
- `-X phat12345`: Mật khẩu mã hóa (priv password).
- `<IP_ADDRESS>`: Địa chỉ IP của thiết bị bạn muốn kiểm tra.
- `<OID>`: Object Identifier mà bạn muốn truy vấn (ví dụ: `1.3.6.1.2.1.1` cho thông tin hệ thống). Nếu bạn muốn lấy tất cả thông tin, bạn có thể bỏ qua tham số này.

### Ví dụ Cụ Thể
Giả sử bạn muốn truy vấn thông tin hệ thống từ một thiết bị với địa chỉ IP `192.168.1.1`, lệnh sẽ như sau:

```bash
snmpwalk -v 3 -u phat20 -l authPriv -a SHA -A phat12345 -x AES -X phat12345 192.168.1.1 1.3.6.1.2.1.1
```


### Ta  sử dụng ubuntu để test làm snmp client nhé!
![](https://img001.prntscr.com/file/img001/5djLXLQ4QUSLCuw9ziUjDQ.png)

# OID Monitoring for Switches
## Purpose

### All Switches
| OID                                 | Description                                             |
|-------------------------------------|---------------------------------------------------------|
| `1.3.6.1.2.1.2.2.1.10`              | Traffic on interface (incoming) in bytes (32-bit counter) [1] |
| `1.3.6.1.2.1.2.2.1.16`              | Traffic on interface (outgoing) in bytes (32-bit counter) [1] |
| `1.3.6.1.2.1.31.1.1.1.6`            | Traffic on interface (incoming) in bytes (64-bit counter) [1] |
| `1.3.6.1.2.1.31.1.1.1.10`           | Traffic on interface (outgoing) in bytes (64-bit counter) [1] |
| `1.3.6.1.2.1.2.2.1.20`              | Errors on interface (incoming) [1]                     |
| `1.3.6.1.2.1.2.2.1.20`              | Errors on interface (outgoing) [1]                     |

### CISCO Switches
| OID                                     | Description                                         |
|-----------------------------------------|-----------------------------------------------------|
| `1.3.6.1.4.1.9.2.1.56.0`                | Average CPU load for 5 seconds                     |
| `1.3.6.1.4.1.9.2.1.57.0`                | Average CPU load for 60 seconds                    |
| `1.3.6.1.4.1.9.2.1.58.0`                | Average CPU load for 5 minutes                     |
| `1.3.6.1.4.1.9.2.1.8.0`                 | Free memory size                                   |
| `1.3.6.1.2.1.1.3.0`                     | Uptime                                            |
| `1.3.6.1.4.1.9.2.1.2.0`                 | Reboot reason                                     |
| `1.3.6.1.4.1.9.9.13.1.3.1.2`           | Temperature sensors (description) [2]             |
| `1.3.6.1.4.1.9.9.13.1.3.1.3`           | Temperature sensors (state) [2]                    |
| `1.3.6.1.4.1.9.9.13.1.4.1.2`           | Fan sensors (description) [2]                      |
| `1.3.6.1.4.1.9.9.13.1.4.1.3`           | Fan sensors (state) [2]                            |
| `1.3.6.1.4.1.9.9.13.1.5.1.2`           | Power unit voltage (description) [2]               |
| `1.3.6.1.4.1.9.9.13.1.5.1.3`           | Power unit voltage (state) [2]                     |
| `1.3.6.1.4.1.9.9.117.1.1.1.1.3.15`     | Total power load in Watts [3]                      |
| `1.3.6.1.4.1.9.9.117.1.1.1.1.4.15`     | Used power in Watts [3]                            |

