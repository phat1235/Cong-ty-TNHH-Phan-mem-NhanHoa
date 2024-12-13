### Chương 1: Hướng Dẫn Sử Dụng
Hướng dẫn cơ bản về MySQL thông qua việc sử dụng chương trình **mysql client** để tạo và sử dụng một cơ sở dữ liệu đơn giản. **mysql** (đôi khi được gọi là "terminal monitor" hoặc chỉ đơn giản là "monitor") 

**mysql** cũng có thể được sử dụng ở chế độ hàng loạt (batch mode): bạn đặt các truy vấn vào một tệp trước, sau đó yêu cầu **mysql** thực thi nội dung của tệp đó. Cả hai cách sử dụng này đều được đề cập trong chương này.

Để xem danh sách các tùy chọn mà **mysql** cung cấp, hãy sử dụng lệnh với tùy chọn `--help`:

```bash
$> mysql --help
```
### Chương 2: Kết Nối và Ngắt Kết Nối Khỏi Máy Chủ

Để kết nối với máy chủ, bạn thường cần cung cấp tên người dùng MySQL khi chạy chương trình **mysql** và có thể cần cả mật khẩu. 

Nếu máy chủ MySQL chạy trên một máy khác so với nơi bạn đang đăng nhập, bạn cũng cần chỉ định tên máy (host name). 

```bash
$> mysql -h host -u user -p
Enter password: ********
```

Trong đó:
- `host`: Tên máy chạy máy chủ MySQL.
- `user`: Tên người dùng MySQL.
- `********`: Mật khẩu của bạn (nhập vào khi được nhắc `Enter password:`).

Nếu kết nối thành công, bạn sẽ thấy thông tin giới thiệu và một dấu nhắc lệnh **mysql>**:

```bash
$> mysql -h host -u user -p
Enter password: ********
Welcome to the MySQL monitor. Commands end with ; or \g.
Your MySQL connection id is 25338 to server version: 5.7.44-standard
Type 'help;' or '\h' for help. Type '\c' to clear the buffer.
mysql>
```

Dấu nhắc **mysql>** cho biết chương trình đã sẵn sàng để bạn nhập các lệnh SQL.

#### Kết Nối Từ Cùng Một Máy

Nếu bạn đăng nhập trên chính máy chạy MySQL, bạn có thể bỏ qua tham số `-h host` và chỉ cần chạy:

```bash
$> mysql -u user -p
```

#### Lỗi Khi Kết Nối

Nếu bạn gặp lỗi như sau khi cố gắng đăng nhập:

```
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/tmp/mysql.sock' (2)
```

Điều này có nghĩa là dịch vụ MySQL (trên Unix) hoặc daemon (trên Windows) không đang chạy. Hãy liên hệ với quản trị viên hoặc tham khảo phần "Cài Đặt và Nâng Cấp MySQL" tương ứng với hệ điều hành của bạn.

Để khắc phục các vấn đề thường gặp khác khi kết nối, hãy tham khảo phần "Các Lỗi Thường Gặp Khi Sử Dụng MySQL".

#### Kết Nối Không Cần Thông Tin Người Dùng

Một số cài đặt MySQL cho phép người dùng kết nối ẩn danh (anonymous) với máy chủ trên máy cục bộ. Nếu đây là trường hợp của bạn, bạn có thể kết nối mà không cần bất kỳ tham số nào:

```bash
$> mysql
```

#### Ngắt Kết Nối

Khi đã kết nối thành công, bạn có thể ngắt kết nối bất kỳ lúc nào bằng cách gõ lệnh `QUIT` (hoặc `\q`) tại dấu nhắc **mysql>**:

```sql
mysql> QUIT
Bye
```

Trên Unix, bạn cũng có thể ngắt kết nối bằng cách nhấn tổ hợp phím **Control+D**.

---

Hầu hết các ví dụ trong các phần tiếp theo giả định rằng bạn đã kết nối với máy chủ, thể hiện qua dấu nhắc **mysql>**.
### Chương 3: Nhập Các Truy Vấn
Kết nối máy chủ không đồng nghĩa với việc chọn cơ sở dữ liệu để làm việc, nhưng điều đó không quan trọng lúc này. Phần này sẽ hướng dẫn các nguyên tắc cơ bản về cách nhập truy vấn, với một số ví dụ để bạn làm quen với cách **mysql** hoạt động.

---

#### **Ví dụ Truy Vấn Đơn Giản**

Dưới đây là một truy vấn đơn giản yêu cầu máy chủ trả về phiên bản MySQL và ngày hiện tại. Nhập lệnh sau tại dấu nhắc **mysql>** và nhấn Enter:

```sql
mysql> SELECT VERSION(), CURRENT_DATE;
+--------------+--------------+
| VERSION()    | CURRENT_DATE |
+--------------+--------------+
| 5.7.1-m4-log | 2012-12-25   |
+--------------+--------------+
1 row in set (0.01 sec)
```

**Phân tích truy vấn:**
- Một truy vấn thường bao gồm một câu lệnh SQL kết thúc bằng dấu chấm phẩy `;`.
- Khi bạn nhập truy vấn, **mysql** sẽ gửi nó đến máy chủ để thực thi và hiển thị kết quả, sau đó in ra dấu nhắc **mysql>** để chờ truy vấn tiếp theo.
- Kết quả được hiển thị dưới dạng bảng (hàng và cột). Dòng đầu tiên chứa nhãn cột; các dòng tiếp theo là dữ liệu trả về.
- **mysql** cho biết số hàng được trả về và thời gian thực thi truy vấn.

Bạn có thể nhập lệnh bằng bất kỳ kiểu chữ nào, ví dụ:
```sql
SELECT VERSION(), CURRENT_DATE;
select version(), current_date;
SeLeCt vErSiOn(), current_DATE;
```

---

#### **Dùng MySQL Như Một Máy Tính**

Bạn có thể sử dụng **mysql** để thực hiện các phép toán đơn giản:

```sql
mysql> SELECT SIN(PI()/4), (4+1)*5;
+------------------+---------+
| SIN(PI()/4)      | (4+1)*5 |
+------------------+---------+
| 0.70710678118655 | 25      |
+------------------+---------+
1 row in set (0.02 sec)
```

---

#### **Truy Vấn Nhiều Lệnh Trên Một Dòng**

Bạn có thể nhập nhiều câu lệnh trên cùng một dòng, chỉ cần kết thúc mỗi câu bằng dấu `;`:

```sql
mysql> SELECT VERSION(); SELECT NOW();
+------------------+
| VERSION()        |
+------------------+
| 5.7.10-ndb-7.5.1 |
+------------------+
1 row in set (0.00 sec)

+---------------------+
| NOW()               |
+---------------------+
| 2016-01-29 18:02:55 |
+---------------------+
1 row in set (0.00 sec)
```

---

#### **Truy Vấn Nhiều Dòng**

Câu truy vấn không cần phải nằm gọn trên một dòng duy nhất. **mysql** xác định kết thúc truy vấn dựa vào dấu chấm phẩy `;`, không phải kết thúc dòng. Ví dụ:

```sql
mysql> SELECT
    -> USER()
    -> ,
    -> CURRENT_DATE;
+---------------+--------------+
| USER()        | CURRENT_DATE |
+---------------+--------------+
| jon@localhost | 2010-08-06   |
+---------------+--------------+
```

**Dấu nhắc `->`** xuất hiện khi **mysql** đang chờ bạn nhập tiếp phần còn lại của câu lệnh.

---

#### **Hủy Truy Vấn**

Nếu muốn hủy một truy vấn đang nhập, bạn có thể gõ `\c`:

```sql
mysql> SELECT
    -> USER()
    -> \c
mysql>
```

Dấu nhắc trở lại **mysql>**, cho biết **mysql** sẵn sàng nhận truy vấn mới.

---

#### **Các Loại Dấu Nhắc**

| **Dấu Nhắc** | **Ý Nghĩa**                                                                 |
|--------------|------------------------------------------------------------------------------|
| `mysql>`     | Sẵn sàng cho truy vấn mới.                                                  |
| `->`         | Đang chờ phần tiếp theo của truy vấn nhiều dòng.                            |
| `'>'`        | Đang chờ kết thúc một chuỗi bắt đầu bằng dấu nháy đơn `'`.                  |
| `">`         | Đang chờ kết thúc một chuỗi bắt đầu bằng dấu nháy kép `"`.                  |
| `` `>` ``    | Đang chờ kết thúc một định danh được bao trong dấu backtick `` ` ``.        |
| `/*>`        | Đang chờ kết thúc một bình luận bắt đầu bằng `/*`.                          |

---

#### **Xử Lý Truy Vấn Chưa Kết Thúc**

Nếu bạn quên dấu `;`, **mysql** sẽ đợi thêm đầu vào. Hãy thêm dấu `;` để hoàn thành truy vấn:

```sql
mysql> SELECT USER()
    -> ;
+---------------+
| USER()        |
+---------------+
| jon@localhost |
+---------------+
```

Nếu nhập chuỗi chưa kết thúc (thiếu dấu nháy), **mysql** sẽ chờ chuỗi hoàn chỉnh:

```sql
mysql> SELECT * FROM my_table WHERE name = 'Smith AND age < 30;
 '>
```

Hãy nhập dấu nháy còn thiếu, sau đó dùng `\c` để hủy truy vấn:

```sql
 '>\c
mysql>
```

---

#### **Lưu Ý Quan Trọng**

- Từ chương này trở đi, các ví dụ về truy vấn nhiều dòng sẽ được viết mà không hiển thị dấu nhắc `->` để dễ sao chép và thử nghiệm.

# **Chương 4: Tạo và Sử dụng Cơ sở Dữ liệu**  

**Mục lục**  
4.1 Tạo và Chọn Cơ sở Dữ liệu 

4.2 Tạo Bảng 

4.3 Nạp Dữ Liệu vào Bảng 

4.4 Truy xuất Thông tin từ Bảng

4.4.1 Lấy Tất cả Dữ liệu  

4.4.2 Lấy Các Dòng Cụ thể 

4.4.3 Lấy Các Cột Cụ thể  

4.4.4 Sắp xếp Các Dòng 

4.4.5 Tính toán Ngày tháng 

4.4.6 Làm việc với Giá trị NULL 

4.4.7 So khớp Mẫu 

4.4.8 Đếm Dòng

4.4.9 Sử dụng Nhiều Bảng  

---

Khi bạn đã biết cách nhập các câu lệnh SQL, bạn đã sẵn sàng để truy cập cơ sở dữ liệu.  

Giả sử bạn có một số vật nuôi trong nhà và muốn theo dõi các thông tin khác nhau về chúng. Bạn có thể làm điều này bằng cách tạo các bảng để lưu trữ dữ liệu và nạp vào đó thông tin mong muốn. Sau đó, bạn có thể trả lời nhiều câu hỏi khác nhau về thú cưng bằng cách truy xuất dữ liệu từ các bảng. Phần này hướng dẫn bạn thực hiện các thao tác sau:  

- Tạo một cơ sở dữ liệu  
- Tạo một bảng  
- Nạp dữ liệu vào bảng  
- Truy xuất dữ liệu từ bảng theo nhiều cách  
- Sử dụng nhiều bảng  

Cơ sở dữ liệu **menagerie** được thiết kế đơn giản (có chủ ý), nhưng bạn có thể dễ dàng nghĩ đến các tình huống thực tế khác mà một cơ sở dữ liệu tương tự có thể được sử dụng, chẳng hạn như một nông dân theo dõi gia súc, hoặc một bác sĩ thú y theo dõi hồ sơ bệnh nhân.  

Bạn có thể tải xuống các truy vấn mẫu và dữ liệu mẫu được sử dụng trong các phần tiếp theo từ trang web MySQL tại [MySQL Documentation](https://dev.mysql.com/doc/).  

---

### **4.1 Tạo và Chọn Cơ sở Dữ liệu**  

Dùng câu lệnh `SHOW` để kiểm tra các cơ sở dữ liệu hiện có trên máy chủ:  
```sql
mysql> SHOW DATABASES;
+----------+
| Database |
+----------+
| mysql    |
| test     |
| tmp      |
+----------+
```
- Cơ sở dữ liệu `mysql` mô tả quyền truy cập của người dùng.  
- Cơ sở dữ liệu `test` thường được dùng làm nơi thử nghiệm.  

Lưu ý: Danh sách các cơ sở dữ liệu có thể khác trên máy của bạn. Câu lệnh `SHOW DATABASES` chỉ hiển thị những cơ sở dữ liệu mà bạn có quyền truy cập.  

Nếu cơ sở dữ liệu `test` tồn tại, thử truy cập nó bằng lệnh:  
```sql
mysql> USE test;
Database changed
```
Câu lệnh `USE` không cần dấu chấm phẩy (dấu `;`) ở cuối, nhưng nếu thêm vào cũng không gây ảnh hưởng gì.  

Để tạo cơ sở dữ liệu riêng, bạn cần sự hỗ trợ từ quản trị viên MySQL với quyền như sau:  
```sql
mysql> GRANT ALL ON menagerie.* TO 'your_mysql_name'@'your_client_host';
```
Ở đây:  
- `your_mysql_name`: Tên người dùng MySQL của bạn.  
- `your_client_host`: Máy chủ mà bạn dùng để kết nối.  

Nếu bạn có quyền, hãy tự tạo cơ sở dữ liệu với lệnh:  
```sql
mysql> CREATE DATABASE menagerie;
```
**Lưu ý**: Dưới hệ điều hành Unix, tên cơ sở dữ liệu phân biệt chữ hoa, chữ thường, do đó bạn phải luôn tham chiếu đúng cách. Trên Windows, điều này không bắt buộc, nhưng tốt nhất bạn vẫn nên duy trì cách viết thống nhất.  

Nếu nhận lỗi sau khi tạo cơ sở dữ liệu:  
```plaintext
ERROR 1044 (42000): Access denied for user 'micah'@'localhost' to database 'menagerie'
```
Điều này có nghĩa tài khoản của bạn không có quyền tạo cơ sở dữ liệu. Hãy liên hệ với quản trị viên.  

Sau khi tạo cơ sở dữ liệu, chọn nó để sử dụng bằng câu lệnh:  
```sql
mysql> USE menagerie;
Database changed
```
Bạn cũng có thể chọn cơ sở dữ liệu ngay khi khởi chạy MySQL:  
```bash
$> mysql -h host -u user -p menagerie
Enter password: ********
```
**Lưu ý quan trọng**:  
Tên cơ sở dữ liệu không phải mật khẩu của bạn. Nếu bạn muốn nhập mật khẩu ngay trên dòng lệnh, hãy viết liền không có khoảng trống, ví dụ: `-ppassword`. Tuy nhiên, làm như vậy không an toàn.  

---

### **4.2 Tạo Bảng**  

Cơ sở dữ liệu mới tạo ban đầu sẽ trống. Xem các bảng hiện có bằng lệnh:  
```sql
mysql> SHOW TABLES;
Empty set (0.00 sec)
```
Hãy quyết định cấu trúc của bảng, ví dụ: tạo bảng **pet** với các cột chứa thông tin như tên, chủ sở hữu, loài, giới tính, ngày sinh, và ngày mất.  

Sử dụng lệnh sau để tạo bảng:  
```sql
mysql> CREATE TABLE pet (
    name VARCHAR(20), 
    owner VARCHAR(20),
    species VARCHAR(20), 
    sex CHAR(1), 
    birth DATE, 
    death DATE
);
```
- `VARCHAR` dùng cho cột có độ dài thay đổi, như tên, chủ sở hữu.  
- `CHAR(1)` phù hợp để lưu trữ giới tính ('m' hoặc 'f').  
- `DATE` dùng cho ngày tháng như ngày sinh và ngày mất.  

Kiểm tra các bảng đã tạo:  
```sql
mysql> SHOW TABLES;
+---------------------+
| Tables in menagerie |
+---------------------+
| pet                 |
+---------------------+
```
Xem chi tiết cấu trúc bảng bằng lệnh:  
```sql
mysql> DESCRIBE pet;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| name    | varchar(20) | YES  |     | NULL    |       |
| owner   | varchar(20) | YES  |     | NULL    |       |
| species | varchar(20) | YES  |     | NULL    |       |
| sex     | char(1)     | YES  |     | NULL    |       |
| birth   | date        | YES  |     | NULL    |       |
| death   | date        | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
```
Bạn có thể dùng lệnh `DESCRIBE` bất kỳ lúc nào để xem lại cấu trúc bảng.  

---
### 4.3 Nhập Dữ Liệu Vào Bảng
Sau khi tạo bảng, bạn cần thêm dữ liệu vào. Các câu lệnh `LOAD DATA` và `INSERT` rất hữu ích cho việc này.

Giả sử các hồ sơ thú cưng của bạn được mô tả như sau (lưu ý rằng MySQL yêu cầu định dạng ngày là 'YYYY-MM-DD'; điều này có thể khác với những gì bạn quen thuộc):

| name    | owner  | species | sex  | birth       | death      |
|---------|--------|---------|------|-------------|------------|
| Fluffy  | Harold | cat     | f    | 1993-02-04  | NULL       |
| Claws   | Gwen   | cat     | m    | 1994-03-17  | NULL       |
| Buffy   | Harold | dog     | f    | 1989-05-13  | NULL       |
| Fang    | Benny  | dog     | m    | 1990-08-27  | NULL       |
| Bowser  | Diane  | dog     | m    | 1979-08-31  | 1995-07-29 |
| Chirpy  | Gwen   | bird    | f    | 1998-09-11  | NULL       |
| Whistler| Gwen   | bird    | NULL | 1997-12-09  | NULL       |
| Slim    | Benny  | snake   | m    | 1996-04-29  | NULL       |

Vì bạn bắt đầu với một bảng trống, cách dễ dàng để điền dữ liệu là tạo một tệp văn bản chứa một dòng cho mỗi động vật của bạn, sau đó tải nội dung của tệp vào bảng bằng một câu lệnh duy nhất.

Bạn có thể tạo một tệp văn bản `pet.txt` chứa một bản ghi mỗi dòng, với các giá trị phân tách bằng tab, theo thứ tự các cột đã liệt kê trong câu lệnh `CREATE TABLE`. Đối với các giá trị thiếu (như giới tính không xác định hoặc ngày tử cho những động vật còn sống), bạn có thể sử dụng giá trị NULL. Để biểu diễn chúng trong tệp văn bản, sử dụng `\N` (dấu gạch chéo, chữ cái N viết hoa). Ví dụ, bản ghi cho "Whistler" con chim sẽ trông như sau (khoảng trắng giữa các giá trị là một ký tự tab duy nhất):

```
Whistler Gwen bird \N 1997-12-09 \N
```

Để tải tệp văn bản `pet.txt` vào bảng `pet`, bạn sử dụng câu lệnh sau:

```sql
mysql> LOAD DATA LOCAL INFILE '/path/pet.txt' INTO TABLE pet;
```

Nếu bạn đã tạo tệp trên Windows với trình soạn thảo sử dụng `\r\n` làm ký tự kết thúc dòng, bạn nên sử dụng câu lệnh này thay thế:

```sql
mysql> LOAD DATA LOCAL INFILE '/path/pet.txt' INTO TABLE pet
  LINES TERMINATED BY '\r\n';
```

(Nếu bạn đang sử dụng máy Apple với macOS, bạn có thể muốn sử dụng `LINES TERMINATED BY '\r'`.)

Bạn có thể chỉ định rõ ràng dấu phân cách giá trị cột và dấu kết thúc dòng trong câu lệnh `LOAD DATA`, nhưng mặc định là tab và dòng mới. Điều này đủ để câu lệnh đọc tệp `pet.txt` đúng cách.

Nếu câu lệnh không thành công, có thể cài đặt MySQL của bạn không bật tính năng tệp cục bộ theo mặc định. Hãy tham khảo "Security Considerations for LOAD DATA LOCAL" để biết thông tin về cách thay đổi điều này.

Khi bạn muốn thêm các bản ghi mới một cách riêng lẻ, câu lệnh `INSERT` rất hữu ích. Trong dạng đơn giản nhất, bạn cung cấp các giá trị cho mỗi cột, theo thứ tự các cột đã liệt kê trong câu lệnh `CREATE TABLE`. Giả sử Diane có một con chuột hamster mới tên là "Puffball". Bạn có thể thêm một bản ghi mới bằng câu lệnh `INSERT` như sau:

```sql
mysql> INSERT INTO pet VALUES ('Puffball', 'Diane', 'hamster', 'f', '1999-03-30', NULL);
```

Các giá trị chuỗi và ngày được chỉ định dưới dạng chuỗi được bao quanh bởi dấu nháy. Ngoài ra, với `INSERT`, bạn có thể chèn NULL trực tiếp để biểu diễn một giá trị thiếu. Bạn không sử dụng `\N` như trong `LOAD DATA`.

### 4.4 Truy Vấn Thông Tin Từ Bảng
Câu lệnh `SELECT` được sử dụng để truy xuất thông tin từ bảng. Dạng tổng quát của câu lệnh là:

```sql
SELECT what_to_select
FROM which_table
WHERE conditions_to_satisfy;
```

- `what_to_select` chỉ ra những gì bạn muốn xem, có thể là danh sách các cột hoặc * để chọn "tất cả cột".
- `which_table` chỉ ra bảng từ đó bạn muốn truy xuất dữ liệu.
- Mệnh đề `WHERE` là tùy chọn. Nếu có, `conditions_to_satisfy` chỉ ra một hoặc nhiều điều kiện mà các dòng phải thỏa mãn để được chọn.

#### 4.4.1 Chọn Tất Cả Dữ Liệu
Dạng đơn giản nhất của `SELECT` sẽ truy xuất tất cả dữ liệu từ một bảng:

```sql
mysql> SELECT * FROM pet;
```

Điều này sẽ trả về tất cả các bản ghi trong bảng `pet`.

#### 4.4.2 Chọn Các Dòng Cụ Thể
Thường thì bạn không muốn xem toàn bộ bảng, đặc biệt khi bảng trở nên lớn. Bạn có thể chỉ chọn các dòng cụ thể. Ví dụ, nếu bạn muốn kiểm tra lại ngày sinh của Bowser, bạn có thể chọn bản ghi của Bowser:

```sql
mysql> SELECT * FROM pet WHERE name = 'Bowser';
```

Điều này sẽ chỉ trả về thông tin của Bowser.

#### 4.4.3 Chọn Các Cột Cụ Thể
Nếu bạn không muốn xem toàn bộ dòng từ bảng, bạn chỉ cần liệt kê các cột bạn quan tâm, phân tách chúng bằng dấu phẩy. Ví dụ, nếu bạn chỉ muốn biết ngày sinh của các động vật, bạn có thể chọn các cột `name` và `birth`:

```sql
mysql> SELECT name, birth FROM pet;
```

#### 4.4.4 Sắp Xếp Các Dòng
Thông thường, kết quả truy vấn sẽ không có thứ tự cụ thể. Bạn có thể sử dụng mệnh đề `ORDER BY` để sắp xếp kết quả theo cách có nghĩa hơn. Ví dụ, để sắp xếp các ngày sinh của các động vật theo ngày tháng:

```sql
mysql> SELECT name, birth FROM pet ORDER BY birth;
```

Bạn cũng có thể sắp xếp theo thứ tự giảm dần bằng cách thêm từ khóa `DESC`:

```sql
mysql> SELECT name, birth FROM pet ORDER BY birth DESC;
```

#### 4.4.5 Tính Toán Ngày
MySQL cung cấp các hàm như `TIMESTAMPDIFF()` để tính toán độ tuổi của các động vật. Ví dụ:

```sql
mysql> SELECT name, birth, CURDATE(),
       TIMESTAMPDIFF(YEAR, birth, CURDATE()) AS age
       FROM pet;
```

Kết quả này sẽ trả về tên, ngày sinh, ngày hiện tại và độ tuổi tính bằng năm của từng động vật.

Hy vọng những phần dịch này giúp bạn hiểu cách làm việc với MySQL để nhập và truy vấn dữ liệu hiệu quả!
### 4.4.6 Làm việc với giá trị NULL

Giá trị NULL có thể gây bất ngờ cho bạn cho đến khi bạn quen với nó. Về mặt lý thuyết, NULL có nghĩa là "một giá trị thiếu hoặc không xác định" và nó được xử lý hơi khác biệt so với các giá trị khác.

Để kiểm tra NULL, sử dụng các toán tử IS NULL và IS NOT NULL, như ví dụ dưới đây:

```mysql
mysql> SELECT 1 IS NULL, 1 IS NOT NULL;
+-----------+---------------+
| 1 IS NULL | 1 IS NOT NULL |
+-----------+---------------+
| 0         | 1             |
+-----------+---------------+
```

Bạn không thể sử dụng các toán tử so sánh số học như =, <, hoặc <> để kiểm tra NULL. Để chứng minh điều này, bạn có thể thử câu truy vấn sau:

```mysql
mysql> SELECT 1 = NULL, 1 <> NULL, 1 < NULL, 1 > NULL;
+----------+-----------+----------+----------+
| 1 = NULL | 1 <> NULL | 1 < NULL | 1 > NULL |
+----------+-----------+----------+----------+
| NULL     | NULL      | NULL     | NULL     |
+----------+-----------+----------+----------+
```

Vì kết quả của bất kỳ phép so sánh số học nào với NULL cũng là NULL, bạn không thể thu được kết quả có ý nghĩa từ các phép so sánh như vậy.

Trong MySQL, giá trị 0 hoặc NULL có nghĩa là sai và bất kỳ giá trị nào khác đều có nghĩa là đúng. Giá trị mặc định của phép toán boolean là 1.

Cách xử lý đặc biệt này đối với NULL là lý do tại sao, trong phần trước, cần phải xác định những con vật không còn sống bằng cách sử dụng `death IS NOT NULL` thay vì `death <> NULL`.

Hai giá trị NULL được coi là bằng nhau trong câu lệnh `GROUP BY`.

Khi sử dụng `ORDER BY`, giá trị NULL sẽ được trình bày đầu tiên nếu bạn sử dụng `ORDER BY ... ASC` và cuối cùng nếu sử dụng `ORDER BY ... DESC`.

Một lỗi phổ biến khi làm việc với NULL là cho rằng không thể chèn số 0 hoặc chuỗi rỗng vào cột đã được định nghĩa là `NOT NULL`, nhưng thực tế không phải vậy. Các giá trị này thực sự là giá trị, trong khi NULL có nghĩa là "không có giá trị". Bạn có thể kiểm tra điều này dễ dàng bằng cách sử dụng IS [NOT] NULL như sau:

```mysql
mysql> SELECT 0 IS NULL, 0 IS NOT NULL, '' IS NULL, '' IS NOT NULL;
+-----------+---------------+------------+----------------+
| 0 IS NULL | 0 IS NOT NULL | '' IS NULL | '' IS NOT NULL |
+-----------+---------------+------------+----------------+
| 0         | 1             | 0          | 1              |
+-----------+---------------+------------+----------------+
```

Do đó, hoàn toàn có thể chèn số 0 hoặc chuỗi rỗng vào cột `NOT NULL`, vì chúng thực sự không phải là NULL. Xem thêm về vấn đề với các giá trị NULL.

---

### 4.4.7 So khớp mẫu (Pattern Matching)

MySQL cung cấp khả năng so khớp mẫu SQL chuẩn cũng như một dạng so khớp mẫu dựa trên biểu thức chính quy mở rộng (extended regular expressions) giống như những gì các công cụ Unix như vi, grep và sed sử dụng.

So khớp mẫu SQL cho phép bạn sử dụng ký tự `_` để so khớp với bất kỳ ký tự đơn nào và `%` để so khớp với bất kỳ số lượng ký tự nào (bao gồm cả không có ký tự nào). Trong MySQL, các mẫu SQL mặc định không phân biệt chữ hoa chữ thường.

Một số ví dụ được trình bày dưới đây. Không sử dụng `=` hoặc `<>` khi sử dụng mẫu SQL. Hãy sử dụng các toán tử so sánh `LIKE` hoặc `NOT LIKE` thay vào đó.

Để tìm tên bắt đầu bằng b:

```mysql
mysql> SELECT * FROM pet WHERE name LIKE 'b%';
+--------+--------+---------+------+------------+------------+
| name   | owner  | species | sex  | birth      | death      |
+--------+--------+---------+------+------------+------------+
| Buffy  | Harold | dog     | f    | 1989-05-13 | NULL       |
| Bowser | Diane  | dog     | m    | 1989-08-31 | 1995-07-29 |
+--------+--------+---------+------+------------+------------+
```

Để tìm tên kết thúc bằng fy:

```mysql
mysql> SELECT * FROM pet WHERE name LIKE '%fy';
+--------+--------+---------+------+------------+-------+
| name   | owner  | species | sex  | birth      | death |
+--------+--------+---------+------+------------+-------+
| Fluffy | Harold | cat     | f    | 1993-02-04 | NULL  |
| Buffy  | Harold | dog     | f    | 1989-05-13 | NULL  |
+--------+--------+---------+------+------------+-------+
```

Để tìm tên có chứa ký tự w:

```mysql
mysql> SELECT * FROM pet WHERE name LIKE '%w%';
+----------+-------+---------+------+------------+------------+
| name     | owner | species | sex  | birth      | death      |
+----------+-------+---------+------+------------+------------+
| Claws    | Gwen  | cat     | m    | 1994-03-17 | NULL       |
| Bowser   | Diane | dog     | m    | 1989-08-31 | 1995-07-29 |
| Whistler | Gwen  | bird    | NULL | 1997-12-09 | NULL       |
+----------+-------+---------+------+------------+------------+
```

Để tìm tên chứa đúng 5 ký tự, sử dụng 5 lần ký tự `_`:

```mysql
mysql> SELECT * FROM pet WHERE name LIKE '_____';
+-------+--------+---------+------+------------+-------+
| name  | owner  | species | sex  | birth      | death |
+-------+--------+---------+------+------------+-------+
| Claws | Gwen   | cat     | m    | 1994-03-17 | NULL  |
| Buffy | Harold | dog     | f    | 1989-05-13 | NULL  |
+-------+--------+---------+------+------------+-------+
```

Loại so khớp mẫu khác mà MySQL cung cấp sử dụng biểu thức chính quy mở rộng. Khi kiểm tra sự khớp cho loại mẫu này, sử dụng các toán tử `REGEXP` và `NOT REGEXP` (hoặc `RLIKE` và `NOT RLIKE`, là các từ đồng nghĩa).

Danh sách dưới đây mô tả một số đặc điểm của biểu thức chính quy mở rộng:

- `.` khớp với bất kỳ ký tự đơn nào.
- Lớp ký tự `[abc]` khớp với bất kỳ ký tự nào trong dấu ngoặc vuông. Ví dụ, `[abc]` khớp với a, b, hoặc c. Để định nghĩa một phạm vi ký tự, sử dụng dấu gạch ngang. `[a-z]` khớp với bất kỳ chữ cái nào, trong khi `[0-9]` khớp với bất kỳ chữ số nào.
- `*` khớp với 0 hoặc nhiều lần xuất hiện của ký tự đứng trước nó. Ví dụ, `x*` khớp với bất kỳ số lượng ký tự x nào, `[0-9]*` khớp với bất kỳ số lượng chữ số nào, và `.*` khớp với bất kỳ số lượng ký tự nào.
- Một biểu thức chính quy sẽ khớp nếu mẫu xuất hiện ở bất kỳ đâu trong giá trị được kiểm tra (khác với so khớp mẫu LIKE, chỉ thành công nếu mẫu khớp với toàn bộ giá trị).
- Để neo một mẫu sao cho nó phải khớp với đầu hoặc cuối giá trị, sử dụng `^` ở đầu mẫu hoặc `$` ở cuối mẫu.

Để minh họa cách biểu thức chính quy mở rộng hoạt động, các truy vấn LIKE trước đó được viết lại dưới đây để sử dụng `REGEXP`.

Để tìm tên bắt đầu bằng b, sử dụng `^` để khớp với đầu tên:

```mysql
mysql> SELECT * FROM pet WHERE name REGEXP '^b';
+--------+--------+---------+------+------------+------------+
| name   | owner  | species | sex  | birth      | death      |
+--------+--------+---------+------+------------+------------+
| Buffy  | Harold | dog     | f    | 1989-05-13 | NULL       |
| Bowser | Diane  | dog     | m    | 1989-08-31 | 1995-07-29 |
+--------+--------+---------+------+------------+------------+
```

Để buộc so khớp `REGEXP` phân biệt chữ hoa chữ thường, sử dụng từ khóa `BINARY` để biến một trong các chuỗi thành chuỗi nhị phân. Câu truy vấn này chỉ khớp với chữ b thường ở đầu tên:

```mysql
SELECT * FROM pet WHERE name REGEXP BINARY '^b';
```

## Chương 5: Lấy Thông Tin Về Cơ Sở Dữ Liệu và Bảng

Nếu bạn quên tên của một cơ sở dữ liệu hay bảng, hoặc không nhớ cấu trúc của một bảng nhất định (ví dụ, các cột của bảng đó tên là gì), MySQL có các câu lệnh giúp bạn giải quyết vấn đề này.

Bạn đã thấy câu lệnh **SHOW DATABASES** trước đây, câu lệnh này liệt kê các cơ sở dữ liệu mà server đang quản lý. Để biết cơ sở dữ liệu nào hiện tại đang được chọn, sử dụng hàm **DATABASE()**:

```sql
mysql> SELECT DATABASE();
+------------+
| DATABASE() |
+------------+
| menagerie |
+------------+
```

Nếu bạn chưa chọn cơ sở dữ liệu nào, kết quả sẽ là NULL.

Để biết các bảng có trong cơ sở dữ liệu mặc định (ví dụ, khi bạn không chắc chắn về tên của một bảng), sử dụng câu lệnh sau:

```sql
mysql> SHOW TABLES;
+---------------------+
| Tables_in_menagerie |
+---------------------+
| event               |
| pet                 |
+---------------------+
```

Tên cột trong kết quả của câu lệnh này luôn là **Tables_in_db_name**, trong đó **db_name** là tên của cơ sở dữ liệu. Tham khảo **SHOW TABLES Statement** để biết thêm chi tiết.

Nếu bạn muốn biết cấu trúc của một bảng, câu lệnh **DESCRIBE** là rất hữu ích; nó hiển thị thông tin về từng cột trong bảng:

```sql
mysql> DESCRIBE pet;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| name    | varchar(20) | YES  |     | NULL    |       |
| owner   | varchar(20) | YES  |     | NULL    |       |
| species | varchar(20) | YES  |     | NULL    |       |
| sex     | char(1)     | YES  |     | NULL    |       |
| birth   | date        | YES  |     | NULL    |       |
| death   | date        | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
```

- **Field** là tên cột.
- **Type** là kiểu dữ liệu của cột.
- **Null** cho biết cột có thể chứa giá trị NULL hay không.
- **Key** chỉ ra liệu cột có được lập chỉ mục hay không.
- **Default** chỉ ra giá trị mặc định của cột.
- **Extra** hiển thị thông tin đặc biệt về cột: Nếu cột được tạo với tùy chọn **AUTO_INCREMENT**, giá trị sẽ là **auto_increment** thay vì để trống.

**DESC** là dạng viết tắt của **DESCRIBE**. Tham khảo **DESCRIBE Statement** để biết thêm chi tiết.

Bạn có thể lấy câu lệnh **CREATE TABLE** cần thiết để tạo một bảng hiện tại bằng cách sử dụng câu lệnh **SHOW CREATE TABLE**. Tham khảo **SHOW CREATE TABLE Statement** để biết thêm.

Nếu bảng có chỉ mục, câu lệnh **SHOW INDEX FROM tbl_name** cung cấp thông tin về chúng. Tham khảo **SHOW INDEX Statement** để biết thêm chi tiết về câu lệnh này.


**Chương 7: Ví Dụ về Các Truy Vấn Thông Dụng**

**Mục lục**

7.1 Giá trị lớn nhất cho một cột ...........................................................................................................   
7.2 Dòng chứa giá trị lớn nhất của một cột cụ thể ..........................................................................   
7.3 Giá trị lớn nhất của cột theo từng nhóm ..................................................................................   
7.4 Các dòng chứa giá trị lớn nhất theo nhóm của một cột cụ thể ..................................................  
7.5 Sử dụng Biến do người dùng định nghĩa ....................................................................................   
7.6 Sử dụng Khóa ngoại ....................................................................................................................   
7.7 Tìm kiếm với Hai Khóa ...............................................................................................................   
7.8 Tính số lượt truy cập mỗi ngày ...............................................................................................   
7.9 Sử dụng AUTO_INCREMENT ....................................................................................................   

Dưới đây là các ví dụ về cách giải quyết một số vấn đề phổ biến với MySQL. Một số ví dụ sử dụng bảng **shop** để lưu trữ giá của mỗi mặt hàng (mã mặt hàng) đối với các người bán (nhà cung cấp). Giả sử mỗi người bán có một mức giá cố định cho mỗi mặt hàng, vì vậy (mã mặt hàng, người bán) là khóa chính cho các bản ghi.

Để bắt đầu, sử dụng công cụ dòng lệnh `mysql` và chọn cơ sở dữ liệu:

```bash
$> mysql your-database-name
```

Để tạo và điền dữ liệu cho bảng ví dụ, sử dụng các câu lệnh sau:

```sql
CREATE TABLE shop (
  article INT UNSIGNED DEFAULT '0000' NOT NULL,
  dealer CHAR(20) DEFAULT '' NOT NULL,
  price DECIMAL(16,2) DEFAULT '0.00' NOT NULL,
  PRIMARY KEY(article, dealer)
);

INSERT INTO shop VALUES
  (1,'A',3.45),(1,'B',3.99),(2,'A',10.99),(3,'B',1.45),
  (3,'C',1.69),(3,'D',1.25),(4,'D',19.95);
```

Sau khi thực hiện các câu lệnh, bảng sẽ có dữ liệu như sau:

```sql
SELECT * FROM shop ORDER BY article;
+---------+--------+-------+
| article | dealer | price |
+---------+--------+-------+
| 1       | A      | 3.45  |
| 1       | B      | 3.99  |
| 2       | A      | 10.99 |
| 3       | B      | 1.45  |
| 3       | C      | 1.69  |
| 3       | D      | 1.25  |
| 4       | D      | 19.95 |
+---------+--------+-------+
```

---

**7.1 Giá trị lớn nhất cho một cột**

Câu hỏi: "Mã mặt hàng cao nhất là gì?"

```sql
SELECT MAX(article) AS article FROM shop;
+---------+
| article |
+---------+
| 4       |
+---------+
```

---

**7.2 Dòng chứa giá trị lớn nhất của một cột cụ thể**

Nhiệm vụ: Tìm số, nhà cung cấp và giá của mặt hàng đắt nhất.

Điều này có thể dễ dàng thực hiện với một truy vấn con:

```sql
SELECT article, dealer, price
FROM shop
WHERE price=(SELECT MAX(price) FROM shop);
+---------+--------+-------+
| article | dealer | price |
+---------+--------+-------+
| 4       | D      | 19.95 |
+---------+--------+-------+
```

Một giải pháp khác là sử dụng **LEFT JOIN**:

```sql
SELECT s1.article, s1.dealer, s1.price
FROM shop s1
LEFT JOIN shop s2 ON s1.price < s2.price
WHERE s2.article IS NULL;
```

Bạn cũng có thể làm điều này bằng cách sắp xếp tất cả các dòng theo thứ tự giảm dần theo giá và chỉ lấy dòng đầu tiên sử dụng câu lệnh **LIMIT**:

```sql
SELECT article, dealer, price
FROM shop
ORDER BY price DESC
LIMIT 1;
```

**Lưu ý**: Nếu có nhiều mặt hàng có giá 19.95, giải pháp với **LIMIT** chỉ trả về một trong số chúng.

---

**7.3 Giá trị lớn nhất của cột theo từng nhóm**

Nhiệm vụ: Tìm giá trị cao nhất theo từng mặt hàng.

```sql
SELECT article, MAX(price) AS price
FROM shop
GROUP BY article
ORDER BY article;
+---------+-------+
| article | price |
+---------+-------+
| 1       | 3.99  |
| 2       | 10.99 |
| 3       | 1.69  |
| 4       | 19.95 |
+---------+-------+
```

---

**7.4 Các dòng chứa giá trị lớn nhất theo nhóm của một cột cụ thể**

Nhiệm vụ: Tìm nhà cung cấp hoặc các nhà cung cấp có giá đắt nhất cho mỗi mặt hàng.

Giải quyết vấn đề này có thể sử dụng truy vấn con như sau:

```sql
SELECT article, dealer, price
FROM shop s1
WHERE price=(SELECT MAX(s2.price)
             FROM shop s2
             WHERE s1.article = s2.article)
ORDER BY article;
+---------+--------+-------+
| article | dealer | price |
+---------+--------+-------+
| 1       | B      | 3.99  |
| 2       | A      | 10.99 |
| 3       | C      | 1.69  |
| 4       | D      | 19.95 |
+---------+--------+-------+
```

Truy vấn trên sử dụng một truy vấn con có liên kết (correlated subquery), điều này có thể không hiệu quả (xem thêm phần về **Truy vấn con có liên kết**). Một số cách khác để giải quyết vấn đề này là sử dụng truy vấn con không có liên kết trong phần **FROM** hoặc sử dụng **LEFT JOIN**.

**Truy vấn con không có liên kết**:

```sql
SELECT s1.article, dealer, s1.price
FROM shop s1
JOIN (
  SELECT article, MAX(price) AS price
  FROM shop
  GROUP BY article
) AS s2 ON s1.article = s2.article AND s1.price = s2.price
ORDER BY article;
```

**LEFT JOIN**:

```sql
SELECT s1.article, s1.dealer, s1.price
FROM shop s1
LEFT JOIN shop s2 ON s1.article = s2.article AND s1.price < s2.price
WHERE s2.article IS NULL
ORDER BY s1.article;
```

**Giải thích về LEFT JOIN**: LEFT JOIN làm việc dựa trên việc khi **s1.price** đạt giá trị tối đa, không có **s2.price** nào lớn hơn, và vì vậy giá trị **s2.article** tương ứng sẽ là NULL.

---

**7.5 Sử dụng Biến do người dùng định nghĩa**

Bạn có thể sử dụng biến người dùng của MySQL để nhớ các kết quả mà không cần lưu trữ chúng trong các biến tạm thời của client.

Ví dụ, để tìm các mặt hàng có giá cao nhất và thấp nhất, bạn có thể làm như sau:

```sql
mysql> SELECT @min_price:=MIN(price), @max_price:=MAX(price) FROM shop;
mysql> SELECT * FROM shop WHERE price=@min_price OR price=@max_price;
+---------+--------+-------+
| article | dealer | price |
+---------+--------+-------+
| 3       | D      | 1.25  |
| 4       | D      | 19.95 |
+---------+--------+-------+
```

---

**7.6 Sử dụng Khóa ngoại**

MySQL hỗ trợ khóa ngoại, cho phép tham chiếu dữ liệu liên quan giữa các bảng, và các ràng buộc khóa ngoại giúp duy trì tính toàn vẹn của dữ liệu liên quan.

Ví dụ sau đây liên kết các bảng cha và con thông qua khóa ngoại một cột duy nhất và cho thấy cách một ràng buộc khóa ngoại thực thi tính toàn vẹn tham chiếu.

Tạo bảng cha và con với các câu lệnh SQL sau:

```sql
CREATE TABLE parent (
  id INT NOT NULL,
  PRIMARY KEY (id)
) ENGINE=INNODB;

CREATE TABLE child (
  id INT,
  parent_id INT,
  INDEX par_ind (parent_id),
  FOREIGN KEY (parent_id)
    REFERENCES parent(id)
) ENGINE=INNODB;
```

Tiếp theo, bạn có thể thực hiện chèn dữ liệu vào bảng cha và bảng con.

```sql
mysql> INSERT INTO parent (id) VALUES (1);
mysql> INSERT INTO child (id,parent_id) VALUES (1,1);
```

Nếu bạn cố gắng chèn một dòng vào bảng con với **parent_id** không có trong bảng cha, thao tác sẽ bị từ chối với lỗi.

```sql
mysql> INSERT INTO child (id,parent_id) VALUES(2,2);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails
```


**THAM KHẢO**

`REFERENCES parent (id))`  
Hoạt động này sẽ thất bại vì bản ghi trong bảng con chứa giá trị `parent_id` (id cha) được tham chiếu.  
Khi một thao tác tác động đến giá trị khóa trong bảng cha có các dòng tương ứng trong bảng con, kết quả sẽ phụ thuộc vào hành động tham chiếu được chỉ định trong các mệnh đề con **ON UPDATE** và **ON DELETE** của mệnh đề **FOREIGN KEY**. Nếu không chỉ định các mệnh đề **ON DELETE** và **ON UPDATE** (như trong định nghĩa bảng con hiện tại), nó sẽ tương đương với việc chỉ định tùy chọn **RESTRICT**, điều này sẽ từ chối các thao tác ảnh hưởng đến giá trị khóa trong bảng cha có các dòng tương ứng trong bảng con.

Để minh họa các hành động tham chiếu **ON DELETE** và **ON UPDATE**, hãy xóa bảng con và tái tạo lại nó để bao gồm các mệnh đề **ON UPDATE** và **ON DELETE** với tùy chọn **CASCADE**. Tùy chọn **CASCADE** tự động xóa hoặc cập nhật các dòng tương ứng trong bảng con khi xóa hoặc cập nhật các dòng trong bảng cha.

```sql
DROP TABLE child;  
CREATE TABLE child (  
 id INT,  
 parent_id INT,  
 INDEX par_ind (parent_id),  
 FOREIGN KEY (parent_id)  
 REFERENCES parent(id)  
 ON UPDATE CASCADE  
 ON DELETE CASCADE  
) ENGINE=INNODB;  
```

Chèn một số dòng vào bảng con với câu lệnh sau:

```sql
mysql> INSERT INTO child (id,parent_id) VALUES(1,1),(2,1),(3,1);
```

Xác nhận rằng dữ liệu đã được chèn vào, như sau:

```sql
mysql> SELECT * FROM child;  
+------+-----------+  
| id | parent_id |  
+------+-----------+  
| 1 | 1 |  
| 2 | 1 |  
| 3 | 1 |  
+------+-----------+  
```

Cập nhật ID trong bảng cha, thay đổi từ 1 thành 2, với câu lệnh SQL sau:

```sql
mysql> UPDATE parent SET id = 2 WHERE id = 1;  
```

Xác nhận rằng việc cập nhật đã thành công bằng cách chọn tất cả các dòng từ bảng cha, như sau:

```sql
mysql> SELECT * FROM parent;  
+----+  
| id |  
+----+  
| 2 |  
+----+  
```

Xác nhận rằng hành động tham chiếu **ON UPDATE CASCADE** đã cập nhật bảng con, như sau:

```sql
mysql> SELECT * FROM child;  
+------+-----------+  
| id | parent_id |  
+------+-----------+  
| 1 | 2 |  
| 2 | 2 |  
| 3 | 2 |  
+------+-----------+  
```

Để minh họa hành động tham chiếu **ON DELETE CASCADE**, xóa các bản ghi từ bảng cha nơi `parent_id = 2`; điều này sẽ xóa tất cả các bản ghi trong bảng cha.

```sql
mysql> DELETE FROM parent WHERE id = 2;  
```

Vì tất cả các bản ghi trong bảng con đều liên kết với `parent_id = 2`, hành động tham chiếu **ON DELETE CASCADE** sẽ xóa tất cả các bản ghi trong bảng con, như sau:

```sql
mysql> SELECT * FROM child;  
Empty set (0.00 sec)  
```

Để biết thêm thông tin về các ràng buộc khóa ngoại, hãy tham khảo **FOREIGN KEY Constraints**.

---

### 7.7 Tìm Kiếm Với Hai Khóa

Một phép toán **OR** sử dụng một khóa duy nhất được tối ưu hóa tốt, giống như cách xử lý **AND**.  
Trường hợp khó khăn là khi tìm kiếm trên hai khóa khác nhau kết hợp với **OR**:

```sql
SELECT field1_index, field2_index FROM test_table  
WHERE field1_index = '1' OR field2_index = '1';  
```

Trường hợp này được tối ưu hóa. Xem **Index Merge Optimization**.  
Bạn cũng có thể giải quyết vấn đề một cách hiệu quả bằng cách sử dụng **UNION** kết hợp đầu ra của hai câu lệnh **SELECT** riêng biệt. Xem **UNION Clause**.

Mỗi **SELECT** chỉ tìm kiếm một khóa và có thể được tối ưu hóa:

```sql
SELECT field1_index, field2_index  
FROM test_table WHERE field1_index = '1'  
UNION  
SELECT field1_index, field2_index  
FROM test_table WHERE field2_index = '1';  
```

### 7.8 Tính Số Lượt Truy Cập Mỗi Ngày

Ví dụ dưới đây cho thấy cách bạn có thể sử dụng các hàm nhóm bit để tính số ngày trong mỗi tháng mà người dùng đã truy cập một trang Web.

```sql
CREATE TABLE t1 (year YEAR, month INT UNSIGNED, day INT UNSIGNED);  
INSERT INTO t1 VALUES(2000,1,1),(2000,1,20),(2000,1,30),(2000,2,2),  
(2000,2,23),(2000,2,23);  
```

Bảng ví dụ chứa các giá trị năm-tháng-ngày đại diện cho các lượt truy cập của người dùng vào trang. Để xác định có bao nhiêu ngày khác nhau trong mỗi tháng mà các lượt truy cập xảy ra, sử dụng câu truy vấn này:

```sql
SELECT year, month, BIT_COUNT(BIT_OR(1<<day)) AS days FROM t1  
GROUP BY year, month;  
```

Kết quả trả về:

```sql
+------+-------+------+
| year | month | days |
+------+-------+------+
| 2000 | 1     | 3    |
| 2000 | 2     | 2    |
+------+-------+------+
```

Câu truy vấn tính số ngày khác nhau xuất hiện trong bảng cho mỗi kết hợp năm/tháng, tự động loại bỏ các mục trùng lặp.

---

### 7.9 Sử Dụng AUTO_INCREMENT

Thuộc tính **AUTO_INCREMENT** có thể được sử dụng để tạo một định danh duy nhất cho các hàng mới:

```sql
CREATE TABLE animals (  
 id MEDIUMINT NOT NULL AUTO_INCREMENT,  
 name CHAR(30) NOT NULL,  
 PRIMARY KEY (id)  
);  

INSERT INTO animals (name) VALUES  
 ('dog'),('cat'),('penguin'),  
 ('lax'),('whale'),('ostrich');  
```

Kết quả trả về:

```sql
+----+---------+  
| id | name    |  
+----+---------+  
| 1  | dog     |  
| 2  | cat     |  
| 3  | penguin |  
| 4  | lax     |  
| 5  | whale   |  
| 6  | ostrich |  
+----+---------+  
```

Không có giá trị nào được chỉ định cho cột **AUTO_INCREMENT**, vì vậy MySQL tự động gán các số theo chuỗi. Bạn cũng có thể chỉ định rõ giá trị 0 cho cột để tạo các số chuỗi, trừ khi chế độ SQL **NO_AUTO_VALUE_ON_ZERO** được bật.

Ví dụ:

```sql
INSERT INTO animals (id, name) VALUES(0,'groundhog');
```

Nếu cột được khai báo **NOT NULL**, cũng có thể chỉ định NULL cho cột để tạo các số chuỗi.

Ví dụ:

```sql
INSERT INTO animals (id, name) VALUES(NULL,'squirrel');
```

Khi bạn chèn bất kỳ giá trị nào khác vào cột **AUTO_INCREMENT**, cột sẽ được đặt thành giá trị đó và chuỗi số sẽ được đặt lại để giá trị tự động tiếp theo tiếp tục theo chuỗi từ giá trị cột lớn nhất. Ví dụ:

```sql
INSERT INTO animals (id,name) VALUES(100,'rabbit');
INSERT INTO animals (id,name) VALUES(NULL,'mouse');
```

Kết quả trả về:

```sql
+-----+-----------+  
| id  | name      |  
+-----+-----------+  
| 1   | dog       |  
| 2   | cat       |  
| 3   | penguin   |  
| 4   | lax       |  
| 5   | whale     |  
| 6   | ostrich   |  
| 7   | groundhog |  
| 8   | squirrel  |  
| 100 | rabbit    |  
| 101 | mouse     |  
+-----+-----------+  
```

**Ghi chú InnoDB**:  
Cập nhật giá trị cột **AUTO_INCREMENT** trong bảng InnoDB sẽ không làm reset chuỗi **AUTO_INCREMENT** như đối với bảng MyISAM và NDB.

Bạn có thể lấy giá trị **AUTO_INCREMENT** tự động mới nhất với hàm SQL **LAST_INSERT_ID()** hoặc hàm C API **mysql_insert_id()**. Những hàm này chỉ áp dụng cho kết nối hiện tại, vì vậy giá trị trả về của chúng không bị ảnh hưởng bởi kết nối khác cũng đang thực hiện thao tác chèn.  

Sử dụng kiểu dữ liệu nguyên thủy nhỏ nhất cho cột **AUTO_INCREMENT** sao cho đủ lớn để chứa giá trị chuỗi lớn nhất mà bạn cần. Khi cột đạt giới hạn trên của kiểu dữ liệu, lần thử tiếp theo để tạo số chuỗi sẽ thất bại. Hãy sử dụng thuộc tính **UNSIGNED** nếu có thể để cho phép phạm vi lớn hơn.

Chẳng hạn, nếu bạn sử dụng **TINYINT**, giá trị chuỗi lớn nhất có thể là 127. Còn với **TINYINT UNSIGNED**, giá trị tối đa là 255.



**Chapter 8: Using MySQL with Apache**

There are programs that allow you to authenticate users from a MySQL database and also write your log files into a MySQL table.

To change the Apache logging format to a structure that is easily readable by MySQL, you can add the following configuration to the Apache configuration file:

```apache
LogFormat \
 "\"%h\",%{%Y%m%d%H%M%S}t,%>s,\"%b\",\"%{Content-Type}o\", \
 \"%U\",\"%{Referer}i\",\"%{User-Agent}i\""
```

To load a log file in this format into MySQL, you can use a statement like the following:

```sql
LOAD DATA INFILE '/local/access_log' INTO TABLE tbl_name
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' ESCAPED BY '\\'
```

The table (`tbl_name`) should be created with columns that correspond to the values written by the `LogFormat` line in the log file.
