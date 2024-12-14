Ta thực hiện các bước sau để thêm người dùng có thể kết nối vào database

### **Bước 1: Đăng nhập MySQL**
Đầu tiên, bạn cần đăng nhập vào MySQL với quyền `root` (hoặc tài khoản có quyền tương tự):

```bash
sudo mysql
```

### **Bước 2: Tạo người dùng mới**
Sử dụng câu lệnh `CREATE USER` để tạo một người dùng mới. Trong ví dụ này, chúng ta sẽ tạo một người dùng có tên là `phat` và mật khẩu là `Phat12345@@@`.

```sql
CREATE USER ''phat''@'localhost' IDENTIFIED BY 'Phat12345@@@';
```

- `'phat'` là tên người dùng bạn muốn tạo.
- `'localhost'` chỉ ra rằng người dùng này chỉ có thể kết nối từ máy chủ địa phương. Nếu bạn muốn người dùng có thể kết nối từ bất kỳ đâu, bạn có thể thay `'localhost'` bằng `'%'` (kết nối từ mọi địa chỉ IP).
- `'Phat12345@@@'` là mật khẩu của người dùng mới.

### **Bước 3: Cấp quyền cho người dùng**
Tiếp theo, bạn cần cấp quyền cho người dùng mới để họ có thể truy cập và thao tác trên cơ sở dữ liệu. Ví dụ, để cấp quyền **đọc và ghi (SELECT, INSERT, UPDATE, DELETE)** cho người dùng `newuser` trên cơ sở dữ liệu `new_schema`, bạn có thể sử dụng lệnh sau:

```sql
GRANT SELECT, INSERT, UPDATE, DELETE ON new_schema.* TO 'newuser'@'localhost';
```

- `new_schema.*` chỉ ra quyền được cấp cho tất cả các bảng trong cơ sở dữ liệu `new_schema`.
- Bạn có thể thay đổi quyền cho phù hợp với yêu cầu, ví dụ như cấp quyền `ALL` để người dùng có tất cả quyền: `GRANT ALL PRIVILEGES ON new_schema.* TO 'newuser'@'localhost';`

### **Bước 4: Tải lại các bảng quyền**
Sau khi cấp quyền, bạn cần tải lại các bảng quyền để các thay đổi có hiệu lực:

```sql
FLUSH PRIVILEGES;
```

### **Bước 5: Kiểm tra quyền**
Cuối cùng, bạn có thể kiểm tra quyền của người dùng mới để đảm bảo rằng người dùng có thể truy cập cơ sở dữ liệu và thực hiện các thao tác:

```sql
SHOW GRANTS FOR 'newuser'@'localhost';
```

### **Bước 6: Thoát MySQL**
Khi hoàn thành, bạn có thể thoát khỏi MySQL:

```sql
EXIT;
```

---

### **Kết nối với MySQL bằng người dùng mới**
Để kết nối vào MySQL bằng người dùng mới, bạn có thể sử dụng câu lệnh sau:

```bash
mysql -u root -p
```

Khi được yêu cầu, nhập mật khẩu cho người dùng `root`.

---


Connect MySQL Workbench on Windows to MySQL server on Linux

Để kết nối MySQL Workbench trên Windows với MySQL server trên Linux, bạn có thể làm theo các bước sau:

### Bước 1: Cài đặt và khởi động MySQL Server trên Linux
1. **Cài đặt MySQL Server trên Linux**:
   ```bash
   sudo apt update
   sudo apt install mysql-server
   ```
2. **Khởi động lại MySQL Server**:
   ```bash
   sudo systemctl restart mysql
   ```

### Bước 2: Cấu hình MySQL để chấp nhận kết nối từ xa
1. **Mở file cấu hình MySQL**:
   ```bash
   sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
   ```
2. **Thay đổi `bind-address` thành `0.0.0.0` để cho phép kết nối từ bất kỳ địa chỉ nào**:
   ```plaintext
   bind-address = 0.0.0.0
   ```
4. **Cập nhật cấu hình MySQL**:
   ```bash
   sudo systemctl restart mysql
   ```

### Bước 3: Tạo người dùng MySQL cho kết nối từ xa
1. **Đăng nhập vào MySQL Server**:
   ```bash
   sudo mysql -u root -p
   ```
2. **Tạo người dùng mới**:
   ```sql
   CREATE USER 'remote_user'@'%' IDENTIFIED BY 'password';
   GRANT ALL PRIVILEGES ON *.* TO 'remote_user'@'%' WITH GRANT OPTION;
   FLUSH PRIVILEGES;
   ```
3. **Thoát khỏi MySQL**:
   ```sql
   exit
   ```

### Bước 4: Cấu hình firewall trên Linux
1. **Mở firewall**:
   ```bash
   sudo ufw allow from any to any port 3306
   ```
2. **Kiểm tra firewall**:
   ```bash
   sudo ufw status
   ```

### Bước 5: Kết nối MySQL Workbench trên Windows với MySQL Server trên Linux
1. **Mở MySQL Workbench**.
2. **Tạo kết nối mới**:
   - Click vào biểu tượng `+` gần MySQL Connections.
   - Chọn `Standard (TCP/IP) over SSH`.
3. **Nhập thông tin kết nối**:
   - **SSH Hostname**: Địa chỉ IP của máy chủ Linux.
   - **SSH Username**: Tên đăng nhập SSH của bạn.
   - **SSH Password**: Mật khẩu SSH của bạn.
   - **MySQL Hostname**: `localhost`.
   - **MySQL Server Port**: `3306`.
   - **Username**: Tên người dùng MySQL mà bạn đã tạo.
   - **Password**: Mật khẩu của người dùng MySQL.
4. **Kiểm tra kết nối**:
   - Click vào nút `Test Connection` để kiểm tra kết nối]
![](https://img001.prntscr.com/file/img001/8nA7vX8RSe2BwTh0z2cn7A.png)


![](https://img001.prntscr.com/file/img001/BbhbigSJT0-FetzPyu_cwQ.png)

---


![](https://img001.prntscr.com/file/img001/u9L1zFLgSj2f26ZCXO_n1g.png)



![](https://img001.prntscr.com/file/img001/v5cRUFtKSauoXsq66n_x2A.png)
Link tham khảo

https://dev.mysql.com/doc/workbench/en/wb-getting-started-tutorial-create-connection.html

