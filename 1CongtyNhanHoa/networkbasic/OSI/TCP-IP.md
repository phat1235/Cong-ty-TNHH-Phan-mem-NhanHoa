

### 1. TCP/IP là gì?
-  TCP/IP là viết tắt của Transmission Control Protocol/Internet Protocol. Đây là bộ giao thức tiêu chuẩn cho việc truyền thông tin qua mạng, bao gồm cả Internet và mạng nội bộ. TCP/IP định nghĩa cách thức các thiết bị trao đổi dữ liệu, từ việc chia nhỏ dữ liệu thành các gói tin, truyền đi, cho đến nhận và kiểm tra lỗi. Nó hoạt động như một lớp trừu tượng giữa ứng dụng và hạ tầng mạng.

### 2. Nguyên lý hoạt động của TCP/IP
 
  - **IP (Internet Protocol):** Định tuyến và truyền các gói dữ liệu từ nguồn đến đích thông qua các mạng khác nhau. IP không đảm bảo việc truyền tin thành công, chỉ đơn giản là gửi gói tin đi.
  - **TCP (Transmission Control Protocol):** Đảm bảo dữ liệu được truyền tin cậy và chính xác. TCP thực hiện việc kiểm tra lỗi, đảm bảo các gói tin được nhận đầy đủ và đúng thứ tự, nếu có lỗi thì yêu cầu gửi lại.

### 3. Cấu trúc của TCP/IP
 
  - **Tầng 1: Tầng liên kết dữ liệu và Vật lý (Link/Physical Layer):** Kết hợp cả chức năng của tầng vật lý và tầng liên kết dữ liệu trong mô hình OSI. Tầng này chịu trách nhiệm truyền tải các frame (khung dữ liệu) giữa hai thiết bị trong cùng một mạng.
  - **Tầng 2: Tầng mạng (Internet Layer):** Đảm bảo việc định tuyến các gói tin (packets) trong mạng, dùng các giao thức như IP, ICMP, và ARP.
  - **Tầng 3: Tầng giao vận (Transport Layer):** Quản lý kết nối và truyền tải dữ liệu giữa các máy tính. TCP và UDP là hai giao thức chính ở tầng này.
  - **Tầng 4: Tầng ứng dụng (Application Layer):** Cung cấp giao diện giữa phần mềm ứng dụng và mạng. Bao gồm các giao thức như HTTP, FTP, SMTP.

### 4. Ưu điểm và nhược điểm của TCP/IP
  - **Ưu điểm:** TCP/IP linh hoạt, hỗ trợ nhiều loại thiết bị và hệ điều hành, có khả năng mở rộng, và hoạt động trên nhiều loại môi trường mạng khác nhau.
  - **Nhược điểm:** Việc cấu hình và quản lý phức tạp, không hoàn toàn tách biệt giữa các khái niệm về dịch vụ, giao diện, và giao thức. Tầng giao vận của TCP không đảm bảo việc phân phối các gói tin nhanh chóng trong mọi tình huống, và hệ thống dễ bị tấn công từ chối dịch vụ.

### 5. Các giao thức TCP/IP phổ biến

  - **HTTP/HTTPS:** HTTP truyền dữ liệu không bảo mật, trong khi HTTPS truyền dữ liệu đã được mã hóa giữa trình duyệt web và máy chủ.
  - **FTP:** Giao thức truyền file, cho phép chuyển dữ liệu giữa máy tính qua Internet.

