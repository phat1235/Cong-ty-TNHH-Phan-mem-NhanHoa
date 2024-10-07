
### Chuỗi Sao lưu

**Veeam Backup & Replication** tạo ra và duy trì các loại tệp sao lưu sau đây:
- **VBK** — các tệp sao lưu đầy đủ, lưu trữ các bản sao của hình ảnh VM đầy đủ.
- **VIB hoặc VRB** — các tệp sao lưu gia tăng, lưu trữ các thay đổi gia tăng của hình ảnh VM.
- **VBM** — các tệp siêu dữ liệu sao lưu, lưu trữ thông tin về công việc sao lưu, các VM đã được xử lý bởi công việc sao lưu, số lượng và cấu trúc của các tệp sao lưu, các điểm khôi phục, và nhiều thông tin khác. Các tệp siêu dữ liệu này giúp dễ dàng nhập sao lưu, ánh xạ sao lưu và các thao tác khác.

Ngoài các loại tệp này, Veeam Backup & Replication còn có thể tạo ra các tệp sau trên kho lưu trữ sao lưu:
- **VSB** — các tệp sao lưu tổng hợp ảo được sử dụng để tạo ra các bản sao lưu ảo hoàn chỉnh trên băng. Để biết thêm thông tin, xem phần Sao lưu ảo hoàn chỉnh.
- **VLB và VSM** — các tệp lưu trữ dữ liệu nhật ký giao dịch của Microsoft SQL Server. Để biết thêm thông tin, xem phần Sao lưu và Khôi phục nhật ký Microsoft SQL Server.
- **VLB và VOM** — các tệp lưu trữ dữ liệu nhật ký đã lưu trữ của Oracle. Để biết thêm thông tin, xem phần Sao lưu và Khôi phục nhật ký Oracle.

Tất cả các tệp sao lưu được tạo ra bởi công việc sao lưu đều nằm trong một thư mục công việc riêng biệt trên kho lưu trữ sao lưu. Ví dụ, nếu bạn tạo một công việc sao lưu có tên là **DC Backup**, Veeam Backup & Replication sẽ tạo thư mục **DC Backup** trên kho lưu trữ sao lưu đích và lưu trữ tất cả các tệp sao lưu được tạo ra bởi công việc này trong thư mục đó.

Các tệp sao lưu tạo thành một chuỗi sao lưu. Chuỗi sao lưu bao gồm tệp sao lưu đầy đủ đầu tiên, các tệp sao lưu gia tăng và, bổ sung, tệp siêu dữ liệu sao lưu. Các tệp sao lưu đầy đủ và gia tăng tương ứng với các điểm khôi phục của các VM đã sao lưu. Bạn có thể nghĩ về các điểm khôi phục như là các "bức ảnh" của dữ liệu VM tại các thời điểm cụ thể. Các điểm khôi phục cho phép bạn quay lại trạng thái cần thiết của VM.

Để quay lại một VM đến một thời điểm cụ thể, bạn cần một chuỗi các tệp sao lưu: một tệp sao lưu đầy đủ cộng với một tập hợp các tệp sao lưu gia tăng phụ thuộc vào tệp sao lưu đầy đủ này. Nếu có tệp nào đó trong chuỗi sao lưu bị thiếu, bạn sẽ không thể quay lại trạng thái cần thiết. Vì lý do này, bạn không nên xóa thủ công các tệp sao lưu riêng lẻ từ kho lưu trữ sao lưu. Thay vào đó, bạn phải chỉ định các cài đặt chính sách lưu giữ để duy trì số lượng tệp sao lưu mong muốn trên kho lưu trữ sao lưu.

Veeam Backup & Replication cung cấp 3 phương pháp sao lưu để tạo chuỗi sao lưu:
- Sao lưu gia tăng luôn tiếp tục
- Sao lưu gia tăng theo chiều tiến
- Sao lưu gia tăng theo chiều ngược

Theo mặc định, trong mỗi phiên công việc sao lưu, Veeam Backup & Replication sẽ ghi dữ liệu của tất cả các VM vào cùng một tệp sao lưu. Nếu cần thiết, bạn có thể chỉ định cho Veeam Backup & Replication tạo ra các chuỗi sao lưu riêng cho từng VM — tức là, tạo ra một chuỗi sao lưu riêng cho mỗi VM được thêm vào công việc sao lưu.

---
