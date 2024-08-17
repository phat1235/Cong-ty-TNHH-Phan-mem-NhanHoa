### Giao thức HTTP là gì?

**HTTP (HyperText Transfer Protocol)** là một giao thức chuẩn về mạng Internet, được dùng để liên hệ thông tin giữa máy cung cấp dịch vụ (Web server) và máy sử dụng dịch vụ (Web client). Đây là giao thức Client/Server chủ yếu được sử dụng cho World Wide Web (WWW). Giao thức HTTP hoạt động ở tầng ứng dụng của bộ giao thức TCP/IP.

![](https://img001.prntscr.com/file/img001/IUjATZoYS96SeiPI6atRgA.png)

### Cách hoạt động của giao thức HTTP

![](https://img001.prntscr.com/file/img001/O7qqOcf3TmSe4OlAlloO2w.png)

Giao thức HTTP hoạt động dựa trên mô hình Client – Server. Khi người dùng lướt web, máy tính của họ đóng vai trò là máy khách (Client). Sau khi thực hiện một thao tác, máy khách gửi yêu cầu đến máy chủ (Server) và chờ phản hồi từ máy chủ. Trong một số trường hợp, khi các hệ thống trao đổi dữ liệu với nhau, cả hai đều có thể đóng vai trò là server.

#### HTTP Requests


![](https://img001.prntscr.com/file/img001/BfJ-DQvNTvO4yBKNpFD9IA.png)
Một HTTP client gửi một yêu cầu HTTP (HTTP request) lên server thông qua một thông điệp có định dạng như sau:

```
<method> <request-URL> <http-version>
<headers>
<body>
```

**Ví dụ về HTTP request:**

1. **Request Line:** Dòng đầu tiên trong HTTP Request bao gồm các thông tin:

   - **Method:** Xác định hành động cần thực hiện với thông tin được gửi từ client lên.

     - **GET:** Truy vấn đính kèm vào đường dẫn HTTP request. 
     
     Ví dụ: `/?username="tranvanphat2003"&pass="tenmien"`
     - **POST:** Truy vấn gửi trong phần message body của HTTP request.

   - **Request URL:** Xác định tài nguyên trên Web thông qua cấu trúc:

     ```
     protocol://hostname:port/path-and-file-name
     ```

   - **HTTP Version:** Phiên bản giao thức HTTP đang sử dụng.
   - 
  ![](https://img001.prntscr.com/file/img001/1XTr7Tl4RAOADlRQDqlHpQ.png)
2. **Request Headers:** Cho phép client gửi thêm thông tin bổ sung về yêu cầu, như loại nội dung chấp nhận (Accept), kiểu nén (Accept-Encoding), thông tin về user agent (User-Agent), v.v.

3. **Request Body:** Dữ liệu mà client gửi lên server. Có thể là HTML, XML, JSON, hoặc tập các cặp key-value dạng form-data.

Sau khi nhận được yêu cầu, server sẽ xử lý và phản hồi lại client theo một trong ba cách:
- Trả về tập tin yêu cầu.
- Thực thi chương trình và trả lại kết quả.
- Trả lại thông báo lỗi nếu không thể đáp ứng yêu cầu.

#### HTTP Responses

HTTP response là bản tin trả về từ server sang client, bao gồm:

1. **Status Line:** Gồm phiên bản giao thức, mã trạng thái (Status code), và mô tả trạng thái (Status text). Ví dụ: `200 OK`, `404 Not Found`.

2. **Response Header:** Truyền thêm thông tin bổ sung đến client dưới dạng các cặp “Name:Value”.

3. **Response Body:** Chứa dữ liệu trả về cho client, thường là trang HTML, JSON, hoặc XML.


![](https://img001.prntscr.com/file/img001/dYj8OE-jRcGErZZQs9eJvQ.png)

#### Mã trạng thái HTTP phổ biến:

- **2xx Successful:** Ví dụ, `200 OK` (yêu cầu thành công).
- **3xx Redirection:** Ví dụ, `301 Moved Permanently` (tài nguyên đã được chuyển đến địa chỉ mới).
- **4xx Client error:** Ví dụ, `404 Not Found` (không tìm thấy tài nguyên).
- **5xx Server Error:** Ví dụ, `500 Internal Server Error` (lỗi xử lý của server).

![](https://img001.prntscr.com/file/img001/n6FGnEAaRJOgBjqVAlnFxw.png)
### Giao thức HTTPS là gì?

**HTTPS (HyperText Transfer Protocol Secure)** là phiên bản bảo mật của HTTP, đảm bảo rằng dữ liệu được gửi giữa trình duyệt và trang web được bảo vệ. HTTPS bổ sung SSL và TSL, mã hóa thông tin để ngăn chặn bên thứ ba đăng nhập và đánh cắp dữ liệu.


![](https://img001.prntscr.com/file/img001/6WsnYPHiREmwNPwaw0oBsQ.png)
#### Bảo mật PKI (Public Key Infrastructure)

HTTPS sử dụng hệ thống PKI với hai khóa: **khóa công khai** và **khóa riêng** để mã hóa và giải mã thông tin. Quá trình này đảm bảo rằng chỉ người nhận dự kiến mới có thể giải mã dữ liệu.

### Sự khác nhau giữa HTTP và HTTPS

| **Tiêu chí**         | **HTTP**                      | **HTTPS**                                          |
|----------------------|-------------------------------|----------------------------------------------------|
| **Chứng chỉ SSL**    | Không có SSL                  | Được bổ sung SSL đảm bảo thông tin bảo mật         |
| **Port**             | Port 80                       | Port 443 bảo vệ dữ liệu                             |
| **Mã hóa**           | Không có                      | Sử dụng SSL/TSL bảo mật                             |
| **Mức độ bảo mật**   | Không bảo mật                 | Đảm bảo bảo mật thông tin và xác thực website       |

