Để cấu hình `iptables` chặn các kiểu tấn công phổ biến, bạn có thể thêm các quy tắc bảo vệ hệ thống khỏi các cuộc tấn công như **SYN flood**, **ping flood**, **brute force**, và **scan cổng**. Dưới đây là các bước cấu hình cơ bản trong `iptables` nhằm chặn một số kiểu tấn công phổ biến.


### Tôi sẽ làm ví dụ về SYN Flood 
Sử dụng Hping3 để tạo DDOS 
### 1. **Chống SYN Flood**
Tấn công **SYN flood** xảy ra khi một kẻ tấn công gửi hàng loạt gói SYN để tiêu tốn tài nguyên của hệ thống. Để chặn tấn công này, ta sẽ giới hạn tốc độ các gói SYN có thể chấp nhận.

```bash
sudo iptables -A INPUT -p tcp --syn -m limit --limit 1/s --limit-burst 4 -j ACCEPT
```
- Giới hạn nhận gói SYN là 1 gói/giây với "burst" cho phép là 4 gói.

Trước khi thực hiện DDOS
![](https://img001.prntscr.com/file/img001/Y7QwIsgUS9OSHsfQOpkNtQ.png)

Sau khi thực hiện DDOS: 
ta có thể thấy rằng tài nguyên hệ thống đang phải xử lí những  thứ không cần thiết dẫn tới tài nguyên hệ thống cạn kiệt:
![](https://img001.prntscr.com/file/img001/Z3iG-QwsQyye8ndMG30qgQ.png)

### Nhưng sau khi ta chặn các gói tin
CPU đỡ phải xử lí nên xung nhịp giảm
![](https://img001.prntscr.com/file/img001/ISNn71R8Rseii7Y0FKSaSw.png)

![](https://img001.prntscr.com/file/img001/-SwIX_u_RW6UvcLpbLAZ4A.png)

Trong phần này của kết quả từ lệnh `sudo iptables -L -v -n`, chúng ta có thể thấy hai dòng liên quan đến việc xử lý các gói tin trong chuỗi `syn-flood`. Hãy cùng phân tích từng dòng:

### Dòng 1: `RETURN`
```
   72  2880 RETURN     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp flags:0x17/0x02 limit: avg 1/sec burst 4
```
- **72**: Đây là số lượng gói tin (packets) đã được xử lý bởi quy tắc này. Trong trường hợp này, có 72 gói tin TCP đã được nhận.
- **2880**: Tổng số byte đã được xử lý từ các gói tin này, tương ứng với 2880 byte.
- **RETURN**: Điều này cho biết rằng gói tin này đã đáp ứng được điều kiện của quy tắc (tức là không vượt quá giới hạn) và đã được trả về để tiếp tục kiểm tra các quy tắc tiếp theo trong chuỗi.
- **tcp**: Chỉ định rằng quy tắc này chỉ áp dụng cho các gói tin TCP.
- **flags: 0x17/0x02**: Đây là các cờ (flags) của gói tin TCP. `0x17` tương ứng với SYN và ACK được thiết lập. `0x02` tương ứng với gói tin SYN.
- **limit: avg 1/sec burst 4**: Quy tắc này cho phép trung bình 1 gói tin mỗi giây, với khả năng bùng nổ (burst) tối đa là 4 gói trong một thời gian ngắn.

### Dòng 2: `DROP`
```
8459K  338M DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0
```
- **8459K**: Đây là số lượng gói tin đã bị rơi (dropped) bởi quy tắc này. Trong trường hợp này, có khoảng 8,459,000 gói tin đã bị rơi.
- **338M**: Tổng số byte đã bị rơi, tương ứng với khoảng 338 MB.
- **DROP**: Điều này cho biết rằng quy tắc này đã chỉ định rằng các gói tin này không được phép qua, và chúng đã bị loại bỏ hoàn toàn khỏi xử lý.
- **all**: Quy tắc này áp dụng cho tất cả các loại giao thức (protocols).
- **0.0.0.0/0**: Quy tắc này áp dụng cho tất cả các địa chỉ IP.

### 2. **Chặn Ping Flood (ICMP Flood)**
Ping flood là một cuộc tấn công sử dụng các gói ICMP Echo Request để tiêu tốn băng thông và tài nguyên hệ thống.

```bash
sudo iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT
```
- Giới hạn nhận các gói `ICMP Echo Request` (gói ping) chỉ 1 gói/giây.

### 3. **Ngăn chặn Scan cổng (Port Scanning)**
Scan cổng là một kỹ thuật kẻ tấn công dùng để kiểm tra các cổng mở của hệ thống.

```bash
sudo iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP   # Chặn TCP NULL scan
sudo iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP    # Chặn TCP XMAS scan
```
- Quy tắc đầu tiên chặn **TCP NULL scan** (gói không có cờ TCP nào).
- Quy tắc thứ hai chặn **TCP XMAS scan** (gói có tất cả các cờ TCP được bật).

### 4. **Chặn nhiều yêu cầu kết nối từ cùng một địa chỉ IP (Brute Force Attack)**
Một cách tấn công brute force phổ biến là gửi nhiều yêu cầu kết nối đến một dịch vụ để đoán mật khẩu hoặc khai thác lỗ hổng.

```bash
sudo iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set
sudo iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --update --seconds 60 --hitcount 4 -j DROP
```
- Quy tắc này sẽ chặn địa chỉ IP nếu họ gửi quá 4 yêu cầu kết nối đến cổng 22 (SSH) trong vòng 60 giây.

### 5. **Chặn các gói có lỗi hoặc không hợp lệ**
```bash
sudo iptables -A INPUT -m state --state INVALID -j DROP
```
- Quy tắc này sẽ chặn tất cả các gói có trạng thái không hợp lệ.

### 6. **Giới hạn số lượng kết nối đồng thời từ một IP**
```bash
sudo iptables -A INPUT -p tcp --syn -m connlimit --connlimit-above 10 -j REJECT
```
- Giới hạn số kết nối đồng thời từ cùng một địa chỉ IP là 10 kết nối.

### 7. **Chặn tấn công Spoofing**
Chặn các gói tin có địa chỉ IP không hợp lệ từ các mạng cục bộ.

```bash
sudo iptables -A INPUT -s 127.0.0.0/8 -j DROP     # Chặn IP loopback
sudo iptables -A INPUT -s 224.0.0.0/4 -j DROP     # Chặn multicast
sudo iptables -A INPUT -s 240.0.0.0/5 -j DROP     # Chặn các địa chỉ IP reserved
```

### 8. **Lưu và áp dụng cấu hình**
Sau khi cấu hình, bạn có thể lưu lại các quy tắc iptables để đảm bảo chúng được áp dụng sau mỗi lần khởi động lại hệ thống.

```bash
sudo iptables-save > /etc/iptables/rules.v4
```

### Kết luận:
- Các quy tắc trên giúp bạn bảo vệ hệ thống khỏi các cuộc tấn công phổ biến như SYN flood, ping flood, brute force, và scan cổng.
- Nên giám sát tường lửa thường xuyên và điều chỉnh cấu hình tùy theo nhu cầu bảo mật của hệ thống.
