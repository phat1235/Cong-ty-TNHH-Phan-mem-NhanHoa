### **Tổng quan kiến trúc Zimbra**  
Kiến trúc của Zimbra Collaboration được xây dựng trên các công nghệ mã nguồn mở nổi tiếng và các giao thức tiêu chuẩn. Kiến trúc này bao gồm giao diện khách (client) và các thành phần máy chủ, có thể chạy trên một máy chủ duy nhất hoặc triển khai trên nhiều máy chủ để tăng tính sẵn sàng và khả năng mở rộng.  

### **Lợi ích cốt lõi của kiến trúc Zimbra**  
![](https://img001.prntscr.com/file/img001/PCNCd1xcQqKbYM49mZM-8A.png)
| **Lợi ích cốt lõi** | **Thành phần/Mô tả** |
|------------------|------------------|
| **Tích hợp mã nguồn mở** | Linux®, Jetty, Postfix, MariaDB, OpenLDAP® |
| **Hỗ trợ giao thức tiêu chuẩn** | SMTP, LMTP, SOAP, XML, IMAP, POP |
| **Thiết kế công nghệ hiện đại** | HTML5, Javascript, XML, Java |
| **Khả năng mở rộng** | Mỗi máy chủ Zimbra chứa các hộp thư (mailbox), kho lưu trữ tin nhắn và hệ thống chỉ mục riêng, có thể mở rộng theo chiều dọc (thêm tài nguyên) hoặc chiều ngang (thêm máy chủ) |
| **Giao diện web khách (Web Client)** | Dễ dàng truy cập các tính năng của Zimbra Collaboration thông qua trình duyệt web |
| **Bảng điều khiển quản trị web (Admin Console)** | Dễ dàng quản lý hệ thống thông qua giao diện quản trị trên nền tảng web |

---

### **Các thành phần của Zimbra**  
Kiến trúc Zimbra tích hợp các phần mềm mã nguồn mở sử dụng các giao thức tiêu chuẩn trong ngành. Những phần mềm bên thứ ba này được cài đặt kèm theo Zimbra và đã được cấu hình sẵn để hoạt động tốt nhất với hệ thống.  

#### **Phần mềm bên thứ ba trong Zimbra**  

| **Thành phần** | **Mô tả** |
|--------------|------------|
| **Jetty** | Máy chủ ứng dụng web chạy các dịch vụ của Zimbra |
| **Postfix** | Bộ chuyển tiếp thư (MTA) nguồn mở, giúp định tuyến email đến đúng máy chủ Zimbra |
| **OpenLDAP** | Hệ thống thư mục nguồn mở (LDAP) lưu trữ cấu hình hệ thống Zimbra, danh sách địa chỉ toàn cầu (GAL) và xác thực người dùng. Zimbra cũng hỗ trợ xác thực với Active Directory hoặc LDAP bên ngoài |
| **MariaDB** | Cơ sở dữ liệu quan trọng trong hệ thống Zimbra |
| **Lucene** | Công cụ tìm kiếm và lập chỉ mục |
| **Bộ chuyển đổi tệp đính kèm** | Chuyển đổi một số loại tệp đính kèm thành HTML để xem trước nội dung |
| **Chống virus/Chống spam** | - **ClamAV**: Chống virus  
|- **SpamAssassin**:|Lọc thư rác  
|- **Amavisd-new**: |Bộ giao diện trung gian giữa MTA và các bộ lọc nội dung |
| **Apache JSieve** | Quản lý bộ lọc email |
| **LibreOffice** | Xem trước tài liệu với độ chính xác cao |
| **OnlyOffice** | Hỗ trợ chỉnh sửa tài liệu trực tuyến cộng tác |

---

### **Các gói phần mềm của Zimbra**  

| **Gói phần mềm** | **Mô tả** |
|-----------------|-----------|
| **Zimbra Core** | Bao gồm thư viện, công cụ tiện ích, công cụ giám sát và tệp cấu hình cơ bản. |
| **Zimbra Modern Web Client** | Gói tài nguyên cho giao diện web hiện đại của Zimbra. |
| **Zimbra Store** | Chứa các thành phần của máy chủ hộp thư, bao gồm:  
|- **Cơ sở dữ liệu**: |MariaDB  |
|- **Kho lưu trữ tin nhắn** |f |
|**Lucene**:|  Công cụ tìm kiếm và văn bản đầy đủ tính năng nguồn mở  |
|- **Dịch vụ web ứng dụng**:| Chạy trên Jetty |
| **Zimbra LDAP** | Sử dụng OpenLDAP để xác thực người dùng, quản lý danh sách địa chỉ toàn cầu (GAL). Có thể tích hợp với Active Directory. |
| **Zimbra MTA** | Postfix giúp nhận email qua SMTP và định tuyến đến máy chủ hộp thư qua LMTP. Tích hợp sẵn bộ lọc chống virus và chống spam. |
| **Zimbra Proxy** | Proxy hiệu suất cao giúp chuyển tiếp các yêu cầu IMAP[S]/POP[S]/HTTP[S] tới các dịch vụ nội bộ của Zimbra. |
| **Zimbra Memcached** | Bộ nhớ đệm hiệu suất cao, giúp cải thiện tốc độ truy vấn dữ liệu khi sử dụng Zimbra Proxy. |
| **Zimbra SNMP (Tùy chọn)** | Công cụ giám sát Zimbra qua giao thức SNMP. |
| **Zimbra Logger (Tùy chọn)** | Cung cấp các công cụ tập hợp và báo cáo nhật ký hệ thống. Nếu không cài đặt Logger, phần thống kê trong bảng điều khiển sẽ không hiển thị. |
| **Zimbra Spell (Tùy chọn)** | Tích hợp bộ kiểm tra chính tả Aspell cho giao diện Classic Web App. |
| **Zimbra Convertd** | Bộ chuyển đổi tệp đính kèm sang HTML, giúp xem trước nội dung trong trình duyệt. |
| **Zimbra Archiving (Tùy chọn)** | Lưu trữ và tìm kiếm tất cả email gửi/nhận. Tính năng này có thể yêu cầu thêm giấy phép. |
| **Zimbra OnlyOffice** | Hỗ trợ chỉnh sửa tài liệu trực tuyến cộng tác với OnlyOffice. |
| **License Daemon Service (LDS)** | Quản lý giấy phép linh hoạt trong Zimbra Daffodil (v10.1). |

---

### **Luồng email trong hệ thống nhiều máy chủ**  
Việc triển khai Zimbra phụ thuộc vào nhiều yếu tố như số lượng hộp thư, chính sách bảo mật, yêu cầu chống spam, và cơ sở hạ tầng mạng hiện tại. Dưới đây là quy trình tổng quan về luồng email trong hệ thống nhiều máy chủ:
![](https://img001.prntscr.com/file/img001/nyzMH-xjS--D5V7g6UZxRg.png)
1. **Email từ internet đi qua tường lửa và bộ cân bằng tải** → đến **MTA biên** để lọc spam.  
2. **Thư đã được lọc** tiếp tục đi qua bộ cân bằng tải thứ hai.  
3. **Người dùng từ bên ngoài kết nối vào hệ thống** → đi qua tường lửa và bộ cân bằng tải.  
4. **Email đến MTA Zimbra** → lọc spam/virus.  
5. **MTA tra cứu thông tin người nhận** trong máy chủ LDAP.  
6. **MTA gửi email đến máy chủ Zimbra phù hợp** với người nhận.  
7. **Người dùng nội bộ kết nối trực tiếp đến máy chủ Zimbra** và lấy thông tin từ LDAP.  
8. **Sao lưu dữ liệu từ máy chủ Zimbra** có thể được lưu trữ vào một ổ đĩa gắn ngoài.  

---


## **Thư mục hệ thống trong Zimbra**  

- **openldap/**  
  Cài đặt máy chủ OpenLDAP, được cấu hình sẵn để hoạt động với Zimbra.  

- **postfix/**  
  Cài đặt máy chủ Postfix, được cấu hình sẵn để hoạt động với Zimbra Collaboration.  

- **redolog/**  
  Chứa các tệp nhật ký giao dịch hiện tại của máy chủ Zimbra Collaboration.  

- **snmp/**  
  Các tệp giám sát SNMP.  

- **ssl/**  
  Chứng chỉ bảo mật.  

- **store/**  
  Kho lưu trữ email.  

- **zimbramon/**  
  Chứa các tập lệnh điều khiển và các mô-đun Perl hỗ trợ giám sát hệ thống.  

- **zimlets/**  
  Chứa các tệp ZIP của Zimlet được cài đặt cùng với Zimbra.  

- **zimlets-deployed/**  
  Chứa các Zimlet có sẵn trên Zimbra Classic Web App.  

- **zimlets-network/**  
  Chứa các tệp ZIP của Zimlet dành cho các tính năng được cài đặt trong phiên bản Network Edition.  

- **zmstat/**  
  Chứa thống kê mailboxd, được lưu dưới dạng tệp `.csv`.  

---

### **Ứng dụng Web của Zimbra**  
Zimbra cung cấp nhiều loại ứng dụng web để người dùng có thể sử dụng các tính năng như email, lịch, sổ địa chỉ và nhiệm vụ.  

#### **Bảng: Các loại ứng dụng Web của Zimbra**  

| **Loại ứng dụng** | **Mô tả** |
|------------------|-----------|
| **Modern Web App** | Sử dụng các công nghệ hiện đại, giao diện thân thiện và mang lại trải nghiệm nhất quán trên nhiều thiết bị như máy tính, điện thoại di động và máy tính bảng. |
| **Classic Web App** | Hỗ trợ AJAX và cung cấp đầy đủ các tính năng cộng tác trên web. Chỉ hỗ trợ trình duyệt trên máy tính, không tối ưu cho màn hình nhỏ, cảm ứng hoặc thao tác cử chỉ. |

Người dùng có thể chọn loại ứng dụng web trước khi đăng nhập bằng cách chọn từ menu **"Version"** trên trang đăng nhập.  

- **Quản trị viên** có thể đặt mặc định ứng dụng Web là **Classic Web App** hoặc **Modern Web App** theo chính sách COS.  
- **Người dùng có thể thay đổi ứng dụng mặc định** như sau:  
  - Trong **Modern Web App**: Vào **Settings → General** để thay đổi ứng dụng Web mặc định khi đăng nhập.  
  - Trong **Classic Web App**: Vào **Preferences → General → Sign in** để thay đổi ứng dụng Web mặc định khi đăng nhập.  

💡 **Khuyến nghị:** Quản trị viên nên đặt mặc định **Modern Web App** để có trải nghiệm người dùng tốt hơn.
