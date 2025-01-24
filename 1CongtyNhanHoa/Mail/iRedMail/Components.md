# Phần mềm mã nguồn mở chính được sử dụng trong iRedMail

Hãy khám phá phần mềm lưu trữ email nội bộ nhẹ do nhóm iRedMail phát triển: Spider Email Archiver.

## Phần mềm mã nguồn mở chính được sử dụng trong iRedMail

### Các thành phần được sử dụng

#### Tổng quan

#### Luồng thư đến

#### Luồng thư đi

#### Tham khảo thêm

### Các thành phần được sử dụng

| Tên                  | Chức năng                                                |
|---------------------|---------------------------------------------------------|
| Postfix              | Mail Transfer Agent (MTA)                                |
| Dovecot              | Máy chủ POP3, IMAP và Managesieve                        |
| Nginx, Nginx         | Máy chủ web                                              |
| OpenLDAP, ldapd(8)   | Máy chủ LDAP, dùng để lưu trữ tài khoản email (tùy chọn) |
| MySQL, MariaDB, PostgreSQL | Máy chủ SQL dùng để lưu trữ dữ liệu ứng dụng, có thể được sử dụng để lưu trữ tài khoản email |
| mlmmj                | Trình quản lý danh sách thư. Được cung cấp từ iRedMail-0.9.8 trở đi. |
| Amavisd-new          | Giao diện giữa Postfix và SpamAssassin, ClamAV.          |
| SpamAssassin         | Bộ quét thư rác dựa trên nội dung                         |
| ClamAV               | Trình quét virus                                         |
| Roundcube webmail    | Webmail (PHP)                                            |
| SOGo Groupware       | Phần mềm nhóm cung cấp dịch vụ lịch (CalDAV), danh bạ (CardDAV), tác vụ và ActiveSync |
| Fail2ban             | Quét nhật ký và chặn các IP có dấu hiệu độc hại          |
| iRedAPD              | Máy chủ chính sách postfix đơn giản do iRedMail phát triển, hỗ trợ SRS (Sender Rewrite Scheme). |

### Tổng quan

(Tổng quan về hệ thống iRedMail sẽ được bổ sung tại đây)
![](https://img001.prntscr.com/file/img001/Mr2JD8jkTfeyXVUh9ee6cw.png)

### Luồng thư đến

(Mô tả quy trình xử lý email đến trong iRedMail)
![](https://img001.prntscr.com/file/img001/XgR_bpPISlavpSPqsOnluQ.png)
### Luồng thư đi

(Mô tả quy trình xử lý email đi trong iRedMail)
![](https://img001.prntscr.com/file/img001/S0ECHMDJRRWBMSFBTc7YlA.png)

### Tham khảo thêm
...

