##  1. Cài đặt Kerio Connect trên Ubuntu

### Bước 1: Cài đặt các thư viện cần thiết

```bash
sudo apt-get update
sudo apt-get install sysstat
sudo locale-gen *.UTF-8
```

### Bước 2: Tải và cài đặt Kerio Connect

* Tải gói `.deb` từ trang chính thức của Kerio Connect.
* Cài đặt gói:

```bash
sudo dpkg -i kerio-connect-<phiên_bản>-linux-amd64.deb
```

Thay `<phiên_bản>` bằng số phiên bản cụ thể bạn đã tải về.

---

##  2. Quản lý người dùng, nhóm, alias và mailing list

### Tạo người dùng

1. Đăng nhập vào giao diện quản trị WebAdmin.
2. Điều hướng đến **Accounts > Users**.
3. Nhấn **Add** để thêm người dùng mới.

### Tạo nhóm người dùng

1. Vào **Accounts > Groups**.
2. Chọn tên miền và nhấn **Add**.
3. Nhập tên nhóm và thêm người dùng vào nhóm.

### Tạo alias

1. Trong phần **Accounts > Aliases**, chọn tên miền.
2. Nhấn **Add** và nhập địa chỉ alias cùng địa chỉ email đích.

### Tạo mailing list

1. Vào **Accounts > Mailing Lists**.
2. Chọn tên miền và nhấn **Add**.
3. Nhập tên danh sách gửi thư và thêm thành viên.

---

##  3. Thiết lập chính sách mật khẩu

1. Trong WebAdmin, đi đến **Configuration > Security > Password Policy**.
2. Cấu hình các tùy chọn như độ dài tối thiểu, yêu cầu ký tự đặc biệt, và thời hạn mật khẩu.

---

##  4. Thiết lập chữ ký email

1. Người dùng đăng nhập vào Kerio Connect Client.
2. Vào **Settings > Email > Signature**.
3. Nhập nội dung chữ ký (hỗ trợ HTML) và lưu lại.

---

##  5. Thiết lập chuyển tiếp email

### Chuyển tiếp toàn bộ email của tên miền

1. Trong WebAdmin, vào **Configuration > Domains**.
2. Chọn tên miền và chuyển đến tab **Forwarding**.
3. Kích hoạt tùy chọn "If the recipient was not found in this domain, forward the message to another host" và nhập địa chỉ máy chủ đích cùng cổng.

### Chuyển tiếp email cá nhân

1. Người dùng đăng nhập vào Kerio Connect Client.
2. Vào **Settings > Filters**.
3. Tạo bộ lọc mới để chuyển tiếp email đến địa chỉ mong muốn.

---

## 6. Cấu hình Content Filter: Spam, Antivirus, Attachment Filters, Message Filters

1. Trong WebAdmin, đi đến **Configuration > Content Filter**.
2. Cấu hình các bộ lọc:

   * **Spam Filter**: Đặt ngưỡng điểm để đánh dấu hoặc chặn email spam.
   * **Antivirus**: Kích hoạt và cấu hình phần mềm diệt virus tích hợp.
   * **Attachment Filter**: Chặn hoặc cho phép các loại tệp đính kèm cụ thể.
   * **Message Filters**: Tạo các quy tắc để xử lý email dựa trên tiêu đề, người gửi, v.v.

---

##  7. Đổi mật khẩu tài khoản admin

Nếu bạn quên mật khẩu admin và không thể truy cập WebAdmin:

1. Dừng dịch vụ Kerio Connect:

```bash
sudo service kerio-connect stop
```

2. Mở tệp `users.cfg` trong thư mục cấu hình của Kerio Connect.
3. Tìm dòng chứa tài khoản admin và thay đổi mật khẩu theo định dạng mã hóa.
4. Lưu tệp và khởi động lại dịch vụ:

```bash
sudo service kerio-connect start
```

---

## 8. Kiểm tra log gửi/nhận email

1. Trong WebAdmin, vào **Logs**.
2. Chọn loại log cần xem: **Mail**, **SMTP Server**, **POP3 Server**, v.v.
3. Sử dụng tính năng tìm kiếm hoặc lọc để phân tích các hoạt động gửi/nhận email.

---

## 9. Thay đổi logo trong email Kerio

1. Trong WebAdmin, đi đến **Configuration > Domains**.
2. Chọn tên miền và chuyển đến tab **Custom Logo**.
3. Kích hoạt tùy chọn "Use custom logo for Kerio Connect Client" và tải lên hình ảnh logo mong muốn.

---

##  10. Cài đặt SSL trên Kerio

1. Trong WebAdmin, vào **Configuration > SSL Certificates**.
2. Nhấn **New > New Certificate** để tạo chứng chỉ tự ký hoặc **Import > Import Signed Certificate from CA** để nhập chứng chỉ từ nhà cung cấp.
3. Sau khi tạo hoặc nhập, chọn chứng chỉ và nhấn **Set as Default** để áp dụng.

---

##  11. Backup và Restore email Kerio

### Backup

1. Trong WebAdmin, đi đến **Configuration > Archiving and Backup**.
2. Cấu hình lịch trình sao lưu tự động và thư mục lưu trữ.

### Restore

1. Dừng dịch vụ Kerio Connect:

```bash
sudo service kerio-connect stop
```

2. Sử dụng công cụ `kmsrecover` để khôi phục dữ liệu:

```bash
sudo kmsrecover /đường_dẫn_đến_thư_mục_backup
```

3. Khởi động lại dịch vụ:

```bash
sudo service kerio-connect start
```

---

## 12. Chuyển dữ liệu email Kerio sang máy chủ khác

1. Trên máy chủ cũ, thực hiện sao lưu toàn bộ dữ liệu và cấu hình.
2. Cài đặt Kerio Connect trên máy chủ mới.
3. Dừng dịch vụ Kerio Connect trên máy chủ mới.
4. Sao chép dữ liệu từ máy chủ cũ sang máy chủ mới, đảm bảo giữ nguyên cấu trúc thư mục.
5. Khởi động lại dịch vụ trên máy chủ mới.
