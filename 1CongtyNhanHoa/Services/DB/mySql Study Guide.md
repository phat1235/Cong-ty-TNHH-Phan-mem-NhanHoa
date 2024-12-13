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
