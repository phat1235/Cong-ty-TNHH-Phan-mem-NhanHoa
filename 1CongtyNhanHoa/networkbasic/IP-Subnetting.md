
1. **IPv4**:
   - IPv4 có độ dài 32 bit, được chia thành 4 nhóm (octet), mỗi nhóm gồm 8 bit, và được biểu diễn dưới dạng: `octet1.octet2.octet3.octet4`.

2. **Cấu trúc của Địa chỉ IP**:
   - Địa chỉ IP được chia thành hai phần chính: **Network ID** và **Host ID**.
   - **Network ID**: Được xác định bởi octet đầu tiên và phân loại theo 5 lớp (Class) là A, B, C, D, E.(để nhận dạng)
   - **Host ID**: Được xác định bởi các octet còn lại. Một địa chỉ IP cụ thể không được phép có giá trị Host ID là 0 hoặc 255, bởi vì giá trị 0 thường được dùng để xác định địa chỉ của một mạng, còn 255 dùng để phát tín hiệu broadcast trong mạng.

3. **Lớp Địa chỉ Mạng (Network Class)**:
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
   - Subnet mask được sử dụng để chia một mạng lớn thành các mạng con nhỏ hơn. Nó giúp xác định xem một host đang thuộc cùng một subnet nội bộ hay nằm trên một mạng từ xa (remote network).
   - Ví dụ về Subnet mask 24-bit:
     - **Địa chỉ IP**: 192.168.123.132 (biểu diễn nhị phân: 11000000.10101000.01111011.10000100)
     - **Subnet mask**: 255.255.255.0 (biểu diễn nhị phân: 11111111.11111111.11111111.00000000)
     - **Network Address**: 192.168.123.0 (11000000.10101000.01111011.00000000)
     - **Host Address**: 132 (00000000.00000000.00000000.10000100)

5. **Chia nhỏ Mạng**:
   - Để chia một mạng lớn thành nhiều mạng con, người ta có thể mượn thêm bit từ phần Host ID. Ví dụ, nếu mượn 2 bit từ octet cuối (Octet4), ta có thể chia một mạng thành 4 subnet nhỏ hơn với Subnet mask 26-bit (255.255.255.192).
   - Ví dụ:
     - Các mạng con: 
       - 192.168.123.0/26 (192.168.123.1-62)
       - 192.168.123.64/26 (192.168.123.65-126)
       - 192.168.123.128/26 (192.168.123.129-190)
       - 192.168.123.192/26 (192.168.123.193-254)

6. **Gộp Mạng**:
   - Để tăng số lượng host trong một mạng, bạn có thể gộp hai mạng nhỏ thành một mạng lớn hơn. Ví dụ, gộp hai subnet 192.168.123.128/26 và 192.168.123.192/26 thành một mạng 192.168.123.128/25.

7. **Gateway Mặc Định**:
   - Để kết nối các host thuộc các mạng khác nhau, cần sử dụng các router để định tuyến lưu lượng. Router được chỉ định thực hiện việc này được gọi là **Default Gateway**.

