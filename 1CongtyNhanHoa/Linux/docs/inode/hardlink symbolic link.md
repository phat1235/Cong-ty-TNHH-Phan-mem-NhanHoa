
Trong Ubuntu (và các hệ thống Linux khác), **hard link** và **symbolic link (symlink)** là hai loại liên kết phổ biến dùng để tham chiếu đến tệp hoặc thư mục khác, mỗi loại có đặc điểm và cách sử dụng riêng.
![](https://img001.prntscr.com/file/img001/0btGDcCMQxWMuhTVOlVoRQ.png)
### 1. Hard Link
- **Cách hoạt động:** Hard link tạo một tham chiếu trực tiếp đến inode của tệp gốc, nghĩa là cả tệp gốc và hard link cùng chia sẻ một inode.
- **Đặc điểm:**
  - Nội dung của hard link và tệp gốc là hoàn toàn giống nhau vì chúng tham chiếu cùng inode.
  - Khi xóa tệp gốc, hard link vẫn hoạt động và giữ nguyên dữ liệu vì inode vẫn tồn tại cho đến khi tất cả các liên kết bị xóa.
  - Hard link chỉ có thể tạo trên cùng một phân vùng, không thể tham chiếu qua phân vùng khác.
  - Không hỗ trợ tạo hard link cho thư mục, nhằm tránh tạo ra vòng lặp trong hệ thống tệp.
  - Tên của hard link có thể khác tên tệp gốc và nằm ở thư mục khác, giúp một tệp có thể có nhiều tên nằm ở các thư mục khác nhau.
  - Khi mở đồng thời một tệp từ tệp gốc và từ hard link, mọi chỉnh sửa ở bất kỳ bản nào cũng sẽ được phản ánh trên các bản khác vì thực chất là sửa trên cùng một tệp.
  - Xóa hard link hoặc xóa tệp gốc nhưng còn hard link khác không xóa dữ liệu của tệp; tệp chỉ bị xóa khi không còn liên kết nào trỏ đến nó.
- **Cách tạo hard link:**
  ```bash
  ln /đường_dẫn_đến_tệp_gốc /đường_dẫn_mới_hard_link
  ```
  Ví dụ:
  ```bash
  ln /home/phat/tệp_gốc.txt /home/phat/hard_link.txt
  ```

### 2. Symbolic Link (Symlink)
- **Cách hoạt động:** Symbolic link là một tệp đặc biệt chứa đường dẫn đến tệp gốc, không tham chiếu trực tiếp đến inode của tệp gốc.
- **Đặc điểm:**
  - Khi truy cập symlink, hệ thống sẽ chuyển đến tệp hoặc thư mục mà nó tham chiếu.
  - Symlink có thể trỏ đến tệp hoặc thư mục nằm trên cùng hoặc khác phân vùng.
  - Nếu tệp gốc bị xóa hoặc di chuyển, symlink sẽ bị "gãy" và trở thành một liên kết chết (dead link), vì nó không thể tìm thấy đường dẫn đã tham chiếu.
  - Có thể tạo symlink cho cả tệp và thư mục.
  - Symlink không tham chiếu trực tiếp đến inode mà thông qua tên tệp gốc, vì vậy khi tệp gốc đổi tên hoặc di chuyển, symlink sẽ không còn hoạt động.
- **Cách tạo symbolic link:**
  ```bash
  ln -s /đường_dẫn_đến_tệp_gốc /đường_dẫn_mới_symlink
  ```
  Ví dụ:
  ```bash
  ln -s /home/phat/tệp_gốc.txt /home/phat/symlink.txt
  ```

### So sánh Hard link và Soft link
- **Inode:** Hard link chia sẻ cùng inode với tệp gốc, symlink có inode riêng.
- **Phân vùng:** Hard link phải nằm trong cùng một phân vùng, symlink có thể qua nhiều phân vùng.
- **Ảnh hưởng khi xóa:** Xóa tệp gốc của hard link không ảnh hưởng đến dữ liệu trong hard link. Xóa tệp gốc của symlink sẽ làm symlink trở thành liên kết chết.
- **Hạn chế với thư mục:** Hard link không tạo được với thư mục và file trên phân vùng khác, trong khi symlink có thể tạo được với cả thư mục và file trên nhiều phân vùng.
- **Dung lượng:** Cả hai loại liên kết đều không làm tăng dung lượng ổ cứng
