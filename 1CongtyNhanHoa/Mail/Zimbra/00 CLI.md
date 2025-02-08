
---

### **Lệnh CLI trong Zimbra**
Bảng dưới đây liệt kê các lệnh CLI trong thư mục `/opt/zimbra/bin` cùng với mô tả của chúng.
![](https://img001.prntscr.com/file/img001/9Vi33unJRHqkrkiMtayImg.png)
| Lệnh CLI | Mô tả |
|----------|-------|
| **antispam-mysqladmin** | Công cụ quản trị cơ sở dữ liệu SQL chống thư rác |
| **antispam-mysql** | Khách hàng SQL chống thư rác |
| **antispam-mysql.server** | Khởi động, dừng cơ sở dữ liệu SQL chống thư rác |
| **ldap** | Khởi động, dừng, hoặc kiểm tra trạng thái của dịch vụ LDAP trong Zimbra |
| **ldapsearch** | Thực hiện tìm kiếm trên máy chủ LDAP |
| **logmysqladmin** | Gửi lệnh mysqladmin đến cơ sở dữ liệu nhật ký (logger SQL instance) |
| **mysql** | Truy cập giao diện dòng lệnh tương tác của cơ sở dữ liệu SQL trong hộp thư (mailbox SQL instance) |
| **mysql.server** | Khởi động, dừng cơ sở dữ liệu SQL của hộp thư |
| **mysqladmin** | Gửi lệnh quản trị đến cơ sở dữ liệu SQL của hộp thư |
| **postconf** | Lệnh của Postfix để xem hoặc sửa đổi cấu hình Postfix |
| **postfix** | Khởi động, dừng, tải lại, xóa, kiểm tra, nâng cấp cấu hình của Postfix |
| **qshape** | Kiểm tra hàng đợi của Postfix theo thời gian và miền người gửi/người nhận |
| **zmaccts** | Liệt kê các tài khoản và trạng thái tài khoản trên miền |
| **zmamavisdctl** | Khởi động, dừng, khởi động lại hoặc kiểm tra trạng thái của Amavis-D New |
| **zmantispamctl** | Khởi động, dừng, tải lại, kiểm tra trạng thái dịch vụ chống thư rác |
| **zmantivirusctl** | Khởi động, dừng, tải lại, kiểm tra trạng thái dịch vụ chống virus |
| **zmantispamdbpasswd** | Thay đổi mật khẩu cơ sở dữ liệu chống thư rác |
| **zmapachectl** | Khởi động, dừng, tải lại hoặc kiểm tra trạng thái của dịch vụ Apache (dùng cho kiểm tra chính tả) |
| **zmarchiveconfig** | Xem, sửa đổi hoặc cấu hình tính năng lưu trữ email |
| **zmarchivectl** | Khởi động, dừng, tải lại, kiểm tra trạng thái dịch vụ lưu trữ |
| **zmarchivesearch** | Tìm kiếm email đã lưu trữ trong tài khoản |
| **zmauditswatchctl** | Khởi động, dừng, khởi động lại, tải lại hoặc kiểm tra trạng thái của auditswatch |
| **zmbackup** | Thực hiện sao lưu toàn bộ và sao lưu gia tăng cho máy chủ hộp thư |
| **zmbackupabort** | Dừng một tiến trình sao lưu đang chạy |
| **zmbackupquery** | Tìm kiếm một bản sao lưu toàn bộ cụ thể |
| **zmblobchk** | Kiểm tra tính nhất quán của kho lưu trữ blob trong Zimbra |
| **zmcalchk** | Kiểm tra tính nhất quán của cuộc hẹn và người tham gia trong lịch Zimbra |
| **zmcbpolicydctl** | Khởi động, dừng, khởi động lại dịch vụ cluebringer policyd nếu được bật |
| **zmconfigdctl** | Khởi động, dừng, tắt, khởi động lại trạng thái daemon cấu hình MTA |
| **zmcertmgr** | Quản lý chứng chỉ tự ký và chứng chỉ thương mại |
| **zmclamdctl** | Khởi động, dừng hoặc kiểm tra trạng thái của ClamAV |
| **zmcleaniplanetics** | Dọn dẹp các tập tin lịch iPlanet ICS |
| **zmcontrol** | Khởi động, dừng, khởi động lại, kiểm tra trạng thái của máy chủ Zimbra. Cũng có thể dùng để kiểm tra phiên bản Zimbra đã cài đặt |
| **zmconvertctl** | Khởi động, dừng máy chủ chuyển đổi hoặc kiểm tra trạng thái của quá trình chuyển đổi/index tệp đính kèm |
| **zmdevicesstats** | Thống kê số lượng thiết bị ActiveSync duy nhất trên mỗi máy chủ |
| **zmgdcutil** | (Lấy số lượng thiết bị) Tổng số thiết bị trên toàn hệ thống mà không cần chỉ định từng máy chủ |
| **zmdumpenv** | Hiển thị thông tin chung về môi trường của máy chủ |
| **zmgsautil** | Công cụ đồng bộ danh bạ chung (GAL). Tạo, xóa tài khoản GAL sync và khởi tạo đồng bộ thủ công |
| **zmhostname** | Hiển thị tên máy chủ Zimbra |
| **zmhsm** | Khởi động, dừng và kiểm tra trạng thái của phiên HSM |
| **zmitemdatafile** | Trích xuất và đóng gói tập tin tgz mà Zimbra sử dụng để nhập/xuất qua REST |
| **zmjava** | Thực thi Java với môi trường cụ thể của Zimbra |
| **zmjavaext** | Thực thi Java với môi trường Zimbra, bao gồm các thư viện mở rộng |
| **zmldappasswd** | Thay đổi mật khẩu LDAP |
| **zmlicense** | Xem và cài đặt giấy phép Zimbra |
| **zmlmtpinject** | Công cụ kiểm tra |
| **zmlocalconfig** | Đặt hoặc lấy cấu hình cục bộ của máy chủ Zimbra |
| **zmloggerctl** | Khởi động, dừng, tải lại hoặc kiểm tra trạng thái của dịch vụ nhật ký Zimbra |
| **zmmailbox** | Quản lý hộp thư người dùng |
| **zmmailboxdctl** | Khởi động, dừng, tải lại hoặc kiểm tra trạng thái của các thành phần hộp thư (zmmailboxd, MariaDB, convert) |
| **zmmboxsearch** | Tìm kiếm chéo trong nhiều hộp thư để tìm email và tệp đính kèm |
| **zmmetadump** | Công cụ hỗ trợ xuất metadata của một mục theo định dạng dễ đọc |
| **zmmtactl** | Khởi động, dừng hoặc kiểm tra trạng thái của MTA |
| **zmmtaconfigdctl** | Không sử dụng từ Zimbra 7.0, thay thế bằng `zmconfigdctl` |
| **zmnginxconf** | Xuất cấu hình proxy ngược (reverse proxy) |
| **zmnginxctl** | Khởi động, dừng, khởi động lại proxy Zimbra |
| **zmprov** | Quản lý tài khoản, miền, danh sách phân phối, alias trong LDAP của Zimbra |
| **zmproxyctl** | Khởi động, dừng, khởi động lại hoặc kiểm tra trạng thái dịch vụ proxy IMAP |
| **zmrestore** | Thực hiện khôi phục toàn bộ hoặc khôi phục gia tăng cho máy chủ hộp thư |
| **zmspellctl** | Khởi động, dừng hoặc kiểm tra trạng thái của máy chủ kiểm tra chính tả |
| **zmstatctl** | Khởi động, dừng, kiểm tra trạng thái hoặc xoay vòng nhật ký của bộ thu thập dữ liệu zmstat |
| **zmtlsctl** | Thiết lập chế độ giao tiếp của máy chủ web: HTTP, HTTPS hoặc hỗn hợp |
| **zmvolume** | Quản lý các volume lưu trữ trên máy chủ hộp thư Zimbra |
| **zmzimletctl** | Triển khai và cấu hình Zimlet |

---
---
Dưới đây là các lệnh Zimbra thông dụng dành cho quản trị viên để quản lý hệ thống, tài khoản, dịch vụ và giám sát hoạt động của Zimbra.  

---

## **1. Quản lý dịch vụ Zimbra**  

### Kiểm tra trạng thái các dịch vụ Zimbra  
```bash
zmcontrol status
```
### Khởi động lại toàn bộ dịch vụ Zimbra  
```bash
zmcontrol restart
```
### Dừng toàn bộ dịch vụ Zimbra  
```bash
zmcontrol stop
```
### Khởi động toàn bộ dịch vụ Zimbra  
```bash
zmcontrol start
```

---

## **2. Quản lý tài khoản Zimbra**  

### Liệt kê tất cả tài khoản trong hệ thống  
```bash
zmprov -l gaa
```
### Tạo tài khoản mới  
```bash
zmprov ca ten_taikhoan@domain.com matkhau
```
### Đổi mật khẩu tài khoản  
```bash
zmprov sp ten_taikhoan@domain.com matkhau_moi
```
### Xóa tài khoản  
```bash
zmprov da ten_taikhoan@domain.com
```
### Khóa tài khoản  
```bash
zmprov ma ten_taikhoan@domain.com zimbraAccountStatus locked
```
### Mở khóa tài khoản  
```bash
zmprov ma ten_taikhoan@domain.com zimbraAccountStatus active
```
### Thêm alias (bí danh) cho tài khoản  
```bash
zmprov aaa ten_taikhoan@domain.com alias@domain.com
```
### Xóa alias của tài khoản  
```bash
zmprov raa ten_taikhoan@domain.com alias@domain.com
```
### Liệt kê tất cả alias của tài khoản  
```bash
zmprov ga ten_taikhoan@domain.com | grep zimbraMailAlias
```
### Thêm forward email cho tài khoản  
```bash
zmprov ma ten_taikhoan@domain.com zimbraPrefMailForwardingAddress email_nhan@domain.com
```
### Xóa forward email  
```bash
zmprov ma ten_taikhoan@domain.com zimbraPrefMailForwardingAddress ""
```

---

## **3. Quản lý miền (Domain) trong Zimbra**  

### Liệt kê tất cả các domain trên hệ thống  
```bash
zmprov gad
```
### Thêm domain mới  
```bash
zmprov cd ten_moi_domain.com
```
### Xóa domain  
```bash
zmprov dd ten_moi_domain.com
```
### Đặt domain mặc định  
```bash
zmprov md ten_domain.com zimbraDomainDefaultCOSId COS_ID
```
(Thay `COS_ID` bằng ID của COS mong muốn)

---

## **4. Quản lý danh sách phân phối (Distribution List - DL)**  

### Liệt kê tất cả danh sách phân phối  
```bash
zmprov gadl
```
### Tạo danh sách phân phối  
```bash
zmprov cdl ten_danhsach@domain.com
```
### Thêm thành viên vào danh sách phân phối  
```bash
zmprov adlm ten_danhsach@domain.com user@domain.com
```
### Xóa thành viên khỏi danh sách phân phối  
```bash
zmprov rdlm ten_danhsach@domain.com user@domain.com
```
### Xóa danh sách phân phối  
```bash
zmprov ddl ten_danhsach@domain.com
```
### Liệt kê các thành viên của danh sách phân phối  
```bash
zmprov gdlm ten_danhsach@domain.com
```

---

## **5. Quản lý MTA (Postfix) và Hàng đợi Email**  

### Kiểm tra hàng đợi mail  
```bash
mailq
```
### Xóa tất cả email trong hàng đợi  
```bash
postsuper -d ALL
```
### Xóa email bị kẹt trong hàng đợi  
```bash
postqueue -p | awk 'BEGIN { RS = "" } /email@domain.com/ { print $1 }' | tr -d '*' | xargs -r postsuper -d
```
(Thay `email@domain.com` bằng địa chỉ email bị kẹt)  

### Đẩy lại các email trong hàng đợi  
```bash
postqueue -f
```
### Kiểm tra log của Postfix  
```bash
tail -f /var/log/mail.log
```
hoặc  
```bash
tail -f /var/log/zimbra.log
```

---

## **6. Sao lưu và khôi phục trong Zimbra**  

### Thực hiện sao lưu toàn bộ hệ thống  
```bash
zmbackup -f -a all
```
### Khôi phục dữ liệu từ bản sao lưu  
```bash
zmrestore -a ten_taikhoan@domain.com -rf
```
### Tạo backup mailbox cụ thể  
```bash
zmmailbox -z -m ten_taikhoan@domain.com getRestURL "//?fmt=tgz" > /tmp/backup_mailbox.tgz
```
### Khôi phục mailbox từ file backup  
```bash
zmmailbox -z -m ten_taikhoan@domain.com postRestURL "//?fmt=tgz" < /tmp/backup_mailbox.tgz
```

---

## **7. Giám sát và Debug hệ thống Zimbra**  

### Kiểm tra dung lượng ổ cứng  
```bash
df -h
```
### Kiểm tra tiến trình đang chạy của Zimbra  
```bash
ps aux | grep zimbra
```
### Kiểm tra log hoạt động  
```bash
tail -f /var/log/zimbra.log
```
### Kiểm tra lỗi đăng nhập  
```bash
grep "authentication failed" /var/log/zimbra.log
```
### Kiểm tra email bị từ chối  
```bash
grep "reject" /var/log/zimbra.log
```

---

## **8. Quản lý chứng chỉ SSL trong Zimbra**  

### Kiểm tra trạng thái chứng chỉ SSL  
```bash
zmcertmgr viewdeployedcrt
```
### Gia hạn chứng chỉ SSL tự ký  
```bash
zmcertmgr createca -new
zmcertmgr deployca
zmcertmgr deploycrt self
zmcontrol restart
```
### Cài đặt chứng chỉ SSL thương mại  
```bash
zmcertmgr verifycrt comm /path/to/certificate.crt /path/to/ca_bundle.crt
zmcertmgr deploycrt comm /path/to/certificate.crt /path/to/ca_bundle.crt
zmcontrol restart
```

---

## **9. Quản lý dịch vụ Proxy và MTA**  

### Kiểm tra trạng thái proxy  
```bash
zmproxyctl status
```
### Dừng dịch vụ proxy  
```bash
zmproxyctl stop
```
### Khởi động lại dịch vụ proxy  
```bash
zmproxyctl restart
```
### Kiểm tra trạng thái MTA  
```bash
zmmtactl status
```
### Dừng dịch vụ MTA  
```bash
zmmtactl stop
```
### Khởi động lại dịch vụ MTA  
```bash
zmmtactl restart
```

---

### **Các lệnh Zimbra zmprov thông dụng**  

#### **1. Tạo tài khoản mới**  
- **Tạo tài khoản với mật khẩu mặc định từ COS (Class of Service):**  
  ```bash
  zmprov ca name@domain.com password
  ```
- **Tạo tài khoản với mật khẩu và gán vào COS cụ thể (cần biết COS ID):**  
  ```bash
  zmprov gc <COSname>
  zmprov ca name@domain.com password zimbraCOS cosIDnumberstring
  ```
- **Tạo tài khoản mà không sử dụng xác thực mật khẩu nội bộ:**  
  ```bash
  zmprov ca name@domain.com ''
  ```
  (Dấu nháy đơn rỗng để chỉ ra rằng tài khoản này không có mật khẩu nội bộ.)

#### **2. Thêm alias cho tài khoản**  
```bash
zmprov aaa accountname@domain.com aliasname@domain.com
```

#### **3. Tạo danh sách phân phối (Distribution List - DL)**  
```bash
zmprov cdl listname@domain.com
```
(Lệnh này trả về ID của danh sách phân phối.)

- **Thêm thành viên vào danh sách phân phối:**  
  ```bash
  zmprov adlm listname@domain.com member@domain.com
  ```
  (Có thể thêm nhiều thành viên từ Zimbra Admin Console.)

#### **4. Đổi mật khẩu quản trị viên**  
```bash
zmprov sp admin@domain.com password
```

#### **5. Quản lý domain**  
- **Tạo domain mới và xác thực bằng Zimbra LDAP:**  
  ```bash
  zmprov cd marketing.domain.com zimbraAuthMech zimbra
  ```
- **Đặt domain mặc định:**  
  ```bash
  zmprov mcf zimbraDefaultDomain domain1.com
  ```

#### **6. Liệt kê thông tin hệ thống**  
- **Liệt kê tất cả các COS (Class of Service) và thuộc tính:**  
  ```bash
  zmprov gac -v
  ```
- **Liệt kê tất cả tài khoản trong một domain cụ thể:**  
  ```bash
  zmprov gaa domain.com
  ```
- **Liệt kê tất cả tài khoản cùng với cấu hình chi tiết:**  
  ```bash
  zmprov gaa -v domain.com
  ```

#### **7. Bật logging cho một server cụ thể**  
```bash
zmprov ms server.com +zimbraServiceEnabled logger
zmloggerctl start
```

#### **8. Kiểm tra trạng thái của một dịch vụ**  
```bash
zmprov gs server.com zimbraServiceEnabled=ldap
```
(Lệnh trên kiểm tra xem dịch vụ LDAP có đang chạy không.)

#### **9. Chỉnh sửa thời gian xóa mail cũ (mail purge interval)**  
```bash
zmprov ms server.com zimbraMailPurgeSleepInterval <Xm>
```
- `X` là thời gian giữa hai lần quét xóa email cũ.
- `m` là phút (có thể thay bằng `h` cho giờ).

#### **10. Tùy chỉnh thông báo email mới**  
```bash
zmprov ma name@domain.com zimbraNewMailNotificationBody 'Important message from ${SENDER_ADDRESS}.${NEWLINE}Subject:${SUBJECT}'
```
(Có thể thay đổi template của email thông báo.)

#### **11. Bật thông báo SMS cho lịch (Calendar Reminder SMS Notification)**  
- **Bật cho COS (Class of Service):**  
  ```bash
  zmprov mc <default> zimbraFeatureCalendarReminderDeviceEmailEnabled TRUE
  ```
- **Bật cho một tài khoản cụ thể:**  
  ```bash
  zmprov ma <user1> zimbraFeatureCalendarReminderDeviceEmailEnabled TRUE
  ```
- **Bật cho toàn bộ domain:**  
  ```bash
  zmprov md <domain> zimbraFeatureCalendarReminderDeviceEmailEnabled TRUE
  ```

#### **12. Bật tính năng Activity Stream (lọc email theo mức độ ưu tiên)**  
- **Bật cho toàn bộ COS:**  
  ```bash
  zmprov mc <default> zimbraFeaturePriorityInboxEnabled TRUE
  ```
- **Bật cho một tài khoản cụ thể:**  
  ```bash
  zmprov ma <user1> zimbraFeaturePriorityInboxEnabled TRUE
  ```

---
