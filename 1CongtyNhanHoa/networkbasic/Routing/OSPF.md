



## 1. OSPF

![](https://img001.prntscr.com/file/img001/uuF8PvXDT5uaFg_VFzXBQQ.png)

OSPF (Open Shortest Path First) là một giao thức định tuyến dạng link-state, sử dụng thuật toán Dijkstra để xây dựng bảng định tuyến.

### Đặc điểm của OSPF
- **Link-State**: OSPF là giao thức link-state với ưu điểm hội tụ nhanh, hỗ trợ mạng lớn và không xảy ra "routing loop".
- **Classless**: Hỗ trợ VLSM và mạng không liên tục.
- **Địa chỉ Multicast**: Sử dụng 224.0.0.5 và 224.0.0.6 (DR và BDR router) để gửi thông điệp hello và update trong quá trình cập nhật định tuyến.
- **Phân cấp**: Được thiết kế theo dạng phân cấp, sử dụng các area để giảm yêu cầu về CPU và bộ nhớ của router.
- **Chứng thực**: Hỗ trợ chứng thực dạng Plain-Text và MD5.

### Metric của OSPF
- **Metric**: OSPF sử dụng metric là cost. Cost của toàn tuyến được tính theo cách cộng dồn cost dọc theo tuyến đường đi của packet. Công thức tính cost là 10/bandwidth, với giá trị bandwidth được cấu hình trên mỗi cổng của router, đơn vị tính là bps.
- **Thay đổi Cost**: Có thể thay đổi giá trị cost. Nếu có nhiều đường đến đích với chi phí bằng nhau, router sẽ cân bằng tải trên các đường đó (mặc định trên 4 đường, tối đa là 16 đường).
- **Tham số bắt buộc**: Hello/dead interval, Area-ID, authentication password (nếu có), stub area flag phải giống nhau trong các router chạy OSPF trong một hệ thống mạng.

### Các loại môi trường OSPF
- **Multiple Access** (Ethernet)
- **Point-to-Point**
- **NBMA (Non-Broadcast Multiple Access)**

### Quá trình xây dựng bảng định tuyến của OSPF
1. **Gửi gói hello**: OSPF gửi các gói hello định kỳ để thiết lập quan hệ láng giềng. Gói tin hello chứa thông tin thương lượng với các router láng giềng trước khi thiết lập quan hệ adjacency.
2. **Bầu DR và BDR**: Trong mạng đa truy cập, giao thức hello bầu DR và BDR. DR và BDR thiết lập mối quan hệ adjacency với tất cả các router khác, các router khác chỉ trao đổi thông tin với DR và BDR. Trong mạng Point-to-Point không cần chọn DR và BDR.
3. **Nhận LSA**: Mỗi router nhận một LSA từ láng giềng với cơ sở dữ liệu về trạng thái các đường liên kết (link-state database) của láng giềng đó và gửi một bản sao của LSA tới tất cả các láng giềng khác.
4. **Xây dựng cơ sở dữ liệu**: Bằng cách gửi các LSA cho toàn bộ một area, tất cả router sẽ xây dựng chính xác cơ sở dữ liệu về trạng thái liên kết. Khi cơ sở dữ liệu được hoàn tất, mỗi router sử dụng thuật toán SPF để xây dựng cây SPF.
5. **Bảng định tuyến**: Mỗi router xây dựng bảng định tuyến từ cây SPF, cung cấp thông tin về đường đến tất cả các mạng đích trong hệ thống mạng.

### Quá trình bầu chọn DR và BDR
- **Tham số**: Quá trình bầu chọn dựa trên độ ưu tiên (priority) và router-ID. 
  - **Priority**: Giá trị nằm trong khoảng từ 0 đến 255. Nếu priority là 0, router không tham gia bầu chọn. Router có độ ưu tiên cao nhất được chọn là DR, cao thứ hai là BDR. Mặc định, giá trị priority OSPF là 1.
  - **Router-ID**: Khi priority đều bằng nhau, OSPF bầu chọn DR dựa vào router-ID. Nếu không cấu hình cổng loopback, giá trị router-ID là địa chỉ IP lớn nhất của các cổng đang hoạt động trên router. Nếu có nhiều cổng loopback, chọn cổng có địa chỉ IP cao nhất.

### Cấu hình OSPF
**Khởi tạo tiến trình định tuyến OSPF**:

        Router(config)# router ospf <process-id>
  
**Chọn cổng tham gia vào quá trình trao đổi thông tin định tuyến**

    Router(config-router)# network <address> <wildcard-mask> area <area-id>
Trong đó:

- Process-id: chỉ số tiến trình của OSPF, mang tính chất có giá trị 1 đến 65535.

- Address: địa chỉ cổng tham gia định tuyến cục bộ

- Wildcard mask: điều kiện kiểm tra giữa địa chỉ cấu hình trong address và địa chỉ các cổng trên router, tương ứng bit 0 – phải so khớp, bit 1  không cần kiểm tra.
 
- Area-id: vùng mà cổng tương ứng thuộc về trong kiến trúc
OSPF.

**Các câu lệnh kiểm tra cấu hình OSPF**

        Router#show ip protocol
        Router#show ip route
        Router#show ip ospf interface Router#show ip ospf neighbor
        Router#debug ip ospf events



Cấu hình chứng thực ClearText
    
        Router(config)# interface <interface>
        Router(config-if)# ip ospf authentication
        Router(config-if)# ip ospf authentication-key <password>

Cấu hình chứng thực MD5
        
        Router(config)# interface <interface>
        Router(config-if)# ip ospf authentication message-digest
        Router(config-if)# ip ospf message-digest-key 1 md5 <password>
    

