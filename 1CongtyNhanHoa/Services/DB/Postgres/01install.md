### Cài đặt PostgreSQL để cấu hình máy chủ cơ sở dữ liệu

#### **[1] Cài đặt và khởi động PostgreSQL**
- Cài đặt PostgreSQL phiên bản 14:  
  ```bash
  root@www:~# apt -y install postgresql-14
  ```

#### **[2] Cấu hình kết nối mặc định**
- Theo mặc định, PostgreSQL chỉ cho phép kết nối từ **localhost** với phương thức xác thực **[peer]**.  


**Cấu hình mặc định:**  
- PostgreSQL chỉ lắng nghe trên localhost:  
  ```bash
  root@www:~# grep listen_addresses /etc/postgresql/14/main/postgresql.conf
  #listen_addresses = 'localhost' # địa chỉ IP sẽ lắng nghe
  ```
- Phương thức xác thực mặc định:  
  ```bash
  root@www:~# grep -v -E "^#|^$" /etc/postgresql/14/main/pg_hba.conf
  local   all             postgres                                peer
  local   all             all                                     peer
  host    all             all             127.0.0.1/32            scram-sha-256
  host    all             all             ::1/128                 scram-sha-256
  local   replication     all                                     peer
  host    replication     all             127.0.0.1/32            scram-sha-256
  host    replication     all             ::1/128                 scram-sha-256
  ```

#### **[3] Tạo người dùng và cơ sở dữ liệu**
- Khi dùng xác thực **[peer]**, bạn cần tạo người dùng trong hệ điều hành và PostgreSQL có cùng tên.  
  - **Tạo người dùng hệ điều hành:**  
    ```bash
    root@www:~# adduser ubuntu
    ```
  - **Tạo người dùng và cơ sở dữ liệu trong PostgreSQL:**  
    ```bash
    root@www:~# su - postgres
    postgres@www:~$ createuser ubuntu
    postgres@www:~$ createdb testdb -O ubuntu
    ```
  - **Hiển thị danh sách người dùng và cơ sở dữ liệu:**  
    ```bash
    postgres@www:~$ psql -c "select usename from pg_user;"
    postgres@www:~$ psql -l
    ```

#### **[4] Kết nối đến cơ sở dữ liệu PostgreSQL**
- Kết nối tới cơ sở dữ liệu vừa tạo:  
  ```bash
  ubuntu@www:~$ psql testdb
  ```
- **Hiển thị thông tin người dùng:**  
  ```sql
  testdb=> \du
  ```
- **Hiển thị danh sách cơ sở dữ liệu:**  
  ```sql
  testdb=> \l
  ```

#### **[5] Tạo bảng, thêm dữ liệu và xóa bảng**
- **Tạo bảng thử nghiệm:**  
  ```sql
  testdb=> create table test_table (no int, name text);
  ```
- **Chèn dữ liệu vào bảng:**  
  ```sql
  testdb=> insert into test_table (no, name) values (01, 'Ubuntu');
  ```
- **Xác nhận dữ liệu trong bảng:**  
  ```sql
  testdb=> select * from test_table;
  ```
- **Xóa bảng:**  
  ```sql
  testdb=> drop table test_table;
  ```
- **Thoát khỏi PostgreSQL:**  
  ```sql
  testdb=> \q
  ```

#### **[6] Xóa cơ sở dữ liệu**
- **Xóa cơ sở dữ liệu vừa tạo:**  
  ```bash
  ubuntu@www:~$ dropdb testdb
  ```
- **Kiểm tra danh sách cơ sở dữ liệu:**  
  ```bash
  ubuntu@www:~$ psql -l
  ```

---

### **Lưu ý** 
- Luôn kiểm tra file cấu hình khi thực hiện các thay đổi, ví dụ:  
  - `/etc/postgresql/14/main/postgresql.conf`  
  - `/etc/postgresql/14/main/pg_hba.conf`.  
- Các quyền truy cập cần được cấu hình đúng khi sử dụng trong môi trường sản xuất. 
