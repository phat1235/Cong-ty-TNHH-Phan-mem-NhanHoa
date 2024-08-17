# Giao thức FTP (File Transfer Protocol)

**File Transfer Protocol (FTP)** là một giao thức mạng được sử dụng để chuyển đổi dữ liệu giữa máy tính và máy chủ trong một môi trường mạng. FTP được sử dụng để truyền tải tập tin, thư mục, và thực hiện các thao tác quản lý trên dữ liệu đó.

## 1. Giao thức FTP và Mô hình Client – Server

![](https://img001.prntscr.com/file/img001/6GnvvSq5Q42YCXglK5RufQ.png)

FTP hoạt động dựa trên mô hình **client-server**, trong đó máy tính gửi yêu cầu được gọi là client và máy chủ phản hồi lại yêu cầu đó. 

Giao thức này sử dụng cổng truyền thông số **21** để thiết lập kết nối điều khiển và cổng truyền thông số **20** để truyền dữ liệu.

Trong mô hình client-server của FTP, máy chủ đóng vai trò là nơi lưu trữ dữ liệu, nhận yêu cầu từ máy tính client và cung cấp dữ liệu theo yêu cầu. Máy tính client là nơi gửi yêu cầu, nhận dữ liệu và thực hiện các thao tác quản lý trên dữ liệu đó.

## 2. Cổng truyền thông của FTP

![](https://img001.prntscr.com/file/img001/teamNJ1IQbOhTvVJWbNOZw.png)

FTP sử dụng hai cổng truyền thông chính để quản lý kết nối giữa client và server:

- **Cổng 21 (Control Connection):** Được sử dụng để thiết lập và duy trì kết nối giữa client và server để chuyển đổi lệnh và phản hồi.
- **Cổng 20 (Data Connection):** Được sử dụng để truyền dữ liệu thực tế như tập tin và thư mục giữa client và server. Cổng này chỉ mở khi có sự truyền tải dữ liệu và đóng ngay sau khi hoàn thành.

## 3. Active Mode và Passive Mode

FTP có thể hoạt động trong hai chế độ chính:

- **Active Mode:** Client mở một cổng ngẫu nhiên và thông báo cho server mở một cổng cụ thể để truyền dữ liệu. Điều này đôi khi gặp vấn đề khi client đứng sau một tường lửa (firewall).
- **Passive Mode:** Cả client và server đều mở các cổng ngẫu nhiên và kết nối thông qua chúng. Điều này giúp tránh các vấn đề liên quan đến firewall của client.

## 4. Cách FTP truyền tải dữ liệu

![](https://img001.prntscr.com/file/img001/AY99m39LTAGuJr_LvsW7sw.png)

FTP sử dụng một loạt các lệnh để điều khiển quá trình truyền tải và thực hiện các thao tác trên dữ liệu. Dưới đây là một số lệnh cơ bản:

- **USER** và **PASS:** Xác thực người dùng bằng tên đăng nhập và mật khẩu.
- **CWD (Change Working Directory):** Đổi thư mục làm việc trên server.
- **PWD (Print Working Directory):** In ra đường dẫn thư mục làm việc hiện tại.
- **LIST** và **NLST:** Lấy danh sách tệp tin và thư mục trên server.
- **RETR (Retrieve):** Lấy một tệp tin từ server về client.
- **STOR (Store):** Gửi một tệp tin từ client lên server.
- **DELE (Delete):** Xóa một tệp tin trên server.
- **QUIT:** Kết thúc phiên làm việc FTP.

## 5. Xác thực và mã hóa trong FTP

Để đảm bảo người sử dụng truy cập hợp lệ và bảo mật thông tin, FTP cần một cơ chế xác thực và mã hóa:

- Người dùng phải cung cấp tên đăng nhập và mật khẩu để xác thực. Thông tin này được mã hóa khi truyền từ client đến server.
- Sử dụng **SSL/TLS** để tạo một kênh an toàn giữa client và server, đảm bảo rằng thông tin đăng nhập và mật khẩu không bị đánh cắp trong quá trình truyền tải.

## 6. Vị trí của FTP trong mô hình OSI

![](https://img001.prntscr.com/file/img001/4M3Mh95VRYykH3qiJWTvJQ.png)

FTP được tích hợp vào **tầng 7** của mô hình **OSI**, được biết đến là tầng Ứng Dụng. Tầng này cung cấp các dịch vụ và giao thức cho ứng dụng, giúp quản lý việc truyền thông và tương tác giữa người dùng và mạng.

FTP không chỉ là giao thức để truyền tải dữ liệu, mà còn cung cấp các chức năng như xác thực người dùng, quản lý file, và các thao tác quản lý khác.

## 7. Giao thức FTP dùng để làm gì?

- **Quản lý tệp tin trên máy chủ web:** FTP được sử dụng rộng rãi để quản lý và truyền tải tệp tin trên máy chủ web.
- **Truyền tải dữ liệu trong mạng doanh nghiệp:** FTP thường được sử dụng để chuyển đổi dữ liệu giữa các bộ phận khác nhau trong tổ chức.
- **Kết hợp với dịch vụ Web Hosting:** Nhiều dịch vụ lưu trữ web hỗ trợ FTP, cho phép người dùng quản lý tệp tin trên máy chủ thông qua giao thức này.

## 8. Các vấn đề hay gặp khi sử dụng FTP

- **Lỗi kết nối:** Sử dụng Passive Mode có thể giúp tránh vấn đề với firewall và đảm bảo cổng dữ liệu có thể được mở.
- **Tăng dung lượng truy cập:** Quản lý tài nguyên chặt chẽ và tối ưu hóa cấu trúc file có thể giảm tải lên máy chủ.
- **Bảo mật:** FTP có thể bị đánh cắp dữ liệu nếu không sử dụng kết nối an toàn. Sử dụng **FTPS** hoặc **SFTP** để mã hóa dữ liệu truyền tải và tăng cường bảo mật.

