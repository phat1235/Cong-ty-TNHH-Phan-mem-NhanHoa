**Giới Hạn của Loại Trừ Khối Dữ Liệu Đã Xóa**

Veeam Backup & Replication chỉ có thể loại trừ các khối dữ liệu đã xóa trên hệ điều hành khách của VM sử dụng Microsoft NTFS.

**File Swap**

Bạn có thể yêu cầu Veeam Backup & Replication loại trừ các file `pagefile.sys` và `hiberfil.sys` khỏi bản sao lưu hoặc bản sao của các VM Microsoft Windows:
- `hiberfil.sys` là file hệ thống do hệ điều hành tạo ra để hoạt động đúng chế độ ngủ đông (hibernate).
- `pagefile.sys` là file swap. Các file swap có tính chất động và có thể thay đổi nhiều giữa các phiên công việc, ngay cả khi bản thân VM không thay đổi nhiều.

Để loại trừ các file này, bạn cần bật tùy chọn "Exclude swap file blocks" trong cài đặt công việc. Veeam Backup & Replication sẽ xác định các khối dữ liệu của những file này và loại trừ chúng khỏi quá trình xử lý, giúp giảm kích thước của các bản sao lưu và bản sao gia tăng.

Khi loại trừ các file `pagefile.sys` và `hiberfil.sys`, Veeam Backup & Replication thực hiện các thao tác sau trong phiên công việc:
![](	https://img001.prntscr.com/file/img001/8WeG-AhlTliaPHbUUka2zg.png)
1. Veeam Backup & Replication truy cập file MFT trên hệ điều hành khách của VM để xác định các khối dữ liệu của `pagefile.sys` và `hiberfil.sys` và gán giá trị 0 cho chúng.
2. Veeam Backup & Replication xử lý và truyền các khối dữ liệu của ảnh VM theo cách sau:
   - Nếu một khối dữ liệu của ảnh VM chỉ chứa các khối của những file này, Veeam Backup & Replication sẽ không sao chép khối dữ liệu này đến vị trí đích.
   - Nếu một khối dữ liệu của ảnh VM chứa các khối của những file này cùng với các dữ liệu khác, Veeam Backup & Replication sẽ sao chép khối này đến vị trí đích.
![](https://img001.prntscr.com/file/img001/y89o4aUsThKRDHRXuIfBdg.png)
**Giới Hạn của Loại Trừ File Swap**

Veeam Backup & Replication chỉ có thể loại trừ các khối của file `pagefile.sys` và `hiberfil.sys` trên hệ điều hành khách của VM sử dụng Microsoft Windows NTFS.
