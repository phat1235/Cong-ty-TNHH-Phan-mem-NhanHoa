Dưới đây là các lệnh thao tác trên tệp và thư mục :

- **ls**: Liệt kê tệp và thư mục.
  - `-l`: Hiển thị chi tiết tệp, bao gồm quyền truy cập, số liên kết, chủ sở hữu, nhóm, kích thước, ngày giờ sửa đổi và tên tệp.
  - `-a`: Hiển thị tất cả tệp, kể cả tệp ẩn (bắt đầu bằng dấu chấm `.`).
  - `-h`: Hiển thị kích thước tệp ở định dạng dễ đọc (KB, MB).
  - `-R`: Hiển thị tệp và thư mục trong cấu trúc đệ quy.
  - `-S`: Sắp xếp tệp theo kích thước (lớn nhất đến nhỏ nhất).
  - Ví dụ:
    - `ls -l`: Liệt kê các tệp và thư mục với thông tin chi tiết.
    - `ls -a`: Hiển thị tất cả các tệp và thư mục, kể cả tệp ẩn.
    - `ls -lh`: Hiển thị kích thước tệp ở định dạng dễ đọc.
    - `ls -R`: Liệt kê tất cả tệp và thư mục theo cấu trúc đệ quy.
![](https://img001.prntscr.com/file/img001/VKGk9CNRRUK6OS7W7dc9ug.png)
- **cd**: Chuyển đổi thư mục.
  - `cd -`: Quay lại thư mục trước đó.
  - `cd ~`: Chuyển về thư mục chính của người dùng (home directory).
  - `cd ..`: Di chuyển lên một cấp thư mục.
  - Ví dụ: 
    - `cd /path/to/directory`: Chuyển đến thư mục chỉ định.
    - `cd -`: Quay lại thư mục trước.
![](https://img001.prntscr.com/file/img001/Ua9hp8vFSEu8JHdWcfLX8Q.png)
- **pwd**: Hiển thị thư mục hiện tại.
  - `-L`: Hiển thị đường dẫn logic (theo cấu trúc thư mục hiện tại).
  - `-P`: Hiển thị đường dẫn vật lý (bỏ qua các liên kết tượng trưng).
  - Ví dụ:
    - `pwd`: Hiển thị đường dẫn thư mục hiện tại.
    - `pwd -P`: Hiển thị đường dẫn vật lý.

- **mkdir**: Tạo thư mục mới.
  - `-p`: Tạo thư mục cha nếu chưa tồn tại.
  - `-m`: Thiết lập quyền truy cập cụ thể cho thư mục.
  - Ví dụ:
    - `mkdir my_directory`: Tạo thư mục tên “my_directory”.
    - `mkdir -p /path/to/new_directory`: Tạo một thư mục cùng các thư mục cha (nếu chưa tồn tại).
    - `mkdir -m 755 secure_directory`: Tạo thư mục và thiết lập quyền 755.
![](https://img001.prntscr.com/file/img001/uqAIX_CgStCJHgQQuPF-Ug.png)
- **rm**: Xóa tệp và thư mục.
  - `-r`: Xóa thư mục và toàn bộ nội dung bên trong (xóa đệ quy).
  - `-f`: Xóa không cần xác nhận, thường được dùng khi xóa tệp không có quyền ghi.
  - `-i`: Yêu cầu xác nhận trước khi xóa từng tệp.
  - Ví dụ:
    - `rm file.txt`: Xóa tệp “file.txt”.
    - `rm -r my_directory`: Xóa thư mục “my_directory” và toàn bộ nội dung.
    - `rm -f file.txt`: Xóa tệp “file.txt” mà không yêu cầu xác nhận.
    - `rm -ri my_directory`: Xóa thư mục và nội dung sau khi xác nhận từng bước.
![](https://img001.prntscr.com/file/img001/2_AIngZDTUqTIA6-O0Z8Pg.png)
- **cp**: Sao chép tệp và thư mục.
  - `-r`: Sao chép thư mục và toàn bộ nội dung bên trong (sao chép đệ quy).
  - `-u`: Sao chép chỉ khi tệp nguồn mới hơn tệp đích hoặc tệp đích không tồn tại.
  - `-i`: Yêu cầu xác nhận trước khi ghi đè tệp đích.
  - Ví dụ:
    - `cp file.txt /destination`: Sao chép tệp đến thư mục đích.
    - `cp -r /source_directory /destination`: Sao chép thư mục cùng các nội dung.
    - `cp -u file.txt /destination`: Chỉ sao chép nếu tệp nguồn mới hơn tệp đích.
![](https://img001.prntscr.com/file/img001/nm8QK-iqT7mIXyVf9u1vKg.png)
- **mv**: Di chuyển hoặc đổi tên tệp và thư mục.
  - `-i`: Yêu cầu xác nhận trước khi ghi đè tệp đích.
  - `-u`: Chỉ di chuyển nếu tệp nguồn mới hơn tệp đích hoặc tệp đích không tồn tại.
  - Ví dụ:
    - `mv file.txt new_name.txt`: Đổi tên “file.txt” thành “new_name.txt”.
    - `mv -i file.txt /destination`: Di chuyển tệp và yêu cầu xác nhận nếu tệp đích tồn tại.

- **touch**: Tạo tệp trống hoặc cập nhật thời gian sửa đổi của tệp.
  - `-a`: Chỉ cập nhật thời gian truy cập mà không thay đổi thời gian sửa đổi.
  - `-m`: Chỉ cập nhật thời gian sửa đổi mà không thay đổi thời gian truy cập.
  - `-t`: Thiết lập thời gian truy cập và sửa đổi cụ thể (theo định dạng `[[CC]YY]MMDDhhmm[.ss]`).
  - Ví dụ:
    - `touch file.txt`: Tạo tệp trống tên “file.txt” hoặc cập nhật thời gian.
    - `touch -a file.txt`: Chỉ cập nhật thời gian truy cập của tệp.
    - `touch -t 202310101230 file.txt`: Cập nhật thời gian truy cập và sửa đổi thành 12:30 ngày 10/10/2023.
![](https://img001.prntscr.com/file/img001/22zqGhviSMGl485ub7Cdog.png)
- **cat**: Hiển thị nội dung của tệp.
  - `-n`: Hiển thị số dòng.
  - `-b`: Hiển thị số dòng cho các dòng không trống.
  - Ví dụ:
    - `cat file.txt`: Hiển thị nội dung tệp “file.txt”.
    - `cat -n file.txt`: Hiển thị nội dung với số dòng.

- **head**: Hiển thị một số dòng đầu của tệp.
  - `-n`: Chỉ định số dòng cần hiển thị.
  - Ví dụ:
    - `head file.txt`: Hiển thị 10 dòng đầu.
    - `head -n 5 file.txt`: Hiển thị 5 dòng đầu.

- **tail**: Hiển thị một số dòng cuối của tệp.
  - `-n`: Chỉ định số dòng cần hiển thị.
  - `-f`: Theo dõi tệp trong thời gian thực (hữu ích khi xem log).
  - Ví dụ:
    - `tail file.txt`: Hiển thị 10 dòng cuối.
    - `tail -f /var/log/syslog`: Theo dõi log hệ thống theo thời gian thực.

- **find**: Tìm kiếm tệp và thư mục.
  - `-name`: Tìm kiếm theo tên tệp.
  - `-type`: Tìm kiếm theo loại tệp (`f` cho file, `d` cho directory).
  - `-size`: Tìm tệp theo kích thước.
![](https://img001.prntscr.com/file/img001/Q_hnoZEXS6C97_25frY6sg.png)
  - Ví dụ:
    - `find /path/to/search -name "*.txt"`: Tìm tất cả tệp có phần mở rộng “.txt” trong thư mục chỉ định.
    - `find / -type d -name "test"`: Tìm tất cả thư mục có tên “test” trên toàn hệ thống.
    - `find /path/to/search -size +500k`: Tìm các tệp lớn hơn 500KB.
