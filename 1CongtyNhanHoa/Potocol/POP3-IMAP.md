# POP3 và IMAP

## POP3

### 1. Mục đích của POP3
Post Office Protocol - Version 3 (POP3) cho phép người dùng tải email từ server về máy tính cá nhân. Thông thường, sau khi tải, email sẽ bị xóa khỏi server. POP3 hoạt động trên cổng 110 và được mô tả trong RFC 1939.

### 2. Cách thức hoạt động
Giao dịch giữa client và server qua POP3 gồm các bước:
- **Kết nối:** Client kết nối với server qua cổng TCP 110.
- **Xác thực:** Client cung cấp thông tin xác thực để truy cập vào hộp thư.
- **Giao dịch:** Client yêu cầu các hành động như tải email, xóa email từ server.
- **Cập nhật:** Sau khi giao dịch hoàn tất, các thay đổi sẽ được cập nhật và kết nối đóng lại.

### 3. Các lệnh cơ bản của POP3
- **USER:** Xác thực tên người dùng.  
  ```USER <name>```
- **PASS:** Xác thực mật khẩu.  
  ```PASS <password>```
- **LIST:** Liệt kê danh sách email.  
  ```LIST [msg]```
- **STAT:** Thống kê hộp thư.  
  ```STAT```
- **RETR:** Tải email từ server.  
  ```RETR <msg>```
- **DELE:** Đánh dấu email để xóa.  
  ```DELE <msg>```
- **QUIT:** Kết thúc phiên làm việc và xóa email đã đánh dấu.  
  ```QUIT```

### 4. Ưu và nhược điểm của POP3
- **Ưu điểm:**
  - Kết nối internet chỉ cần thiết để gửi/nhận email.
  - Tiết kiệm không gian lưu trữ trên server.
  - Hợp nhất nhiều tài khoản email vào một hộp thư.
- **Nhược điểm:**
  - Không thể truy cập cùng một tài khoản từ nhiều thiết bị.

## IMAP

### 1. Mục đích của IMAP
Internet Message Access Protocol (IMAP) là giao thức nhận email, cho phép người dùng truy cập email trực tiếp trên server mà không cần tải xuống. IMAP hoạt động trên cổng 143 và được mô tả trong RFC 3501.

### 2. Ưu và nhược điểm của IMAP
- **Ưu điểm:**
  - Truy cập email từ nhiều thiết bị khác nhau.
  - Có thể xem trước và tìm kiếm email trên server.
  - Lưu email trên server giúp tiết kiệm không gian lưu trữ nội bộ.
- **Nhược điểm:**
  - Yêu cầu kết nối internet để truy cập email.

## So sánh giữa POP3 và IMAP

| Tiêu chí | POP3 | IMAP |
| :- | :- | :- |
| **Cách truy cập** | Tải email về để đọc | Xem trước một phần email trên server |
| **Tổ chức email** | Không thể tổ chức email trên server | Có thể tổ chức email trên server |
| **Quản lý thư mục** | Không hỗ trợ quản lý thư mục trên server | Hỗ trợ tạo, xóa, sửa tên thư mục trên server |
| **Tìm kiếm nội dung** | Không hỗ trợ tìm kiếm nội dung trên server | Hỗ trợ tìm kiếm nội dung trước khi tải về |
| **Tính năng** | Đơn giản, ít tính năng | Mạnh mẽ, nhiều tính năng hơn POP3 |
