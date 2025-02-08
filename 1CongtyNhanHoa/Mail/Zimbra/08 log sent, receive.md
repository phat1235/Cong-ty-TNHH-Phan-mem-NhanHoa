### Xem Nhật Ký (Log Files)

Zimbra Collaboration ghi lại các hoạt động và lỗi của nó vào một số tệp nhật ký hệ thống thông qua daemon **syslog**, cũng như các nhật ký riêng của Zimbra trên hệ thống tệp cục bộ. Các nhật ký được mô tả dưới đây là các nhật ký chính được sử dụng để phân tích và khắc phục sự cố.

Các nhật ký cục bộ chứa hoạt động của Zimbra Collaboration nằm trong thư mục **/opt/zimbra/log**.

- **audit.log** – Nhật ký này chứa thông tin về hoạt động xác thực của người dùng và quản trị viên, cũng như các lần đăng nhập thất bại. Ngoài ra, nó cũng ghi lại hoạt động của quản trị viên để theo dõi các thay đổi cấu hình.  
- **clamd.log** – Nhật ký này ghi lại hoạt động từ ứng dụng chống virus **clamd**.  
- **freshclam.log** – Nhật ký này chứa thông tin liên quan đến việc cập nhật các định nghĩa virus của **clamd**.  
- **mailbox.log** – Đây là nhật ký của **mailboxd** sử dụng log4j, ghi lại các hoạt động của **mailbox server**, bao gồm **mailbox store**, **LMTP server**, **IMAP và POP servers**, và **Index server**.  
- **myslow.log** – Đây là nhật ký truy vấn chậm (slow query log), ghi lại tất cả các câu lệnh SQL từ **mailbox server** có thời gian thực thi lâu hơn giá trị **long_query_time**.  
  - **long_query_time** được định nghĩa trong tệp cấu hình **/opt/zimbra/conf/my.cnf**.  
- **spamtrain.log** – Nhật ký này chứa đầu ra từ lệnh **zmtrainsa**, được chạy tự động theo lịch trình từ **cron**.  
- **sync.log** – Nhật ký này chứa thông tin về các hoạt động **mobilesync** của Zimbra Collaboration.  

Ngoài ra còn có các nhật ký khác:

- **/opt/zimbra/jetty/logs/** – Đây là nơi ghi lại các hoạt động cụ thể của **Jetty**.  
- **/opt/zimbra/db/data/<hostname>.err** – Đây là nhật ký lỗi của **cơ sở dữ liệu message store**.  
- **/opt/zimbra/logger/db/data/<hostname>.err** – Đây là nhật ký lỗi của **cơ sở dữ liệu Logger**.  

### Nhật ký hoạt động của Zimbra Collaboration trong hệ thống syslog

- **/var/log/zimbra.log** – Nhật ký **syslog của Zimbra** ghi lại các hoạt động của **ZimbraMTA** (Postfix, amavisd, chống spam, chống virus), **Logger**, **Xác thực (cyrus-sasl)**, và **Thư mục (OpenLDAP)**.  
  - Theo mặc định, hoạt động của **LDAP** cũng được ghi vào **zimbra.log**.
### **Kiểm Tra Log Gửi/Nhận Email Trong Zimbra**  

Trong Zimbra, bạn có thể kiểm tra log email để theo dõi các hoạt động gửi/nhận, xác định lỗi hoặc phân tích hệ thống. Dưới đây là các cách kiểm tra log gửi/nhận email trên Zimbra.  

---

## **1. Kiểm Tra Log SMTP (Gửi Email) và Log IMAP/POP (Nhận Email)**  

Zimbra lưu trữ log hệ thống tại **`/var/log/mail.log`** và **`/var/log/zimbra.log`**. Bạn có thể kiểm tra các log này bằng các lệnh sau:  

### **📌 Kiểm tra email gửi đi (SMTP - Postfix)**
```bash
grep "postfix/qmgr" /var/log/mail.log
```
Hoặc:
```bash
grep "status=sent" /var/log/mail.log
```
🚀 **Ý nghĩa:** Tìm kiếm các email đã được gửi thành công.  


🚀 **Ý nghĩa:** Xác định các email được nhận qua IMAP hoặc POP3.  

---



## **2. Kiểm Tra Log Thông Qua Admin Console**  

Nếu bạn sử dụng giao diện quản trị Zimbra Admin, bạn có thể:  

1. Đăng nhập vào **Zimbra Admin** (https://domain.com:7071)  
2. Chọn **Monitor** > **Message Queue** để xem trạng thái email đang gửi/nhận  
3. Kiểm tra phần **Logger** để xem các log sự kiện email  

---

## **3. Kiểm Tra Email Bị Từ Chối Hoặc Lỗi Gửi**  

🔹 **Tìm email bị lỗi gửi đi (Deferred, Bounced):**  
```bash
grep "deferred" /var/log/mail.log
grep "bounced" /var/log/mail.log
```
🔹 **Tìm email bị từ chối (Reject, Relay Denied):**  
```bash
grep "reject" /var/log/mail.log
grep "relay denied" /var/log/mail.log
```
🔹 **Xem log chi tiết của một email cụ thể:**  
```bash
grep "user@example.com" /var/log/mail.log
```
🚀 **Ý nghĩa:** Kiểm tra tất cả log liên quan đến email `user@example.com`.  

---

## **5. Kiểm Tra Mail Queue (Danh Sách Email Đang Chờ Gửi)**  

Nếu email bị chậm hoặc chưa gửi đi, bạn có thể kiểm tra queue:  

🔹 **Xem danh sách email đang chờ gửi:**  
```bash
mailq
```
🔹 **Xóa một email trong hàng đợi (dùng ID email):**  
```bash
postsuper -d <message-id>
```
🔹 **Gửi lại tất cả email trong hàng đợi:**  
```bash
postqueue -f
```

---

## **6. Xem Log Giao Tiếp Giữa Postfix Và Mail Server Khác**  

Nếu có vấn đề gửi/nhận email với một domain cụ thể, bạn có thể kiểm tra log chi tiết:  
```bash
grep "example.com" /var/log/zimbra.log
```
🚀 **Ý nghĩa:** Kiểm tra tất cả log liên quan đến email với `example.com`.  

---

## **7. Theo Dõi Log Email Theo Thời Gian Thực**  

Nếu bạn muốn xem log trực tiếp khi có email gửi/nhận, sử dụng lệnh:  
```bash
tail -f /var/log/mail.log
```
Hoặc:  
```bash
tail -f /var/log/zimbra.log
```
🚀 **Ý nghĩa:** Hiển thị log theo thời gian thực, hữu ích khi kiểm tra hoạt động email ngay lập tức.  

---

## **8. Kiểm Tra Email Spam Hoặc Bị Chặn (Amavis, ClamAV, SpamAssassin)**  

Nếu email bị lọc vào spam hoặc bị chặn bởi bộ lọc virus:  
```bash
grep "amavis" /var/log/mail.log
grep "blocked" /var/log/mail.log
```
🚀 **Ý nghĩa:** Xác định email bị chặn do chứa virus hoặc bị đánh giá là spam.  

---

## **Tóm Tắt**  
✅ **Kiểm tra email gửi đi:** `grep "postfix/qmgr" /var/log/mail.log`  
✅ **Kiểm tra email nhận vào:** `grep "imapd" /var/log/mail.log`  
✅ **Kiểm tra lỗi gửi email:** `grep "bounced" /var/log/mail.log`  
✅ **Xem danh sách email chờ gửi:** `mailq`  
✅ **Theo dõi log thời gian thực:** `tail -f /var/log/mail.log`  

---

### 🚀 **Lưu Ý Quan Trọng**  
- Nếu email bị chặn, kiểm tra log Amavis và SpamAssassin.  
- Nếu email bị trễ, kiểm tra queue bằng `mailq`.  
- Nếu nghi ngờ bị lỗi hệ thống, kiểm tra log tổng quát `/var/log/zimbra.log`.  



Ví dụ log

```
Feb  8 07:43:35 mail postfix/postscreen[923621]: CONNECT from [172.16.12.5]:57160 to [172.16.12.5]:25
Feb  8 07:43:35 mail postfix/postscreen[923621]: ALLOWLISTED [172.16.12.5]:57160
Feb  8 07:43:35 mail postfix/smtpd[923622]: connect from mail.nhanhoa2000.com[172.16.12.5]
Feb  8 07:43:35 mail postfix/smtpd[923622]: NOQUEUE: filter: RCPT from mail.nhanhoa2000.com[172.16.12.5]: <phat@nhanhoa2000.com>: Sender address triggers FILTER smtp-amavis:[127.0.0.1]:10026; from=<phat@nhanhoa2000.com> to=<admin@nhanhoa2000.com> proto=ESMTP helo=<mail.nhanhoa2000.com>
Feb  8 07:43:35 mail postfix/smtpd[923622]: C90871C226F: client=mail.nhanhoa2000.com[172.16.12.5]
Feb  8 07:43:35 mail postfix/cleanup[923623]: C90871C226F: message-id=<1538529409.113.1739000615770.JavaMail.zimbra@nhanhoa2000.com>
Feb  8 07:43:35 mail postfix/qmgr[93505]: C90871C226F: from=<phat@nhanhoa2000.com>, size=2879, nrcpt=1 (queue active)
Feb  8 07:43:35 mail postfix/smtpd[923622]: disconnect from mail.nhanhoa2000.com[172.16.12.5] ehlo=1 mail=1 rcpt=1 data=1 quit=1 commands=5
Feb  8 07:43:35 mail postfix/dkimmilter/smtpd[923626]: connect from localhost[127.0.0.1]
Feb  8 07:43:35 mail postfix/dkimmilter/smtpd[923626]: DFD2F1C2270: client=localhost[127.0.0.1]
Feb  8 07:43:35 mail postfix/cleanup[923623]: DFD2F1C2270: message-id=<1538529409.113.1739000615770.JavaMail.zimbra@nhanhoa2000.com>
Feb  8 07:43:35 mail postfix/dkimmilter/smtpd[923626]: disconnect from localhost[127.0.0.1] ehlo=1 mail=1 rcpt=1 data=1 quit=1 commands=5
Feb  8 07:43:35 mail postfix/qmgr[93505]: DFD2F1C2270: from=<phat@nhanhoa2000.com>, size=3361, nrcpt=1 (queue active)
Feb  8 07:43:35 mail postfix/smtp[923624]: C90871C226F: to=<admin@nhanhoa2000.com>, relay=127.0.0.1[127.0.0.1]:10026, delay=0.11, delays=0.01/0.02/0/0.08, dsn=2.0.0, status=sent (250 2.0.0 from MTA(smtp:[127.0.0.1]:10030): 250 2.0.0 Ok: queued as DFD2F1C2270)
Feb  8 07:43:35 mail postfix/qmgr[93505]: C90871C226F: removed
Feb  8 07:43:36 mail postfix/amavisd/smtpd[923629]: connect from localhost[127.0.0.1]
Feb  8 07:43:36 mail postfix/amavisd/smtpd[923629]: 41C3A1C226F: client=localhost[127.0.0.1]
Feb  8 07:43:36 mail postfix/cleanup[923623]: 41C3A1C226F: message-id=<1538529409.113.1739000615770.JavaMail.zimbra@nhanhoa2000.com>
Feb  8 07:43:36 mail postfix/qmgr[93505]: 41C3A1C226F: from=<phat@nhanhoa2000.com>, size=3975, nrcpt=1 (queue active)
Feb  8 07:43:36 mail postfix/amavisd/smtpd[923629]: disconnect from localhost[127.0.0.1] ehlo=1 mail=1 rcpt=1 data=1 quit=1 commands=5
Feb  8 07:43:36 mail postfix/smtp[923624]: DFD2F1C2270: to=<admin@nhanhoa2000.com>, relay=127.0.0.1[127.0.0.1]:10032, delay=0.36, delays=0.01/0.01/0/0.35, dsn=2.0.0, status=sent (250 2.0.0 from MTA(smtp:[127.0.0.1]:10025): 250 2.0.0 Ok: queued as 41C3A1C226F)
Feb  8 07:43:36 mail postfix/qmgr[93505]: DFD2F1C2270: removed
Feb  8 07:43:36 mail postfix/lmtp[923630]: 41C3A1C226F: to=<admin@nhanhoa2000.com>, relay=mail.nhanhoa2000.com[172.16.12.5]:7025, delay=0.04, delays=0/0.02/0/0.01, dsn=2.1.5, status=sent (250 2.1.5 Delivery OK)
Feb  8 07:43:36 mail postfix/qmgr[93505]: 41C3A1C226F: removed
Feb  8 07:44:06 mail /postfix-script[924007]: the Postfix mail system is running: PID: 93503
Feb  8 07:44:20 mail /postfix-script[924470]: the Postfix mail system is running: PID: 93503
Feb  8 07:45:02 mail postfix/dkimmilter/smtpd[920968]: timeout after END-OF-MESSAGE from localhost[127.0.0.1]
Feb  8 07:45:02 mail postfix/dkimmilter/smtpd[920968]: disconnect from localhost[127.0.0.1] ehlo=1 mail=1 rcpt=1 data=1 commands=4
Feb  8 07:45:26 mail /postfix-script[924974]: the Postfix mail system is running: PID: 93503
Feb  8 07:46:06 mail /postfix-script[925525]: the Postfix mail system is running: PID: 93503

```


Dựa vào log trên, email từ `phat@nhanhoa2000.com` đã được gửi đến `admin@nhanhoa2000.com` thành công. Dưới đây là các bước xử lý của email của hệ thống:

1. **Kết nối đến Postfix**  
   ```
   Feb  8 07:43:35 mail postfix/postscreen[923621]: CONNECT from [172.16.12.5]:57160 to [172.16.12.5]:25
   Feb  8 07:43:35 mail postfix/postscreen[923621]: ALLOWLISTED [172.16.12.5]:57160
   Feb  8 07:43:35 mail postfix/smtpd[923622]: connect from mail.nhanhoa2000.com[172.16.12.5]
   ```
   → Máy `mail.nhanhoa2000.com` (IP 172.16.12.5) đã kết nối đến Postfix qua cổng SMTP (25).

2. **Email đi qua Amavis (chống virus & spam)**  
   ```
   Feb  8 07:43:35 mail postfix/smtpd[923622]: NOQUEUE: filter: RCPT from mail.nhanhoa2000.com[172.16.12.5]: <phat@nhanhoa2000.com>: Sender address triggers FILTER smtp-amavis:[127.0.0.1]:10026
   ```
   → Email được gửi đến bộ lọc Amavis (chạy trên localhost:10026).

3. **Postfix xử lý DKIM**  
   ```
   Feb  8 07:43:35 mail postfix/dkimmilter/smtpd[923626]: DFD2F1C2270: client=localhost[127.0.0.1]
   ```
   → Email được kiểm tra chữ ký DKIM.

4. **Email tiếp tục qua Amavis & Postfix**  
   ```
   Feb  8 07:43:36 mail postfix/smtp[923624]: DFD2F1C2270: to=<admin@nhanhoa2000.com>, relay=127.0.0.1[127.0.0.1]:10032, delay=0.36, delays=0.01/0.01/0/0.35, dsn=2.0.0, status=sent (250 2.0.0 from MTA(smtp:[127.0.0.1]:10025): 250 2.0.0 Ok: queued as 41C3A1C226F)
   ```
   → Email được Amavis kiểm tra lần cuối và gửi lại vào Postfix.

5. **Email được chuyển đến hộp thư đích (qua LMTP)**  
   ```
   Feb  8 07:43:36 mail postfix/lmtp[923630]: 41C3A1C226F: to=<admin@nhanhoa2000.com>, relay=mail.nhanhoa2000.com[172.16.12.5]:7025, delay=0.04, delays=0/0.02/0/0.01, dsn=2.1.5, status=sent (250 2.1.5 Delivery OK)
   ```
   → Email đã được chuyển đến hộp thư `admin@nhanhoa2000.com` thành công qua giao thức LMTP.

---

#
---
ls /opt/zimbra/jetty/

 🚀
