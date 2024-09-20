###

**Cài đặt Rocky Linux: Hướng dẫn chi tiết**

CentOS 8 sẽ chính thức hết hạn vào cuối năm 2021, và nhiều người dùng đang tìm kiếm những giải pháp thay thế phù hợp. Một trong những lựa chọn nổi bật là **Rocky Linux** – một phiên bản nhánh từ CentOS và tương thích hoàn toàn với Red Hat Enterprise Linux (RHEL) về mặt nhị phân. Trong bài viết này, chúng ta sẽ khám phá cách cài đặt **Rocky Linux 8.4** một cách chi tiết nhất.

### Điều kiện tiên quyết

Trước khi bắt đầu quá trình cài đặt, hãy đảm bảo bạn có đầy đủ các yếu tố sau:

- **Hình ảnh ISO của Rocky Linux 8.4**: Bạn có thể tải về từ trang web chính thức. Lưu ý rằng bản DVD ISO có dung lượng khá lớn, khoảng 9GB, vì vậy cần một đường truyền internet nhanh và ổn định. Ngoài ra, bạn cũng có thể chọn bản **ISO tối thiểu** với dung lượng khoảng 2GB.
- **Ổ USB 16GB**: Sử dụng làm phương tiện cài đặt. Bạn có thể tạo một ổ USB khởi động từ file ISO bằng các công cụ như **UNetbootin** hoặc lệnh **dd**.
- **Ổ cứng trống ít nhất 15GB** và **RAM 2GB**.
### rockey
#### 1. Khởi động PC

Cắm ổ USB có khả năng khởi động vào máy tính của bạn và khởi động lại PC. Đảm bảo rằng BIOS đã được cấu hình để khởi động từ ổ USB. Sau khi khởi động, bạn sẽ thấy một màn hình đen với các tùy chọn, chọn **Install Rocky Linux 8** và nhấn **ENTER**.

![](https://img001.prntscr.com/file/img001/5dYR9ReJTW26Btk_TA99Cg.png)

![](https://img001.prntscr.com/file/img001/XV5EfmfIR8yex1bMyZW1Hg.png)
#### 2. Chọn ngôn ngữ cài đặt

Trình cài đặt **Anaconda** sẽ được khởi động, trên màn hình **Chào mừng**, hãy chọn ngôn ngữ bạn muốn sử dụng trong quá trình cài đặt và nhấn **Continue**.

![](https://img001.prntscr.com/file/img001/7UiWY2tsRn-RpgyGqGZUag.png)
#### 3. Tóm tắt cài đặt – Cấu hình các thông số chính

Trước khi tiếp tục, bạn cần thiết lập một số tùy chọn quan trọng được chia thành các nhóm:

- **Bản địa hóa**: Thiết lập bàn phím, ngôn ngữ hệ điều hành, thời gian và múi giờ.
- **Phần mềm**: Chọn nguồn cài đặt và phần mềm.
- **Hệ thống**: Thiết lập phân vùng ổ đĩa, cấu hình mạng và tên máy chủ.
- **Cài đặt người dùng**: Thiết lập mật khẩu root và tạo người dùng mới.
![](https://img001.prntscr.com/file/img001/j-67PxmnQaaAlyIiJOS1IA.png)
#### 4. Định cấu hình phân vùng đích cài đặt

Phần này sẽ quyết định cách bạn phân vùng ổ cứng. Nếu bạn mới sử dụng Linux, có thể chọn **Automatic Partitioning**. Tuy nhiên, nếu muốn tùy chỉnh phân vùng, chọn **Custom** và tạo các phân vùng cần thiết như:

- **/boot**: 1GB
- **/** (root): ...GB
- **Swap**: 8GB
![](https://img001.prntscr.com/file/img001/cDAKEXq0RIavWoZKJSac6w.png)

![](https://img001.prntscr.com/file/img001/YU-I1xL7QSyJUPT-S4FEtw.png)

![](https://img001.prntscr.com/file/img001/U-9Zdn9IQc-fpHaDW7DaTA.png)
### Ta lựa chọn timezone
![](https://img001.prntscr.com/file/img001/ZnsXePWSTCWbjIv2IJYUpw.png)
### Lựa chọn các tool cần cài đặt
![](https://img001.prntscr.com/file/img001/aaUtvQIfRh2vnntrXyprjw.png)
#### 5. Định cấu hình mạng và tên máy chủ

Trong mục **Network & Hostname**, bật kết nối mạng bằng cách chuyển nút **Ethernet** sang trạng thái **On**. Đặt tên máy chủ cho hệ thống và nhấn **Apply** để lưu.
![](https://img001.prntscr.com/file/img001/IJ6CjwRgQoudwapqUVXmgA.png)
#### 6. Thiết lập mật khẩu root và tạo người dùng mới

Cung cấp một **mật khẩu root mạnh** và sau đó tiến hành tạo một người dùng thông thường với tên đăng nhập và mật khẩu bảo mật.
![](https://img001.prntscr.com/file/img001/TLdx4V55TZ-4jzpEQU6VLQ.png)
### Thiết lập user
![](https://img001.prntscr.com/file/img001/JXe32udlRy-Lz0x_YloBcg.png)
![](https://img001.prntscr.com/file/img001/IpsEjC8_Q9m-2Qkzwz6SdA.png)
![](https://img001.prntscr.com/file/img001/6NCryOBpTruOjlrm9NzzVA.png)
