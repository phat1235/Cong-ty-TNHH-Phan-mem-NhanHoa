**Cú pháp lệnh Tar**

Cú pháp chung của lệnh `tar` là:

```bash
tar <chế độ hoạt động> <tùy chọn(s)> <lưu trữ> <tệp(s) hoặc vị trí(s)>
```

- **Chế độ hoạt động** xác định thao tác nào sẽ thực hiện trên các tệp (tạo, giải nén, v.v.). Lệnh yêu cầu chỉ một thao tác.
- **Tùy chọn** điều chỉnh chế độ hoạt động và không bắt buộc. Không giới hạn số lượng tùy chọn.
- **Lưu trữ** là tên và phần mở rộng của tệp.
- **Tệp** là danh sách các tệp hoặc vị trí được phân tách bằng dấu cách hoặc tên phù hợp với ký tự đại diện.

Có ba kiểu cú pháp cho các thao tác và tùy chọn:

1. **Cách cổ điển**, gộp tất cả mà không có dấu gạch ngang:
   ```bash
   tar cfv <lưu trữ> <tệp(s) hoặc vị trí(s)>
   ```

2. **Kiểu tùy chọn ngắn của UNIX**, sử dụng một dấu gạch ngang và các tùy chọn được gộp lại:
   ```bash
   tar -cfv <lưu trữ> <tệp(s) hoặc vị trí(s)>
   ```
   Hoặc một dấu gạch ngang trước mỗi tùy chọn:
   ```bash
   tar -c -f -v <lưu trữ> <tệp(s) hoặc vị trí(s)>
   ```

3. **Kiểu tùy chọn dài của GNU**, sử dụng dấu gạch ngang đôi và tên tùy chọn mô tả:
   ```bash
   tar --create --file <lưu trữ> --verbose <tệp(s) hoặc vị trí(s)>
   ```

Cả ba kiểu này đều có thể sử dụng trong một lệnh `tar`.

**Các tùy chọn lệnh Tar**

Bảng sau mô tả các tùy chọn và thao tác phổ biến của lệnh `tar`:

| Lệnh | Vai trò | Mô tả |
|------|---------|-------|
| `--create` hoặc `-c` | Thao tác | Tạo một lưu trữ mới. |
| `--list` hoặc `-t` | Thao tác | Liệt kê nội dung của lưu trữ. |
| `--extract` hoặc `-x` | Thao tác | Giải nén một hoặc nhiều tệp từ lưu trữ. |
| `--append` hoặc `-r` | Thao tác | Thêm tệp vào một lưu trữ đã tồn tại. |
| `--concatenate` hoặc `-A` | Thao tác | Nối các lưu trữ vào một lưu trữ đã tồn tại. |
| `--compare` hoặc `--diff` hoặc `-d` | Thao tác | So sánh các thành phần của lưu trữ với các tệp trên hệ thống. |
| `--delete` | Thao tác | Xóa một thành phần khỏi lưu trữ. |
| `--update` hoặc `-u` | Thao tác | Cập nhật lưu trữ với các tệp mới chỉ khi chúng chưa có trong lưu trữ và mới hơn các tệp hiện có. |
| `--file=<lưu trữ>` hoặc `-f` | Tùy chọn | Xác định tệp lưu trữ. |
| `-C` | Tùy chọn | Thay đổi thư mục. |
| `--verbose` hoặc `-v` | Tùy chọn | Hiển thị tệp mà `tar` đang xử lý trong khi chạy. |
| `--wildcard` | Tùy chọn | Cung cấp tùy chọn tìm kiếm với ký tự đại diện. |
| `--bzip2` hoặc `-j` | Tùy chọn | Đọc hoặc ghi các lưu trữ nén với định dạng bzip2. |
| `--gzip` hoặc `-z` | Tùy chọn | Đọc hoặc ghi các lưu trữ nén với định dạng gzip. |
| `--xz` hoặc `-J` | Tùy chọn | Đọc hoặc ghi các lưu trữ nén với định dạng xz. |

**Ví dụ lệnh Tar**

1. **Tạo Lưu trữ**

   Để tạo một lưu trữ tar, sử dụng:
   ```bash
   tar cf <tên lưu trữ>.tar <tệp(s) hoặc vị trí(s)>
   ```

   Ví dụ, để lưu trữ thư mục `files`:
   ```bash
   tar cf files.tar files
   ```

2. **Tạo Lưu trữ nén tar.gz**
   
   Để tạo lưu trữ nén GNUzip (gzip), thêm tùy chọn `-z`:
   ```bash
   tar czf <tên lưu trữ>.tar.gz <tệp(s) hoặc vị trí(s)>
   ```

   Ví dụ:
   ```bash
   tar czf files.tar.gz files
   ```

3. **Tạo Lưu trữ tar.bz2**

   Để tạo lưu trữ tar.bz2, thêm tùy chọn `-j`:
   ```bash
   tar cjf <tên lưu trữ>.tar.bz2 <tệp(s) hoặc vị trí(s)>
   ```

   Ví dụ:
   ```bash
   tar cjf files.tar.bz2 files
   ```

4. **Tạo Lưu trữ tar.xz**

   Để tạo lưu trữ tar.xz, thêm tùy chọn `-J`:
   ```bash
   tar cJf <tên lưu trữ>.tar.xz <tệp(s) hoặc vị trí(s)>
   ```

   Ví dụ:
   ```bash
   tar cJf files.tar.xz files
   ```

5. **Giải nén từ Lưu trữ**

   Để giải nén từ lưu trữ tar, sử dụng:
   ```bash
   tar xf <tên lưu trữ>.tar
   ```

   Ví dụ:
   ```bash
   tar xf files.tar
   ```

6. **Giải nén từ Lưu trữ nén tar.gz**

   Để giải nén từ tar.gz, sử dụng:
   ```bash
   tar xzf <tên lưu trữ>.tar.gz
   ```

   Ví dụ:
   ```bash
   tar xzf files.tar.gz
   ```

7. **Giải nén từ Lưu trữ nén tar.bz2**

   Để giải nén từ tar.bz2, sử dụng:
   ```bash
   tar xjf <tên lưu trữ>.tar.bz2
   ```

   Ví dụ:
   ```bash
   tar xjf files.tar.bz2
   ```

8. **Giải nén từ Lưu trữ nén tar.xz**

   Để giải nén từ tar.xz, sử dụng:
   ```bash
   tar xJf <tên lưu trữ>.tar.xz
   ```

   Ví dụ:
   ```bash
   tar xJf files.tar.xz
   ```

Lệnh `tar` rất mạnh mẽ và linh hoạt trong việc làm việc với các tệp và thư mục, từ việc tạo và giải nén các lưu trữ cho đến các tùy chọn nén và thao tác nâng cao.
