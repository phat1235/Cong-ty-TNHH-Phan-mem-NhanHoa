### **5.8. Quyền Hạn (Privileges)**

#### **1. Quyền sở hữu và gán quyền**
Khi một đối tượng được tạo ra (ví dụ: bảng, chức năng), nó sẽ được gán cho một **chủ sở hữu**. Chủ sở hữu mặc định là vai trò thực hiện lệnh tạo đối tượng. Thông thường, chỉ có **chủ sở hữu** hoặc **superuser** mới có thể thực hiện các thao tác trên đối tượng. Nếu muốn người khác sử dụng đối tượng, cần phải **cấp quyền** (GRANT).

Ví dụ để thay đổi chủ sở hữu bảng:  
```sql
ALTER TABLE ten_bang OWNER TO chu_so_huu_moi;
```

Quyền được cấp thông qua lệnh GRANT. Ví dụ:  
Cấp quyền `UPDATE` cho bảng `accounts` cho người dùng `joe`:  
```sql
GRANT UPDATE ON accounts TO joe;
```

Để thu hồi quyền đã cấp, sử dụng lệnh REVOKE. Ví dụ:  
Thu hồi tất cả quyền trên bảng `accounts` từ tất cả người dùng:  
```sql
REVOKE ALL ON accounts FROM PUBLIC;
```

#### **2. Các loại quyền**
Dưới đây là danh sách các loại quyền phổ biến và ví dụ cụ thể:

| **Quyền**     | **Mô tả**                                                                                             | **Ví dụ**                                                                                                     |
|----------------|-----------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|
| **SELECT**     | Cho phép xem dữ liệu trong bảng hoặc cột cụ thể.                                                    | `GRANT SELECT ON mytable TO alice;`                                                                          |
| **INSERT**     | Cho phép chèn dữ liệu mới vào bảng.                                                                 | `GRANT INSERT ON mytable TO bob;`                                                                            |
| **UPDATE**     | Cho phép sửa đổi dữ liệu trong bảng hoặc cột cụ thể.                                                | `GRANT UPDATE(col1, col2) ON mytable TO alice;`                                                              |
| **DELETE**     | Cho phép xóa dòng trong bảng.                                                                       | `GRANT DELETE ON mytable TO bob;`                                                                            |
| **TRUNCATE**   | Cho phép xóa toàn bộ dữ liệu trong bảng (nhanh hơn DELETE).                                         | `GRANT TRUNCATE ON mytable TO admin;`                                                                        |
| **REFERENCES** | Cho phép tạo khóa ngoại tham chiếu bảng hoặc cột.                                                   | `GRANT REFERENCES(col1) ON mytable TO alice;`                                                                |
| **TRIGGER**    | Cho phép tạo trigger trên bảng.                                                                     | `GRANT TRIGGER ON mytable TO admin;`                                                                         |
| **CREATE**     | Cho phép tạo đối tượng mới như bảng, schema trong cơ sở dữ liệu.                                     | `GRANT CREATE ON DATABASE mydb TO alice;`                                                                    |
| **CONNECT**    | Cho phép kết nối đến cơ sở dữ liệu.                                                                 | `GRANT CONNECT ON DATABASE mydb TO bob;`                                                                     |
| **EXECUTE**    | Cho phép gọi các hàm hoặc thủ tục.                                                                  | `GRANT EXECUTE ON FUNCTION my_function() TO alice;`                                                          |
| **USAGE**      | Cho phép sử dụng ngôn ngữ, schema, hoặc kiểu dữ liệu cụ thể.                                        | `GRANT USAGE ON SCHEMA public TO alice;`                                                                     |

#### **3. Tóm tắt các quyền theo loại đối tượng**
Bảng sau tóm tắt quyền cho từng loại đối tượng SQL:

| **Loại đối tượng**         | **Tất cả quyền** | **Quyền mặc định của PUBLIC** | **Lệnh kiểm tra** |
|----------------------------|------------------|--------------------------------|--------------------|
| **DATABASE**               | `CTc`           | `Tc`                           | `\l`              |
| **SCHEMA**                 | `UC`            | None                           | `\dn+`            |
| **TABLE**                  | `arwdDxtm`      | None                           | `\dp`             |
| **FUNCTION hoặc PROCEDURE**| `X`             | `X`                            | `\df+`            |
| **SEQUENCE**               | `rwU`           | None                           | `\dp`             |

#### **4. Ví dụ minh họa**
Giả sử người dùng `miriam` tạo bảng `mytable` và thực hiện các lệnh sau:
```sql
GRANT SELECT ON mytable TO PUBLIC;
GRANT SELECT, UPDATE, INSERT ON mytable TO admin;
GRANT SELECT (col1), UPDATE (col1) ON mytable TO miriam_rw;
```

Kiểm tra quyền trên bảng `mytable` bằng lệnh:
```sql
\dp mytable
```

Kết quả:
```
 Access privileges
 Schema |  Name   | Type  |   Access privileges    |   Column privileges   | Policies
--------+---------+-------+------------------------+-----------------------+----------
 public | mytable | table | miriam=arwdDxtm/miriam+| col1:                +|
        |         |       | =r/miriam             +|   miriam_rw=rw/miriam |
        |         |       | admin=arw/miriam       |                       |
(1 row)
```

Trong đó:
- `miriam=arwdDxtm/miriam`: Chủ sở hữu có tất cả quyền.
- `=r/miriam`: Mọi người (PUBLIC) chỉ có quyền `SELECT`.
- `admin=arw/miriam`: Người dùng `admin` có quyền `SELECT`, `UPDATE`, và `INSERT`.

Hãy thực hành các quyền cơ bản này để hiểu rõ hơn về cách quản lý quyền trong PostgreSQL!
