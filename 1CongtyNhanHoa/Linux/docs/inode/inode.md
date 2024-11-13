Trong hệ thống file của Linux, **inode** (index node) là một cấu trúc dữ liệu chứa thông tin về một tệp hoặc thư mục, ngoại trừ tên và dữ liệu thực tế của tệp. Mỗi inode lưu trữ các chi tiết quan trọng như:

- **Quyền truy cập:** Quyền đọc, ghi, và thực thi
- **Chủ sở hữu:** ID người dùng và nhóm
- **Kích thước tệp**
- **Dấu thời gian:** Thời gian truy cập, sửa đổi và thay đổi inode
- **Số liên kết:** Số lượng đường dẫn tham chiếu đến inode đó
- **Vị trí dữ liệu trên đĩa**

Khi một tệp được tạo, hệ thống sẽ tạo ra một inode để lưu các thông tin này và gán một số inode duy nhất.

### Các thao tác có thể làm với inode:

1. **Kiểm tra số inode của một tệp hoặc thư mục:** Dùng lệnh `ls -i` để xem số inode.
   ```bash
   ls -i /đường_dẫn_đến_tệp
   ```

2. **Xem thông tin inode chi tiết:** Dùng lệnh `stat` để hiển thị chi tiết của inode.
   ```bash
   stat /đường_dẫn_đến_tệp
   ```
![](https://img001.prntscr.com/file/img001/b3pLxCpERW299jgMO1bpEA.png)
Trong kết quả này:

1. **Inode:** Dòng `ls -i /etc/passwd` hiển thị inode của tệp `/etc/passwd` là **1967784**. Inode này là một con số duy nhất trong hệ thống, đại diện cho cấu trúc dữ liệu lưu trữ thông tin về tệp.

2. **stat /etc/passwd:** Lệnh `stat` cung cấp thông tin chi tiết về tệp.

   - **File:** Đây là tên của tệp, `/etc/passwd`.
   - **Size:** Kích thước của tệp là **2073** bytes.
   - **Blocks:** Tệp này chiếm **8 blocks** trên đĩa.
   - **IO Block:** Đơn vị đọc/ghi là **4096 bytes** (kích thước khối IO).
   - **Device:** Cho biết thiết bị lưu trữ của tệp với định danh **8,4**.
   - **Inode:** Số inode là **1967784**.
   - **Links:** Số lượng hard link đến tệp này là **1** (chỉ có một đường dẫn duy nhất trỏ đến inode này).
   - **Access:** Quyền truy cập của tệp là `0644` (chủ sở hữu có quyền đọc/ghi, các nhóm khác chỉ có quyền đọc).
   - **Uid/Gid:** ID của chủ sở hữu và nhóm sở hữu là **root** (Uid 0 và Gid 0).
   - **Timestamps:**
     - **Access:** Thời gian truy cập gần nhất (2024-11-13 02:56:22 UTC).
     - **Modify:** Thời gian sửa đổi nội dung lần gần nhất.
     - **Change:** Thời gian thay đổi inode (quyền, chủ sở hữu, kích thước, v.v.).
     - **Birth:** Thời gian tạo tệp, không phải hệ thống nào cũng hỗ trợ trường này
3. **Xóa tệp sử dụng inode:** Trong một số trường hợp, có thể xóa tệp qua số inode bằng lệnh `find`.
   ```bash
   find / -inum [inode_số] -delete
   ```
![](https://img001.prntscr.com/file/img001/2TeNQHPHTUqh0Erch6s6Pg.png)
4. **Tạo hard link:** Hard link là một tham chiếu bổ sung đến cùng một inode. Dùng lệnh `ln`.
   ```bash
   ln /đường_dẫn_đến_tệp /đường_dẫn_mới
   ```

5. **Kiểm tra giới hạn inodes:** Xem số lượng inodes còn lại và đã sử dụng trong hệ thống bằng lệnh `df -i`.
   ```bash
   df -i
   ```

Inode đóng vai trò quan trọng trong việc quản lý tệp và thư mục trên hệ thống Linux. Khi hệ thống hết inodes, dù có không gian lưu trữ vẫn có thể xảy ra lỗi không thể tạo tệp mới.



![](https://img001.prntscr.com/file/img001/1vs9AFWNRBSidh6uR7ndNw.png)

Liệu khi xóa một file thì dữ liệu tương ứng có mất đi?

Khi ta xóa file, thực chất là xóa liên kết từ file đến inode. Một inode có thể được liên kết với nhiều file, liên kết này được gọi là hard link.

Khi có nhu cầu chia sẻ một file dữ liệu cho nhiều người dùng, nhiều dịch vụ, thay vì copy dữ liệu, ta có thể tạo ra các hard link cùng trỏ tới một inode để tiết kiệm dung lượng.
