
# 1. SMTP là gì?

![](https://img001.prntscr.com/file/img001/o2uZi2pNSluJ2TZPCLO42Q.png)

SMTP là viết tắt của “Simple Mail Transfer Protocol”, dịch là “Giao thức truyền tải thư điện tử đơn giản”. Đây là một trong những giao thức chính được sử dụng trong hệ thống thư điện tử để truyền tải thư từ một máy chủ thư đến máy chủ thư khác qua mạng internet. 

SMTP chủ yếu đảm nhiệm vai trò của máy chủ gửi thư (outgoing mail server), gửi thư từ người gửi đến người nhận thông qua quá trình truyền tải. Đối với thư điện tử đến, giao thức POP3 (Post Office Protocol version 3) hoặc IMAP (Internet Message Access Protocol) thường được sử dụng để lấy thư từ máy chủ đến (incoming mail server) về hộp thư của người nhận.

SMTP sử dụng cổng mạng 25 để truyền tải dữ liệu, hoạt động theo kiểu client-server, nơi máy chủ gửi thư đóng vai trò là máy chủ và máy tính của người gửi thư là máy khách. Giao thức này cũng được sử dụng để xác định các quy tắc và quy định cho quá trình gửi thư, đảm bảo việc truyền tải thông tin hiệu quả và đáng tin cậy.

# 2. Nguyên lý hoạt động của giao thức SMTP


![](https://img001.prntscr.com/file/img001/36huB2QMR_GnFYxOo7ZIKQ.png)

Nguyên lý hoạt động của SMTP tập trung vào việc truyền tải thư điện tử từ máy chủ gửi đến máy chủ nhận qua mạng internet.

- **Kết nối:** Máy tính của người gửi (client) tạo kết nối với máy chủ gửi thư (outgoing mail server) sử dụng cổng 25 trên mạng.
- **Gửi lệnh EHLO/HELO:** Người gửi thư mở đầu với lệnh EHLO (hoặc HELO), thông báo tên máy tính của họ cho máy chủ gửi thư.
- **Xác định danh tính:** Người gửi cung cấp thông tin xác định về bản thân, bao gồm địa chỉ email và tên máy tính.
- **Xác thực (nếu cần):** Nếu máy chủ yêu cầu, người gửi phải cung cấp thông tin đăng nhập (tên người dùng và mật khẩu).
- **Chuẩn bị thư điện tử:** Người gửi chuyển thư điện tử đến máy chủ gửi, bao gồm địa chỉ email của người nhận, chủ đề, nội dung thư, và các thông tin khác.
- **Gửi thư:** Máy chủ gửi thư chuyển tiếp thư từ người gửi đến máy chủ nhận qua mạng, sử dụng lệnh "MAIL FROM" để xác định địa chỉ người gửi và "RCPT TO" để xác định địa chỉ người nhận.
- **Truyền tải dữ liệu:** Máy chủ gửi chuyển nội dung thư từ người gửi đến máy chủ nhận.
- **Kết thúc kết nối:** Sau khi thư được truyền tải thành công, kết nối giữa máy chủ gửi và máy chủ nhận thư được đóng.

Đa số các email client (Outlook SMTP server, Thunderbird, app trên điện thoại, webmail,…) đều áp dụng giao thức SMTP để gửi và nhận email.

SMTP sử dụng một số lệnh và phản hồi để điều khiển quá trình truyền dữ liệu:

- **HELO:** Máy chủ thư gửi giới thiệu bản thân cho máy chủ thư nhận.
- **AUTH LOGIN:** Máy chủ gửi yêu cầu xác thực người dùng bằng phương thức LOGIN.
- **MAIL FROM:** Máy chủ gửi xác định người gửi thư.
- **RCPT TO:** Máy chủ gửi xác định người nhận thư.
- **DATA:** Máy chủ gửi bắt đầu truyền nội dung thư điện tử.
- **QUIT:** Máy chủ gửi kết thúc kết nối với máy chủ nhận.

# 3. Sự khác nhau giữa máy chủ bình thường và máy chủ SMTP

SMTP server (hay máy chủ SMTP) và máy chủ bình thường đều là các hệ thống máy tính được thiết kế để xử lý dữ liệu, nhưng có một số điểm khác biệt cơ bản:

- **Mục đích:** Máy chủ SMTP chủ yếu để gửi và chuyển tiếp email, trong khi máy chủ bình thường có thể được sử dụng cho nhiều mục đích khác nhau như lưu trữ dữ liệu, cung cấp dịch vụ web, hoặc chạy ứng dụng.
- **Giao thức:** Máy chủ SMTP sử dụng giao thức SMTP để gửi và nhận email, còn máy chủ bình thường có thể sử dụng nhiều giao thức khác như HTTP, FTP, hoặc SSH.
- **Cổng mạng:** Máy chủ SMTP thường sử dụng cổng mạng 25, trong khi máy chủ bình thường sử dụng các cổng mạng khác tùy thuộc vào dịch vụ cụ thể (ví dụ cổng 80 cho HTTP, cổng 21 cho FTP).
- **Chức năng:** Máy chủ SMTP chỉ thực hiện các chức năng liên quan đến việc gửi và nhận email, trong khi máy chủ bình thường có thể thực hiện nhiều chức năng khác nhau.

# 4. Vai trò của máy chủ SMTP

Máy chủ SMTP đóng vai trò then chốt trong quá trình truyền tải thư điện tử, một phương tiện chính để giao tiếp qua mạng Internet. Nếu không có máy chủ SMTP, việc gửi và nhận thư điện tử sẽ gặp nhiều **khó khăn** vì:

- **Không bảo mật:** Máy chủ SMTP hỗ trợ các phương thức bảo mật và xác thực.
- **Thiếu cơ chế quản lý lỗi:** Máy chủ SMTP giúp quản lý lỗi và cung cấp thông báo khi có vấn đề xảy ra.
- **Nguy cơ thư rác:** Máy chủ SMTP tích hợp cơ chế chống thư rác.
- **Không tận dụng các tính năng nâng cao:** Máy chủ SMTP hỗ trợ nhiều tính năng như mã hóa, xác thực 2 yếu tố, và quản lý danh sách đen.


# 5. Ứng dụng thực tiễn của SMTP

SMTP có nhiều ứng dụng trong doanh nghiệp, trường học và tổ chức, cụ thể như:

- **Gửi Email doanh nghiệp:** Doanh nghiệp sử dụng máy chủ SMTP để gửi và nhận thư điện tử nội bộ và bên ngoài tổ chức.
- **Hệ thống gửi thư tự động:** Các hệ thống tự động sử dụng SMTP để gửi thông báo tự động.
- **Hệ thống ghi nhật ký và thông báo:** Gửi thông báo khi có sự kiện quan trọng xảy ra.
- **Hệ thống gửi mã xác nhận và khôi phục mật khẩu:** Gửi mã xác nhận và liên kết khôi phục mật khẩu.
- **Thông báo và quảng bá trong trường học:** Gửi thông báo về lịch học, kết quả học tập.
- **Dịch vụ gửi thư điện tử đám mây:** Cung cấp dịch vụ thư điện tử cho doanh nghiệp và tổ chức thông qua giao diện web hoặc ứng dụng di động.
