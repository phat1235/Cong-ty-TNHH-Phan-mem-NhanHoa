Trong thiết kế mạng, việc tạo ra các kết nối dư thừa là cần thiết nhằm tạo khả năng dự phòng cho hệ thống. Tuy nhiên, khi thiết kế dự phòng trên Switch thì có 3 vấn đề cần xem xét là: bão quảng bá, nhiều gói tin được nhận giống nhau và bảng địa chỉ MAC trên các Switch không ổn định. Có thể gọi chung trường hợp này là “switching loop”.

Giao thức STP được sử dụng để giải quyết vấn đề này bằng cách khóa tạm thời một hoặc một số cổng để tránh tình trạng như trên.

![](https://img001.prntscr.com/file/img001/O7TB5QRZTG-1VLXQL-gzXw.png)

### Hoạt động của STP qua các bước sau:
- Bầu chọn 1 switch làm “Root switch” còn gọi là “Root bridge".
- Chọn “Root port” trên các switch còn lại.
- Chọn “Designated port” trên mỗi phân đoạn (segment) mạng.
- Cổng còn lại gọi là “Nondesignated port” sẽ bị khóa.

### Quá trình bầu chọn “root switch”

![](https://img001.prntscr.com/file/img001/-yS6W5zXT2aYHO5A5imMWA.png)
Mỗi switch có một giá trị “Bridge-ID” gồm 2 trường là “Bridge priority” và “MAC address” và được đặt vào trong BPDU và gửi quảng bá cho các switch khác mỗi 2 giây. Switch được chọn làm “root switch” là switch có giá trị “Bridge-ID” nhỏ nhất. Để so sánh, giá trị “Bridge priority” được dùng để so sánh trước, nếu tất cả các switch đều có giá trị này bằng nhau thì tham số thứ 2 là “MAC address” sẽ được dùng để so sánh.

Các loại cổng khác “root port”, “designated port” sẽ lần lượt được bầu chọn dựa vào chi phí nhỏ nhất tính từ nó đến “root switch”. Dựa vào bảng sau để tính chi phí cho mỗi chặn.

![](https://img001.prntscr.com/file/img001/Bvnm5bFCSfqMiD55dGs23A.png)

Một số dạng STP được cải tiến như: PVSTP+ (Per VLAN Spanning Tree Plus) dùng tạo cho mỗi VLAN một STP riêng.

![](https://img001.prntscr.com/file/img001/6xoGeibrSduoPaQ-9SRz-g.png)

Một số cải tiến khác như RSTP (Rapid Spanning Tree Protocol), MSTP.

![](https://img001.prntscr.com/file/img001/FOJJ_nLqR72jbPSmFrZo_g.png)


![](https://img001.prntscr.com/file/img001/PA3TDUSlQLatSvsNd7h1aQ.png)

![](https://img001.prntscr.com/file/img001/GFaO8YYRT2mcXoqDCQQ1Qw.png)

![](https://img001.prntscr.com/file/img001/7GJnTXaXTUaihsuyiQAcKQ.png)

### Một số lệnh cấu hình để điều chỉnh giá trị “Bridge priority” mặc định của switch:

Chọn switch làm “root switch” bằng lệnh sau:

        Switch(config)# spanning-tree priority <>
        Switch(config)# spanning-tree cost <>
```bash
Switch(config)# spanning-tree vlan <vlan-id> root primary
hoặc 
Switch(config)# spanning-tree vlan <vlan-id> priority <priority>
