

### Physical và số vấn đề: 
Đảm nhận việc truyền dòng bit trên các đường truyền

• Phương tiện truyền

• Mã hóa kênh truyền

• Điều chế

• Dồn kênh/phân kênh

### DataLink

- Logic Link Control sublayer

  • Kiểm soát luồng
  
  • Dồn kênh, phân kênh các giao thức
- Media Access Control sublayer
 
  • Đóng gói dữ liệu

  • Định địa chỉ vật lý
  
  • Phát hiện và sửa lỗi
  
  • Điều khiển truy nhập đường truyền
  
#### Các chức năng chính

- Đóng gói: 

  • Đơn vị dữ liệu: khung tin (frame) 
    
  • Bên gửi: thêm phần đầu cho gói tin nhận được từ tầng mạng
    
  • Bên nhận: bỏ phần đầu, chuyển lên tầng mạng
    
- Địa chỉ hóa: sử dụng địa chỉ MAC

- Điều khiển truy nhập đường truyền: nếu mạng đa truy nhập, cần có giao thức điều khiển đa truy nhập

- Kiểm soát luồng: đảm bảo bên nhận không bị quá tải 
- Kiểm soát lỗi: phát hiện và sửa lỗi bit trong các khung tin
- Chế độ truyền: simplex, half-duplex, full-duplex

- Các dạng liên kết 

    • Điểm-điểm(point-to-point): ADSL, Telephone modem,Leased line…
    
    ---
    
    • Điểm-đa điểm (point-to-multipoint): 
    
        • Mạng LAN có dạng bus, mạng LAN hình sao dùng hub
        
        • Mạng không dây
        
        • Cần giao thức điều khiển truy nhập để tránh xung đột
        
        CSMA/CD,


  ![](https://img001.prntscr.com/file/img001/ZEBZTm1nTgG0nsLK-GGBpg.png)
  
  
  
  
- Địa chỉ mạng (Network Address): 
    - Định danh cho một mạng 
    - Tất cả các bit phần HostID là 0 
    - 0.0.0.0: Địa chỉ toàn mạng, đại diện cho 1 mạng bất kỳ

- Địa chỉ quảng bá (Broadcast Address) 
    - Địa chỉ dùng để gửi dữ liệu cho tất cả các máy trạm trong mạng
    -  Tất cả các bit phần HostID là 1 
    - 255.255.255.255: Địa chỉ quảng bá trong 1 mạng
- Địa chỉ nhóm (Multicast address): định danh cho nhóm

- Địa chỉ máy trạm (Unicast Address) 
    - Gán cho một cổng mạng

Mặt nạ mạng xác định phần định danh HostID và NetworkID

    - Kích thước tính theo lũy thừa 2
    
    
    
    
1. Routing Protocol :
Routing được phân làm 3 dạng chính là Interior – Exterior -System . Ở đây chúng ta sẽ chỉ đề cập đến Interior và Exterior
– Interior route thực hiện công việc các công việc hội tụ các routing-table trong cùng một AS ( Autonomous System )
– Exterior thực hiện việc routing giữa các autonomous system với nhau + các policy về sercurity .
– VD : Interior : RIP v1 , RIP v2 , IGRP , OSPF , EIGRP , ….

Exterior : BGP4 , EGP .v.v.
– Các interior Routing protocol có thể được phân thành 3 nhóm ( do sử dụng các thuật giải khác nhau ) : Distance Vector (RIP v1 , RIP v2 , IGRP), Link-State(OSPF , IS-IS) , và Hybrid (eigrp)
– Khái niệm routing-table : là một dạng database cần thiết để thực hiện công việc tìm đường nhanh nhất (Path-determination) cho một packet khi đi vào một internetwork . Routing-table có thể có xây dựng thông qua nhiều cách ,có thể có được một cách tự động thông qua các routing protocol khác nhau hoặc được cấu hình trực tiếp thông qua admin . Mục đích chính của thao tác định tuyến là làm sao tất cả các router của AS có được một routing-table đúng nhất , đồng nhất để việc routing-switching diễn ra tốt nhất . Định tuyến luôn là vấn đề được quan tâm hàng đầu vì việc định tuyến không tốt sẽ dẫn đến toàn bộ mạng sẽ bị down .

2 . Distance Vector :
Các giao thức định tuyến thuộc loại này như : RIP , IGRP , ……
Hoạt động theo nguyên tắc Neighbor , nghĩa là mỗi router sẻ gửi routing-table của mình cho tất cả các router được nối trực tiếp với nó . Các router đó sau đó so sánh với bảng routing-table mà mình hiện có và kiểm tra lại các tuyến đường của mình với các tuyến đường mới nhận được, tuyến đường nào tối ưu hơn sẻ được đưa vào routing-table . Các gói tin update sẽ được gửi theo định kỳ (30 giây với RIP ,90 giây đối với IGRP) .

+Ưu điểm : Dễ cấu hình , router không phải xử lý nhiều nên không tốn nhiều dung lượng bộ nhớ và CPU có tốc độ xử lý nhanh hơn .
+Nhược điểm :
– Hệ thống metric quá đơn giản (như rip chỉ là hop-count ) dẫn đến việc các tuyến đường được chọn vào routing-table chưa phải tuyến đường tốt nhất
– Vì các gói tin update được gửi theo định kỳ nên một lượng bandwidth đáng kể sẻ bị chiếm (mặc dù mạng không gì thay đổi nhiều) .
+ Do Router hội tụ chậm , dẫn đến việc sai lệch trong bảng địn tuyến gây nên hiện tượng loop .

3. Link State :
Các giao thức định tuyến thuộc loại này như OSPF, IS-IS .
Link State không gửi bảng định tuyến của mình , mà chỉ gửi tình trạng của các đường link trong linkstate-database của mình đi cho các router khác, các router sẽ áp dụng giải thuật SPF (shortest path first ) , để tự xây dựng routing-table riêng cho mình . Khi mạng đã hội tụ , Link State protocol sẽ không gửi update định kỳ mà chỉ gởi khi nào có một sự thay đổi trong mạng (1 line bị down , cần sử dụng đường back-up)
+ Ưu điểm : Có thể thích nghi được với đa số hệ thống , cho phép người thiết kế có thể thiết kế mạng linh hoạt , phản ứng nhanh với tình huống xảy ra.
Do không gởi interval-update , nên link state bảo đảm được bandwidth cho các đường mạng .
+ Nhược điểm :
– Do router phải sử lý nhiều , nên chiếm nhiều bộ nhớ , tốc độ CPU chậm hơn nên tăng delay
– Link State khá khó cấu hình để chạy tốt .

4 . So sánh giữa Link State và Distance Vector

+ Các router định tuyến theo Distance vector thực hiện gửi định kỳ toàn bộ bảng định tuyến của mình và chỉ gửi cho các router Neighbor kết nối trực tiếp với mình.

+ Các router định tuyến theo Distance vector không biết được đường đi đến đích một cách cụ thể, không biết về các router trung gian trên đường đi và cấu trúc kết nối giữa chúng.

+ Trong Distance Vector thì bảng định tuyến là nơi lưu kết quả chọn đường tốt nhất của mỗi router. Do đó, khi chúng trao đổi bảng định tuyến với nhau, các router chọn đường dựa trên kết quả đã chọn của router Neighbor . Mỗi router nhìn hệ thống mạng theo sự chi phối của các router Neighbor .

+ Các router định tuyến theo distance vector thực hiện cập nhật thông tin định tuyến theo định kỳ nên tốn nhiều băng thông đường truyền. Khi có sự thay đổi xảy ra, router nào nhận biết sự thay đổi đầu tiên sẽ cập nhật bảng định tuyến của mình trước rồi chuyển bảng định tuyến cập nhật cho các router Neighbor .

+ Trong giao thức định tuyến Link State, các router sẽ trao đổi các LSA (link state advertisement) với nhau để xây dựng và duy trì cơ sở dữ liệu về trạng thái các đường liên kết hay cơ sở dữ liệu về cấu trúc mạng (topology database). Các thông tin trao đổi được gửi dưới dạng multicast.

+ Trong giao thức định tuyến Link State mỗi router đều có một cái nhìn đầy đủ và cụ thể về cấu trúc của hệ thống mạng. Từ đó mỗi router sẽ dùng thuật toán SPF để tính toán chọn đường đi tốt nhất đến từng mạng đích.

+ Khi các router định tuyến theo Link State đã hội tụ xong, nó không thực hiện cập nhật định tuyến theo chu kỳ mà chỉ cập nhật khi nào có sự thay đổi xảy ra. Do đó thời gian hội tụ nhanh và ít tốn băng thông.

+ Giao thức định tuyến theo link state có hỗ trợ CIDR, VLSM nên chúng là một chọn lựa tốt cho các mạng lớn và phức tạp. Nhưng đồng thời nó đòi hỏi dung lượng bộ nhớ lớn và khả năng xử lý mạnh của CPU của router.

+ Để đảm bảo là các database luôn có thông tin mới, trong các LSA này được đánh thêm chỉ số sequence. Chỉ số sequence được bắt đầu từ giá trị initial đến giá trị Max-age. Khi một router nào đó tạo ra một LSA, nó sẽ đặt giá trị sequence bằng initial. Mỗi khi router gửi ra một phiên bản LSA update khác, nó sẽ tăng giá trị đó lên 1. Như vậy, giá trị sequence càng cao thì LSA update càng mới. Nếu giá trị sequence này đạt đến max-age, router sẽ flood LSA ra cho tất cả các router còn lại, sau đó router đó sẽ set giá trị sequence về initial .
+ 


-Các bản ghi thường gặp trong DNS

### Ví dụ Bản Ghi SOA:

```bash
ns1.example.com. admin.example.com. (
    2024082301 ; Serial
    3600       ; Refresh
    1800       ; Retry
    1209600    ; Expire
    86400 )    ; Minimum TTL
```

#### Giải thích các thông số:

1. **`ns1.example.com.`**:
   - **Mô tả**: Đây là tên miền của máy chủ DNS chính (master DNS server) cho vùng DNS. Nó xác định máy chủ DNS chịu trách nhiệm chính cho việc quản lý các bản ghi trong vùng này.

2. **`admin.example.com.`**:
   - **Mô tả**: Đây là địa chỉ email của người quản trị vùng. Trong bản ghi SOA, ký tự `.` được thay thế bằng dấu `@` trong địa chỉ email. Do đó, `admin.example.com.` tương đương với `admin@example.com`. Đây là người liên hệ hoặc người quản lý hệ thống DNS cho vùng này.

3. **`2024082301` (Serial)**:
   - **Mô tả**: Đây là số sê-ri (serial number) của vùng DNS. Số sê-ri là một giá trị số nguyên tăng dần, dùng để thông báo cho các máy chủ DNS phụ (slave servers) rằng có sự thay đổi trong dữ liệu của vùng. Khi bạn cập nhật dữ liệu trong vùng, bạn phải tăng số sê-ri để các máy chủ phụ biết rằng cần phải tải lại dữ liệu. `YYYYMMDDNN`

4. **`3600` (Refresh)**:
   - **Mô tả**: Đây là thời gian (tính bằng giây) mà các máy chủ DNS phụ sẽ chờ trước khi kiểm tra lại với máy chủ chính để xem có cập nhật nào mới không. Trong ví dụ này, giá trị `3600` giây tương đương với 1 giờ.

5. **`1800` (Retry)**:
   - **Mô tả**: Đây là thời gian (tính bằng giây) mà các máy chủ DNS phụ sẽ chờ trước khi thử lại nếu lần kiểm tra lại với máy chủ chính không thành công. Trong ví dụ này, giá trị `1800` giây tương đương với 30 phút.

6. **`1209600` (Expire)**:
   - **Mô tả**: Đây là thời gian (tính bằng giây) mà các máy chủ DNS phụ sẽ giữ lại bản ghi của vùng nếu không thể liên lạc với máy chủ chính trong thời gian này. Nếu không có cập nhật từ máy chủ chính trong khoảng thời gian này, các máy chủ phụ sẽ xem như dữ liệu là hết hạn và không còn cung cấp dịch vụ phân giải cho vùng đó. Trong ví dụ này, giá trị `1209600` giây tương đương với 2 tuần.

7. **`86400` (Minimum TTL)**:
   - **Mô tả**: Đây là thời gian (tính bằng giây) mà các bản ghi trong vùng này có thể được lưu vào bộ nhớ `cache` của máy khách và máy chủ DNS khác. Thời gian này cũng được sử dụng khi không có TTL khác được chỉ định cho bản ghi cụ thể. Trong ví dụ này, giá trị `86400` giây tương đương với 1 ngày.
   
   


    
