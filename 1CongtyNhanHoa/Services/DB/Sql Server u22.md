### **Hướng dẫn cài đặt Microsoft SQL Server 2022 trên Ubuntu**

---

### **Bước 1 — Cài đặt Microsoft SQL Server 2022**
Trước khi cài đặt và sử dụng, bạn cần đọc kỹ các điều khoản sử dụng.  

#### **Thêm repository và cài đặt SQL Server**  
Chạy các lệnh sau để thêm kho lưu trữ (repository) của SQL Server vào hệ thống Ubuntu:

```bash
sudo wget https://packages.microsoft.com/keys/microsoft.asc -O /etc/apt/keyrings/mssql2022.key
sudo wget https://packages.microsoft.com/config/ubuntu/22.04/mssql-server-2022.list -O /etc/apt/sources.list.d/mssql-server-2022.list
sudo wget https://packages.microsoft.com/config/ubuntu/22.04/prod.list -O /etc/apt/sources.list.d/msprod.list
```

Chỉnh sửa các tệp cấu hình để bổ sung các cài đặt:

1. Mở tệp cấu hình SQL Server:  
   ```bash
   sudo vi /etc/apt/sources.list.d/mssql-server-2022.list
   ```
   Thêm dòng:
   ```plaintext
   deb [signed-by=/etc/apt/keyrings/mssql2022.key arch=amd64,armhf,arm64] https://packages.microsoft.com/ubuntu/22.04/mssql-server-2022 jammy main
   ```

2. Mở tệp cấu hình bổ sung:  
   ```bash
   sudo vi /etc/apt/sources.list.d/msprod.list
   ```
   Thêm dòng:
   ```plaintext
   deb [signed-by=/etc/apt/keyrings/mssql2022.key arch=amd64,armhf,arm64] https://packages.microsoft.com/ubuntu/22.04/prod jammy main
   ```

Cập nhật hệ thống và cài đặt SQL Server:

```bash
sudo apt update
sudo apt -y install mssql-server mssql-tools unixodbc-dev
```
![](https://img001.prntscr.com/file/img001/GpxYuYfySQOg5A6XKq4rQw.png)
Trong quá trình cài đặt, bạn cần **chấp nhận các điều khoản sử dụng (license terms)** bằng cách chọn **Yes** khi được yêu cầu.

---

### **Bước 2 — Thiết lập ban đầu**
Chạy lệnh thiết lập SQL Server ban đầu:

```bash
sudo /opt/mssql/bin/mssql-conf setup
```

Chọn phiên bản bạn muốn sử dụng từ các tùy chọn sau:  

1. **Evaluation**: Miễn phí, giới hạn 180 ngày (không dùng trong môi trường sản xuất).  
2. **Developer**: Miễn phí, chỉ dành cho phát triển.  
3. **Express**: Miễn phí.  
4. **Web**: Trả phí.  
5. **Standard**: Trả phí.  
6. **Enterprise**: Trả phí, giới hạn CPU.  
7. **Enterprise Core**: Trả phí, tối đa CPU hệ điều hành hỗ trợ.  
8. **License key**: Nhập key bản quyền.  
9. **Standard (Azure)**: Thanh toán qua Azure.  
10. **Enterprise Core (Azure)**: Thanh toán qua Azure.  

Nhập lựa chọn của bạn (ví dụ: **2** để chọn **Developer**). Sau đó:

1. Chấp nhận các điều khoản sử dụng (gõ **Yes**).
2. Đặt mật khẩu cho tài khoản quản trị **SA**.  

Kiểm tra trạng thái dịch vụ SQL Server sau khi thiết lập:

```bash
sudo systemctl status mssql-server
```

Kết quả hiển thị dịch vụ đang chạy:

```
*  mssql-server.service - Microsoft SQL Server Database Engine
     Active: active (running) ...
```

Cấu hình biến môi trường để sử dụng công cụ SQL Server:

```bash
echo 'export PATH=$PATH:/opt/mssql-tools/bin' > /etc/profile.d/mssql.sh
source /etc/profile.d/mssql.sh
```

---

### **Bước 3 — Kết nối và kiểm tra SQL Server**
Kết nối đến SQL Server bằng công cụ `sqlcmd`:

```bash
sqlcmd -S localhost -U SA
```

Khi được nhắc, nhập mật khẩu của tài khoản **SA** mà bạn đã thiết lập.

#### **Thực hiện một số lệnh kiểm tra:**

1. Hiển thị danh sách cơ sở dữ liệu hệ thống:
   ```sql
   select name, database_id from sys.databases;
   go
   ```

2. Hiển thị danh sách người dùng hệ thống:
   ```sql
   select name from sysusers;
   go
   ```

3. Kiểm tra tài khoản hiện tại:
   ```sql
   select current_user;
   go
   ```

Thoát khỏi công cụ `sqlcmd`:

```sql
exit
```

---

### **Kết luận**
SQL Server 2022 đã được cài đặt và chạy thành công trên hệ thống Ubuntu.  
Bạn có thể bắt đầu sử dụng nó để phát triển hoặc triển khai cơ sở dữ liệu theo nhu cầu.  

![](https://img001.prntscr.com/file/img001/oFH8bna1RjmtprPYCLnA_A.png)


![](https://img001.prntscr.com/file/img001/iJnHbZuASg-FInfkzBj-2Q.png)
