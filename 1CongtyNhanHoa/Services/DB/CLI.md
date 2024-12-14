### **Hướng dẫn cơ bản về MySQL**

---

#### **Bắt đầu học MySQL**  
- **Tài liệu nhập môn**:  
  [SQL Teaching](http://www.sqlteaching.com/)  
  [Codecademy - Learn SQL](https://www.codecademy.com/learn/learn-sql)  
  [Codecademy - SQL Catalog](https://www.codecademy.com/catalog/language/sql)  

- **Hướng dẫn liên quan**:  
  - MySQL CLI  
  - Phân tích các chỉ số kinh doanh  
  - Infographic về SQL Joins  

- **Công cụ hỗ trợ**:  
  - [TablePlus](https://tableplus.com/)  
  - [DataGrip](https://www.jetbrains.com/datagrip/)  
  - Sequel Pro (đã ngừng phát triển)

---

#### **Các lệnh cơ bản của MySQL**

| **Lệnh**                                      | **Mô tả**                                                                 |
|-----------------------------------------------|---------------------------------------------------------------------------|
| **Truy cập MySQL Monitor**                    | `mysql -u [username] -p` (yêu cầu mật khẩu)                              |
| **Hiển thị tất cả cơ sở dữ liệu**             | `show databases;`                                                        |
| **Truy cập một cơ sở dữ liệu cụ thể**         | `mysql -u [username] -p [database]`                                      |
| **Tạo cơ sở dữ liệu mới**                     | `create database [database];`                                            |
| **Chọn cơ sở dữ liệu**                        | `use [database];`                                                        |
| **Xác định cơ sở dữ liệu đang sử dụng**       | `select database();`                                                     |
| **Hiển thị tất cả bảng**                      | `show tables;`                                                           |
| **Hiển thị cấu trúc của bảng**                | `describe [table];`                                                      |
| **Danh sách các index trên bảng**             | `show index from [table];`                                               |
| **Tạo bảng mới với cột**                      | `CREATE TABLE [table] ([column] VARCHAR(120), [another-column] DATETIME);`|
| **Thêm một cột vào bảng**                     | `ALTER TABLE [table] ADD COLUMN [column] VARCHAR(120);`                  |
| **Thêm cột ID tự động tăng duy nhất**         | `ALTER TABLE [table] ADD COLUMN [column] INT NOT NULL AUTO_INCREMENT PRIMARY KEY;` |
| **Thêm một bản ghi**                          | `INSERT INTO [table] ([column], [column]) VALUES ('[value]', '[value]');`|
| **Hàm nhập datetime**                         | `NOW()`                                                                  |
| **Chọn tất cả bản ghi**                       | `SELECT * FROM [table];`                                                 |
| **Giải thích bản ghi**                        | `EXPLAIN SELECT * FROM [table];`                                         |
| **Chọn một phần bản ghi**                     | `SELECT [column], [another-column] FROM [table];`                        |
| **Đếm số lượng bản ghi**                      | `SELECT COUNT([column]) FROM [table];`                                   |
| **Chọn và đếm bản ghi theo nhóm**             | `SELECT *, (SELECT COUNT([column]) FROM [table]) AS count FROM [table] GROUP BY [column];` |
| **Chọn bản ghi cụ thể**                       | `SELECT * FROM [table] WHERE [column] = [value];`                        |
| **Chọn bản ghi có giá trị cụ thể**            | `SELECT * FROM [table] WHERE [column] LIKE '%[value]%';`                 |
| **Chọn bản ghi bắt đầu bằng giá trị**         | `SELECT * FROM [table] WHERE [column] LIKE '[value]%';`                  |
| **Chọn khoảng giá trị**                       | `SELECT * FROM [table] WHERE [column] BETWEEN [value1] AND [value2];`    |
| **Sắp xếp và giới hạn kết quả**               | `SELECT * FROM [table] WHERE [column] ORDER BY [column] ASC LIMIT [value];` |
| **Cập nhật bản ghi**                          | `UPDATE [table] SET [column] = '[updated-value]' WHERE [column] = [value];` |
| **Xóa bản ghi**                               | `DELETE FROM [table] WHERE [column] = [value];`                          |
| **Xóa tất cả bản ghi trong bảng**             | `DELETE FROM [table];`                                                   |
| **Xóa bảng**                                  | `DROP TABLE [table];`                                                    |
| **Xóa cơ sở dữ liệu**                         | `DROP DATABASE [database];`                                              |
| **Xuất cơ sở dữ liệu**                        | `mysqldump -u [username] -p [database] > db_backup.sql`                  |
| **Nhập cơ sở dữ liệu**                        | `mysql -u [username] -p -h localhost [database] < db_backup.sql`         |
| **Đăng xuất**                                 | `exit;`                                                                  |

---

#### **Hàm tổng hợp (Aggregate Functions)**

| **Hàm**                                     | **Mô tả**                                                               |
|---------------------------------------------|-------------------------------------------------------------------------|
| **Chọn không trùng lặp**                   | `SELECT DISTINCT [column] FROM [table];`                               |
| **Tổng số bản ghi**                        | `SELECT SUM([column]) FROM [table];`                                   |
| **Lớn nhất trong cột**                     | `SELECT MAX([column]) FROM [table];`                                   |
| **Nhỏ nhất trong cột**                     | `SELECT MIN([column]) FROM [table];`                                   |
| **Giá trị trung bình**                     | `SELECT AVG([column]) FROM [table];`                                   |
| **Trung bình làm tròn theo nhóm**          | `SELECT [category-column], ROUND(AVG([column]), 2) FROM [table] GROUP BY [category-column];` |

---

#### **Làm việc với nhiều bảng**

| **Lệnh**                                    | **Mô tả**                                                               |
|---------------------------------------------|-------------------------------------------------------------------------|
| **Chọn từ nhiều bảng**                      | `SELECT [table1].[column], [table2].[column] FROM [table1], [table2];`  |
| **Kết hợp bảng với điều kiện**              | `SELECT * FROM [table1] INNER JOIN [table2] ON [table1].[column] = [table2].[column];` |
| **Kết hợp bảng không yêu cầu điều kiện**    | `SELECT * FROM [table1] LEFT OUTER JOIN [table2] ON [table1].[column] = [table2].[column];` |
| **Đổi tên bảng hoặc cột**                   | `SELECT [table1].[column] AS '[value]' FROM [table1];`                  |

---

#### **Quản lý người dùng**

| **Lệnh**                                    | **Mô tả**                                                               |
|---------------------------------------------|-------------------------------------------------------------------------|
| **Hiển thị tất cả người dùng**              | `SELECT User, Host FROM mysql.user;`                                    |
| **Tạo người dùng mới**                      | `CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';`          |
| **Cấp quyền toàn bộ**                       | `GRANT ALL ON database.* TO 'user'@'localhost';`                        |

--- 

#### **Tìm địa chỉ IP của máy chủ MySQL**  
```sql
SHOW VARIABLES WHERE Variable_name = 'hostname';
```
