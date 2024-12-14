### **Hướng dẫn cài đặt và cấu hình MySQL Server trên Ubuntu**  

chúng ta sẽ cùng tìm hiểu cách **cài đặt** và **cấu hình MySQL Server** trên hệ điều hành Ubuntu.
---

### **MySQL là gì?**  
MySQL là một hệ quản trị cơ sở dữ liệu quan hệ mã nguồn mở (RDBMS) phổ biến, được biết đến với tính đáng tin cậy, linh hoạt và dễ sử dụng. MySQL được sử dụng rộng rãi cho các ứng dụng từ đơn giản như web đến các nền tảng dữ liệu phức tạp. MySQL là một thành phần quan trọng trong bộ công cụ LAMP (Linux, Apache, MySQL, PHP/Python/Perl), được ưa chuộng trong phát triển web.

---

### **Tính năng nổi bật của MySQL**  
1. **Mã nguồn mở**:  
   - Người dùng có thể xem, chỉnh sửa và phân phối mã nguồn của MySQL theo giấy phép GPL.  

2. **Cơ sở dữ liệu quan hệ**:  
   - Tổ chức dữ liệu theo dạng bảng, dòng, cột và hỗ trợ SQL (Structured Query Language).  

3. **Khả năng mở rộng**:  
   - Quản lý lượng lớn dữ liệu và lưu lượng truy cập cao.  
   - Cung cấp tính năng sao chép và phân cụm để tăng hiệu suất và đảm bảo tính sẵn sàng cao.  

4. **Dễ sử dụng**:  
   - Giao diện thân thiện và tài liệu phong phú phù hợp cho cả người mới bắt đầu và chuyên gia.  

5. **Bảo mật mạnh mẽ**:  
   - Hỗ trợ mã hóa mật khẩu, xác thực người dùng, điều khiển truy cập và mã hóa SSL.  

6. **Tính tương thích cao**:  
   - Hỗ trợ nhiều hệ điều hành (Linux, Windows, macOS) và các ngôn ngữ lập trình khác nhau.  

7. **Cộng đồng hỗ trợ lớn**:  
   - Cộng đồng đông đảo giúp đảm bảo hỗ trợ liên tục, cập nhật thường xuyên và nguồn tài nguyên phong phú.

---

### **Yêu cầu trước khi cài đặt**  
1. **Hệ điều hành**: Máy chủ Ubuntu (phiên bản Desktop hoặc Server).  
2. **Quyền người dùng**: Tài khoản `root` hoặc tài khoản không phải `root` nhưng có quyền `sudo`.

---

### **Các bước cài đặt MySQL Server trên Ubuntu**  

#### **Bước 1: Cập nhật kho phần mềm**  
Trước khi cài đặt phần mềm, hãy cập nhật danh sách kho phần mềm để đảm bảo bạn cài đặt phiên bản mới nhất.  

```bash
sudo apt update
```

---

#### **Bước 2: Cài đặt MySQL Server**  
Sau khi cập nhật, cài đặt MySQL Server và Client bằng lệnh sau:  

```bash
sudo apt install mysql-server mysql-client -y
```

Sau khi cài đặt, khởi động và thiết lập MySQL để tự động chạy khi khởi động hệ thống:  

```bash
sudo systemctl start mysql
sudo systemctl enable mysql
```

Kiểm tra trạng thái MySQL để đảm bảo dịch vụ đang chạy:  

```bash
sudo systemctl status mysql
```

---

#### **Bước 3: Bảo mật MySQL Server**  
Khi cài đặt xong, MySQL không có mật khẩu cho tài khoản `root`. Để bảo mật, chạy lệnh sau:  

```bash
sudo mysql_secure_installation
```

Hệ thống sẽ yêu cầu bạn:  
1. Đặt mật khẩu cho tài khoản `root`.  
2. Xóa tài khoản ẩn danh.  
3. Tắt đăng nhập từ xa với `root`.  
4. Xóa cơ sở dữ liệu `test`.  

Chọn các tùy chọn theo gợi ý an toàn (gõ `y` khi được yêu cầu).  

---

#### **Bước 4: Đăng nhập MySQL và đổi mật khẩu `root`**  
Đăng nhập MySQL với quyền `sudo`:  

```bash
sudo mysql
```

Thay đổi plugin xác thực từ `auth_socket` sang `mysql_native_password` và đặt mật khẩu cho tài khoản `root`:  

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MatKhauCuaBan';
FLUSH PRIVILEGES;
EXIT;
```

---

#### **Bước 5: Điều chỉnh tường lửa (nếu cần)**  
Nếu bạn cần truy cập MySQL từ xa, hãy mở cổng **3306** (cổng mặc định của MySQL):  

```bash
sudo ufw allow 3306
sudo ufw reload
sudo ufw status
```

---

### **Tóm tắt**  
Cài đặt MySQL Server trên Ubuntu là bước đầu tiên quan trọng để thiết lập một hệ thống quản trị cơ sở dữ liệu ổn định và hiệu quả. Bằng cách làm theo hướng dẫn này, bạn đã cài đặt và bảo mật MySQL thành công.  

Bây giờ, bạn có thể sử dụng MySQL để lưu trữ và quản lý dữ liệu, phục vụ cho các ứng dụng và dự án của mình với hiệu suất tối ưu.  

