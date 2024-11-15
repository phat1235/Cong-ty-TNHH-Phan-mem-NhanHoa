| **Lệnh** | **Mô tả** | **Các Tùy Chọn** | **Ví Dụ** |
|----------|-----------|------------------|-----------|
| **tar**  | Tạo hoặc giải nén các tệp lưu trữ. | - `-c`: Tạo tệp lưu trữ mới.<br> - `-x`: Giải nén tệp từ lưu trữ.<br> - `-f`: Chỉ định tên tệp lưu trữ.<br> - `-v`: Hiển thị chi tiết khi thực hiện lệnh.<br> - `-z`: Nén lưu trữ bằng gzip.<br> - `-j`: Nén lưu trữ bằng bzip2.<br> - `-t`: Liệt kê nội dung lưu trữ.<br> - `--exclude`: Loại bỏ các tệp nhất định khi lưu trữ. | `tar -czvf archive.tar.gz files/` tạo tệp lưu trữ nén tên “archive.tar.gz” chứa các tệp trong thư mục “files/”. |
