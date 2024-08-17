### Giao thức UDP là gì?

![](https://img001.prntscr.com/file/img001/ektTrOmVQAKzbhlSPdBMpg.png)

Giao thức UDP (User Datagram Protocol) là một trong hai giao thức chính được sử dụng trong **Internet Protocol Suite** (hay TCP/IP Suite), cùng với **TCP** (Transmission Control Protocol). UDP là một giao thức giao tiếp không đảm bảo tin cậy giữa các máy tính trên mạng, không cung cấp các cơ chế kiểm soát lỗi hoặc xác nhận tin nhắn như TCP. Thay vào đó, UDP tập trung vào việc chuyển giao dữ liệu một cách nhanh chóng và hiệu quả.

UDP được sử dụng cho các ứng dụng cần truyền dữ liệu yêu cầu tốc độ cao hơn so với việc đảm bảo tin cậy, chẳng hạn như **DNS** (Domain Name System), **streaming media**, **video games**, và **VoIP** (Voice over IP).

### UDP hoạt động thế nào?

![](https://img001.prntscr.com/file/img001/5UMxW-FIQyy5c879E_OBMQ.png)

UDP hoạt động ở **tầng giao vận** (tầng 4) trong mô hình **OSI**. Nó sử dụng các gói tin gọi là **datagram** để truyền dữ liệu qua mạng. Mỗi datagram bao gồm các thông tin như:

- **Cổng nguồn** (Port nguồn)
- **Cổng đích** (Port đích)
- **Địa chỉ IP nguồn**
- **Địa chỉ IP đích**
- **Dữ liệu cần truyền đi**

UDP không cung cấp cơ chế kiểm soát lỗi, xác nhận hoặc truy xuất dữ liệu đã gửi như TCP. Điều này có thể dẫn đến việc mất gói tin hoặc thứ tự đến không đúng.

### Cấu trúc của một Datagram UDP

![](https://img001.prntscr.com/file/img001/-L71yjG-S4eZejpJ2sVgrg.png)

Một gói tin UDP bao gồm hai thành phần chính:

1. **Header UDP**:
   - **Port nguồn**: Số cổng của máy gửi datagram.
   - **Port đích**: Số cổng của máy nhận datagram.
   - **Độ dài**: Chiều dài của toàn bộ datagram, tính bằng byte.
   - **Kiểm tra**: Giá trị kiểm tra để xác định tính toàn vẹn của datagram.

2. **Dữ liệu UDP**: Phần chứa dữ liệu thực sự mà người gửi muốn truyền qua mạng.

### Ứng dụng của UDP

UDP được sử dụng rộng rãi trong các ứng dụng như:

- **VoIP**: Truyền dữ liệu âm thanh thời gian thực với tốc độ nhanh chóng.
- **DNS**: Truy vấn tên miền với độ trễ thấp.
- **Streaming Media**: Truyền tải video và âm thanh trực tiếp.
- **Video Games**: Truyền tải dữ liệu trò chơi với yêu cầu về tốc độ.

### Các lưu ý khi dùng UDP

- **Bảo mật**: UDP dễ bị tấn công DDoS do thiếu cơ chế kiểm soát kết nối và xác nhận dữ liệu.
- **Xác thực và mã hóa**: UDP không cung cấp cơ chế xác thực người gửi hoặc mã hóa dữ liệu, cần sử dụng các cơ chế bảo mật như **TLS** hoặc **IPsec**.
- **Firewall và Router**: UDP không có cơ chế xác nhận kết nối nên cần cấu hình firewall và router phù hợp để tránh mất dữ liệu.

### So sánh UDP và TCP

![](https://img001.prntscr.com/file/img001/2Lnt8_o5Rd2UsNwDjISohw.png)

- **Đảm bảo dữ liệu**: UDP không đảm bảo tính toàn vẹn dữ liệu; TCP đảm bảo tính toàn vẹn.
- **Thiết lập kết nối**: UDP không yêu cầu thiết lập kết nối; TCP yêu cầu.
- **Overhead**: UDP có overhead thấp hơn TCP.
- **Ứng dụng**: UDP thích hợp cho các ứng dụng yêu cầu tốc độ cao; TCP thích hợp cho các ứng dụng yêu cầu độ tin cậy.

