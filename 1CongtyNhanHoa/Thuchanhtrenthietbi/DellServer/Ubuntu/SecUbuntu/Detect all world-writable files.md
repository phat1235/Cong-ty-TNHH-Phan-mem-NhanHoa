Lệnh `find / -type d \( -perm -g+w -or -perm -o+w \) -exec ls -adl {} \;` được sử dụng để tìm các thư mục có quyền ghi cho nhóm hoặc người dùng khác trên hệ thống. 
![](https://img001.prntscr.com/file/img001/Xxy2gNb4TRuR4osZaQws1Q.png)
### Giải thích:

1. **`find /`**:
   - **`find`**: Lệnh để tìm kiếm các tệp và thư mục.
   - **`/`**: Bắt đầu tìm kiếm từ thư mục gốc (root), tức là quét toàn bộ hệ thống tệp.

2. **`-type d`**:
   - Chỉ tìm kiếm các thư mục (`d` là viết tắt của "directory").

3. **`\(` và `\)`**:
   - Dùng để nhóm các điều kiện tìm kiếm. Dấu `\` được sử dụng để thoát ký tự đặc biệt `(` và `)`, cho phép shell nhận diện đúng nhóm.

4. **`-perm -g+w`**:
   - Tìm các thư mục có quyền ghi cho nhóm (group). Cụ thể, `-g+w` kiểm tra xem nhóm có quyền ghi hay không.

5. **`-or`**:
   - Một điều kiện logic, có nghĩa là "hoặc". Nếu điều kiện bên trái hoặc bên phải đúng, lệnh `find` sẽ tìm thấy thư mục.

6. **`-perm -o+w`**:
   - Tìm các thư mục có quyền ghi cho người dùng khác (other). Tương tự như trên, `-o+w` kiểm tra quyền ghi cho người dùng khác.

7. **`-exec ls -adl {}`**:
   - **`-exec`**: Thực thi một lệnh cho mỗi tệp hoặc thư mục tìm thấy.
   - **`ls -adl {}`**: Lệnh này sẽ hiển thị thông tin chi tiết của thư mục tìm thấy.
     - `ls`: Liệt kê các tệp và thư mục.
     - `-a`: Hiển thị tất cả các tệp, bao gồm cả các tệp ẩn.
     - `-d`: Hiển thị thông tin về thư mục mà không liệt kê nội dung bên trong.
     - `-l`: Hiển thị thông tin chi tiết, bao gồm quyền, chủ sở hữu, kích thước, thời gian sửa đổi, v.v.
   - **`{}`**: Thay thế bằng tên của các thư mục tìm thấy.
   - **`\;`**: Kết thúc lệnh `-exec`.

### =>>
Lệnh này tìm tất cả các thư mục trên hệ thống có quyền ghi cho nhóm hoặc người dùng khác và hiển thị thông tin chi tiết về chúng. Điều này hữu ích trong việc kiểm tra và quản lý quyền truy cập trên các thư mục quan trọng, giúp tăng cường bảo mật cho hệ thống.


Test thử :


Để tạo một thư mục với quyền cho tất cả mọi người (tức là quyền `777`, cho phép đọc, ghi và thực thi), bạn có thể làm theo các bước sau:

1. **Mở Terminal**.
2. **Sử dụng lệnh `mkdir` để tạo thư mục**.
3. **Sử dụng lệnh `chmod` để thiết lập quyền cho thư mục**.

Dưới đây là các lệnh cụ thể:

### Tạo thư mục
```bash
mkdir /path/to/your/directory
```
Thay thế `/path/to/your/directory` bằng đường dẫn mà bạn muốn tạo thư mục.
![](https://img001.prntscr.com/file/img001/_FFGA2KHQSmAoBWd7VX8rg.png)
### Thiết lập quyền cho thư mục
```bash
chmod 777 /path/to/your/directory
```


### Kiểm tra quyền của thư mục:
Bạn có thể kiểm tra quyền của thư mục vừa tạo bằng lệnh:

```bash
ls -l /etc
```

### Kết quả:
Bạn sẽ thấy đầu ra tương tự như sau, cho biết quyền là `drwxrwxrwx` (tức là `777`):

![](	https://img001.prntscr.com/file/img001/1FFR0DgASVi6z82iE9mlHg.png)
![](https://img001.prntscr.com/file/img001/deEFCIyRRuKuP_21ehw0XA.png)
![](https://img001.prntscr.com/file/img001/QYvMPVqhTjCDo1vbjQ1scA.png)
### Lưu ý:
Cấp quyền `777` cho phép bất kỳ ai cũng có thể đọc, ghi và thực thi tệp trong thư mục đó, vì vậy hãy cẩn thận với việc chia sẻ thông tin nhạy cảm trong thư mục này.
