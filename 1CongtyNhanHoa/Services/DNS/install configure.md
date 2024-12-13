

**Bước 1 – Cấu hình Địa chỉ IP Tĩnh cho Máy chủ DNS**  
Để cấu hình máy chủ DNS, đầu tiên bạn cần thiết lập một địa chỉ IP tĩnh cho máy chủ DNS của mình. Địa chỉ IP tĩnh đảm bảo rằng máy chủ luôn có cùng một địa chỉ IP khi khởi động lại hoặc trong suốt quá trình hoạt động. Điều này giúp duy trì sự ổn định của máy chủ và đảm bảo rằng các thiết bị khác trong mạng có thể tìm thấy và truy cập vào máy chủ DNS một cách nhất quán.

---

**Bước 2 – Cấu hình FQDN/Tên đầy đủ cho Máy chủ DNS**  
Bước tiếp theo là cấu hình Tên miền Đầy đủ (FQDN) cho máy chủ DNS. FQDN là một định danh duy nhất cho máy chủ trong mạng và được sử dụng để nhận diện máy chủ trong hệ thống DNS.

Cấu hình FQDN bao gồm việc đặt tên cho máy chủ và tên miền tương ứng của nó. Điều này giúp xác định địa chỉ IP của máy chủ khi được truy vấn qua DNS.

---

**Bước 3 – Cài đặt Máy chủ DNS Chính trên Ubuntu**  
Trước khi bắt đầu cài đặt, hãy đảm bảo rằng hệ thống của bạn đã được cập nhật. Sử dụng lệnh sau để cập nhật:

```bash
sudo apt update && sudo apt upgrade -y
```

Cài đặt `bind9` là một trong những bước đầu tiên bạn cần thực hiện để tạo máy chủ DNS của riêng mình. Chạy lệnh sau để cài đặt bind9 và các phụ thuộc của nó:

```bash
sudo apt install bind9 bind9utils bind9-doc -y
```

Trong đó:
- **bind9** – Phần mềm máy chủ DNS BIND 9.
- **bind9utils** – Các tiện ích giúp làm việc với BIND 9 dễ dàng hơn.
- **bind9-doc** – Gói tài liệu cho BIND 9.

---
```
✳️ DNS Server
     🔸 My Domain: nhanhoa2000.com
     🔸 Hostname: dns-1
     🔸 FNQD: dns-1.nhanhoa2000.com
     🔸 IP address: 172.16.5.10/20
✳️ Mail Server
     🔸 Hostname: mail
     🔸 FNQD: mail.nhanhoa2000.com
     🔸 IP address: 172.16.5.15/20
✳️ Web Server
     🔸 Hostname: www
     🔸 FNQD: www.nhanhoa2000.com
     🔸 IP address: 172.16.5.20/20
```
**Bước 4 – Cấu hình Máy chủ DNS Chính trên Ubuntu**  
Sau khi cài đặt BIND9, truy cập vào thư mục `/etc/bind9`. Thư mục này lưu trữ các tệp cấu hình của BIND9.

```bash
cd /etc/bind
ls
```
![](https://img001.prntscr.com/file/img001/cOuGSjFkRTODeoDKhbCRPA.png)
Bạn sẽ thấy các tệp cấu hình mặc định của BIND9 như sau:
- **named.conf**: Tệp cấu hình chính của BIND9, chứa các cài đặt toàn cục và tham chiếu đến các tệp cấu hình khác.
- **named.conf.options**: Tệp này bao gồm các tùy chọn cho máy chủ BIND9, chẳng hạn như giao diện lắng nghe, chuyển tiếp truy vấn, và cài đặt nhật ký.
- **named.conf.local**: Tệp này dùng để định nghĩa các vùng (zones) địa phương và các cài đặt cấu hình cho từng vùng.
- **named.conf.default-zones**: Bao gồm các vùng được cấu hình sẵn cho localhost và tìm kiếm DNS đảo ngược.
- **db.local**: Tệp này là tệp vùng cho miền localhost.
- **db.127**: Tệp này là tệp vùng cho tìm kiếm DNS đảo ngược địa chỉ loopback (127.0.0.1).


```

✳️ DNS Server
     🔸 My Domain: nhanhoa2000.com
     🔸 Hostname: dns-1
     🔸 FNQD: dns-1.nhanhoa2000.com
     🔸 IP address: 172.16.5.10/20
✳️ Mail Server
     🔸 Hostname: mail
     🔸 FNQD: mail.nhanhoa2000.com
     🔸 IP address: 172.16.5.15/20
✳️ Web Server
     🔸 Hostname: www
     🔸 FNQD: www.nhanhoa2000.com
     🔸 IP address: 172.16.5.20/20

```
**Chỉnh sửa tệp named.conf.options**  
Dùng trình soạn thảo vim mở tệp `named.conf.options` với lệnh sau:

```bash
sudo vim named.conf.options
```

Xóa toàn bộ nội dung của tệp bằng cách nhấn phím **Esc** để vào chế độ lệnh, gõ `:1,$d` và nhấn **Enter**.

Sau đó, nhấn phím **i** để chuyển sang chế độ chèn và thêm nội dung sau:

```bash
📌 named.conf.options

// Define LAN network
acl MYLAN {
	172.16.5.0/20;
};
options {
	// Default directory
	directory "/var/cache/bind";
	// Allow queries from localhost and LAN network
	allow-query {
		localhost;
		MYLAN;
	};
	// Use Google DNS as a forwarder
	forwarders{
		8.8.8.8 ;
		8.8.4.4 ;
	};
	// Allow recursive queries
	recursion yes;
};
```

Lưu và thoát khỏi tệp bằng cách nhấn **ESC** và gõ `:x` rồi nhấn **Enter**.

Chạy lệnh sau để kiểm tra lỗi cú pháp:

```bash
sudo named-checkconf named.conf.options
```

Nếu lệnh không hiển thị thông báo lỗi, điều đó có nghĩa là tệp cấu hình đã được viết đúng và sẵn sàng để sử dụng.

---
### Chỉnh file  named.conf.local
```
📌 named.conf.local

// Define the Forward zone
// My domain: nhanhoa2000.com
// Forward file called forward.nhanhoa2000.com
zone "nhanhoa2000.com" IN { 
	type master;
	// Path of Forward file
	file "/etc/bind/nhanhoa2000/forward.nhanhoa2000.com";
};
// Define the Reverse zone
// Reverse file called: reverse.nhanhoa2000.com
zone "5.16.172.in-addr.arpa" IN {
        type master;
        file "/etc/bind/nhanhoa2000/reverse.nhanhoa2000.com";
};

```
---

**Bước 5 – Cấu hình Các Vùng (Zones)**  
Trong bước 4, chúng ta đã khai báo các tệp Forward (forward.nhanhoa2000.com) và Reverse (reverse.nhanhoa2000.com) trong thư mục `/etc/bind/nhanhoa2000/`. Vì vậy, để tiếp tục, chúng ta cần tạo một thư mục tên là **nhanhoa2000** trong đường dẫn `/etc/bind/` để lưu trữ các tệp này bằng lệnh sau:

```bash
sudo mkdir nhanhoa2000
cd nhanhoa2000
```

**Tạo tệp Forward Zone**  
Forward Zone trong DNS dùng để ánh xạ các tên miền với địa chỉ IP. Điều này giúp máy chủ DNS hiểu được địa chỉ IP tương ứng với mỗi tên miền yêu cầu.

Tạo một tệp mới có tên `forward.nhanhoa2000.com` cho Forward Zone bằng lệnh sau:

```bash
sudo vim forward.nhanhoa2000.com
```

Thêm nội dung sau vào tệp:

```bash
Create folder nhanhoa2000

📌 forward.nhanhoa2000.com

$TTL    604800
; SOA record with MNAME and RNAME updated
@       IN      SOA     nhanhoa2000.com. root.nhanhoa2000.com. (
                              3         ; Serial Note: increment after each change
                         604800         ; Refresh
                          86400         ; Retry
                        2019200         ; Expire
                         604800 )       ; Negative Cache TTL
; Name server record 
@       IN      NS      dns-1.nhanhoa2000.com.
; A record for name server
dns-1	IN      A       172.16.5.10
www	    IN		A		192.168.1.21
mail	IN		A		172.16.5.15

; Mail handler or MX record for the domain nhanhoa2000.com
nhanhoa2000.com.    IN     MX   10   mail.nhanhoa2000.com.

; A record for clients
client1      IN      A       192.168.1.111
client2      IN      A       192.168.1.112
```

Lưu và thoát khỏi tệp.

---

**Tạo tệp Reverse Zone**  
Reverse Zone trong DNS dùng để ánh xạ các địa chỉ IP thành tên miền. Điều này giúp máy chủ DNS biết tên miền tương ứng với mỗi địa chỉ IP.

Tạo một tệp mới có tên `reverse.nhanhoa2000.com` cho Reverse Zone bằng lệnh sau:

```bash
sudo vim reverse.nhanhoa2000.com
```

Thêm nội dung sau vào tệp:

```bash
$TTL    604800
; SOA record with MNAME and RNAME updated
@       IN      SOA     nhanhoa2000.com. root.nhanhoa2000.com. (
                              2         ; Serial Note: increment after each change
                         604800         ; Refresh
                          86400         ; Retry
                        2019200         ; Expire
                         604800 )       ; Negative Cache TTL
; Name server record 
@       IN      NS      dns-1.nhanhoa2000.com.
; A record for name server
dns-1	IN      A       172.16.5.10
www	IN	A	192.168.1.21
mail    IN	A	192.168.1.10
; PTR record for name server
10	IN      PTR     dns-1.nhanhoa2000.com
15	IN	PTR	www.nhanhoa2000.com
20	IN	PTR	mail.nhanhoa2000.com
; PTR record for clients
228	IN      PTR     client1.nhanhoa2000.com
229	IN      PTR     client2.nhanhoa2000.com
```

Lưu và thoát khỏi tệp.

---

**Bước 6 – Điều chỉnh Tường lửa (Firewall)**  
Nếu bạn đã bật UFW (Uncomplicated Firewall) trên hệ thống, bạn cần mở quyền truy cập cho BIND9 bằng lệnh sau:

```bash
sudo ufw enable
sudo ufw allow Bind9
sudo ufw reload
sudo ufw status
```

---

**Bước 7 – Kiểm tra**  
Trên Windows, để kiểm tra xem máy chủ DNS có hoạt động đúng không, hãy cấu hình DNS để trỏ đến địa chỉ IP của máy chủ DNS. Sau đó, mở Command Prompt và sử dụng các lệnh sau:

```bash
nslookup
192.168.1.15
www.nhanhoa2000.com
```

Nếu bạn nhận được kết quả chính xác từ máy chủ DNS, điều đó có nghĩa là máy chủ DNS đang hoạt động chính xác.

--- 

```
sudo named-checkzone nhanhoa2000.com forward.nhanhoa2000.com
sudo systemctl restart bind9


```
