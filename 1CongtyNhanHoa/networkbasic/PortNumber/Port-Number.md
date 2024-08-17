# Mục Lục

1. [Port là gì?](#1-port-l%C3%A0-g%C3%AC)
   
   - [Port Number](#port-number)

2. [Các Port Number Tiêu Biểu và Protocol](#2-c%C3%A1c-port-number-ti%C3%AAu-bi%E1%BB%83u-v%C3%A0-protocol)
   - [Danh sách Port Number](#danh-s%C3%A1ch-port-number)

3. [Well-known Port Number](#3-well-known-port-number)
   - [Khái niệm và Quản lý](#kh%C3%A1i-ni%E1%BB%87m-v%C3%A0-quan-l%C3%BD)
   - [Ví dụ về Well-known Port Number](#v%C3%AD-d%E1%BB%99-v%E1%BB%81-well-known-port-number)

4. [Registered Port Number](#4-registered-port-number)
   - [Khái niệm và Quản lý](#kh%C3%A1i-ni%E1%BB%87m-v%C3%A0-quan-l%C3%BD)

5. [Các Port Number Khác](#5-c%C3%A1c-port-number-kh%C3%A1c)
   - [Port Number Tùy Chọn](#port-number-tuy-ch%E1%BB%8Dn)

6. [Mở Port và Security](#6-m%E1%BB%9F-port-v%C3%A0-security)
   - [Vai trò của Port trong Security](#vai-tr%C3%B2-c%E1%BB%A7a-port-trong-security)
   - [Xác minh và Bảo mật](#x%C3%A1c-minh-v%C3%A0-b%E1%BA%A3o-m%E1%BA%ADt)

# 1. Port là gì?

Trên thực tế, khi truyền gửi thông tin bằng TCP và UDP, thông tin được truyền tải không phải dưới đơn vị là một máy tính, mà thực hiện dưới đơn vị là Chương trình (program). Nói cách khác, việc truyền tải thông tin được thực hiện dưới đơn vị **Process và Thread**. Vì vậy, cần phải có sự chính xác trong việc truyền tải thông tin giữa các process.

Khi đó, các process đang thực hiện truyền tải thông tin sẽ được cấp port number. Các **process và Thread** sẽ dựa vào port number này để phân biệt các chương trình nào đang thực hiện việc truyền tin.



## Port Number

Nếu xem IP address như địa chỉ của một tòa nhà, MAC address như số nhà(số phòng), thì port number tương đương với biết bị cụ thể trong tòa nhà đó. Trong mạng máy tính, kết hợp protocol, IP address và port number cho phép xác định phương thức truyền tin, địa chỉ thiết bị và ứng dụng hoặc dịch vụ cụ thể trên thiết bị đó.

Port number có vai trò quan trọng trong việc truyền tin. Mở một port tương tự như việc mở một cánh cửa, vì vậy cần phải cấu hình một cách cẩn thận để không mở các port không cần thiết, nhằm đảm bảo an ninh và hiệu suất của hệ thống.

# 2. Các Port Number Tiêu Biểu và Protocol

Bảng dưới đây liệt kê các ví dụ tiêu biểu của việc Protocol nào sử dụng port number nào:

| Protocol | Port Number | Ví dụ        |
|----------|-------------|--------------|
| TCP      | 20          | FTP (Data)   |
| TCP      | 21          | FTP (Control)|
| TCP      | 22          | SSH          |
| TCP      | 23          | Telnet       |
| TCP      | 25          | SMTP         |
| UDP      | 53          | DNS          |
| UDP      | 67          | DHCP (Server)|
| UDP      | 68          | DHCP (Client)|
| TCP      | 80          | HTTP         |
| TCP      | 110         | POP3         |
| UDP      | 123         | NTP          |
| TCP      | 443         | HTTPS        |

## WELL KNOWN PORT NUMBERS 0~1023

Web server là một ví dụ tiêu biểu về Port, IP address và Protocol.

Trên IP address được công khai trên một server cụ thể, một application dựa trên giao thức HTTP, Apache, v.v. thực hiện việc truyền tin tới Client thông qua port 80, và thông tin trang web được trả về ứng với yêu cầu nhận được.

Các service khác cũng hoạt động tương tự, trên một server định sẵn, application thực hiện theo giao thức nào đó, thông qua port number tùy chọn, hoặc thông qua Well-known port number để cung cấp dịch vụ của mình.

# 3. Well-known Port Number

Thực tế, tồn tại các port number từ 0 đến 65535, tuy nhiên, trong số đó, các port number từ 0 đến 1023 được gọi là “Well-known Port Number” và chúng được quản lý bởi tổ chức có tên IANA.

Tên gọi này nghĩa là “Các port number được biết đến rộng rãi”.

Trong số các port number được sử dụng khi truyền tin bằng TCP/IP và UDP, các well-known port number là các số được đặt trước cho việc sử dụng các protocol và service chính.

Các service chính đã định sẵn các port number, ví dụ: HTTP là 80, SSH là 22.

Về mặt bảo mật, đôi khi có trường hợp thay đổi port number, tuy nhiên, trên cơ bản, các service chính này đều sử dụng well-known port number.

# 4. Registered Port Number

Các port number từ 1024-49151 cũng do IANA quản lý.

Nhóm này gồm các port number được sử dụng bởi các application đặc định. IANA tiếp nhận đăng ký và công khai các port number này.

# 5. Các Port Number Khác

Người dùng có thể tự do sử dụng các port number từ `49152 đến 65535`

Không tồn tại quy tắc “Service nào sử dụng port nào”, do vậy, các port number này có thể tùy ý quản lý và sử dụng.

# 6. Mở Port và Security

Hiện nay, tốc độ xử lý của máy tính rất cao, đồng thời, ngày càng có nhiều ứng dụng hoạt động như một server có thể chạy được trên máy tính cá nhân.

Với đa phần trường hợp của các ứng dụng có chức năng như một server, máy tính sẽ không chỉ cần đáp lại các thông tin bên trong local mà còn cần xử lý các thông tin từ bên ngoài. Với các ứng dụng server như vậy, việc mở port là yêu cầu tất yếu để có thể cung cấp được dịch vụ.

Tuy nhiên, trường hợp các server application có lỗ hổng bảo mật, tình huống xấu nhất có thể xảy ra là server bị hack hay không thể tiếp tục cung cấp dịch vụ. Do vậy, cần phải thận trọng xem xét các ứng dụng với chức năng sử dụng như server.

Ngoài ra, với các máy tính hoạt động như một server, cần phải xác minh các câu hỏi “Port nào hiện đang được mở?”, “Liệu có port nào bị mở một cách không chủ định hay không?”, v.v. Cần phải tiến hành penetration test, đóng các port, nắm bắt tình hình trước khi đưa vào hoạt động thực tế.


