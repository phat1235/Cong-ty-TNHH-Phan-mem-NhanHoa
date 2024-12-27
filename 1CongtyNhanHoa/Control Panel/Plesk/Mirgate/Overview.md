# Giới thiệu

Hướng dẫn này mô tả cách chuyển nội dung được lưu trữ sang Plesk Obsidian bằng Plesk Migrator. Hướng dẫn này dành cho các quản trị viên lưu trữ thực hiện di chuyển sang các máy chủ được quản lý qua Plesk.

## Nền tảng lưu trữ nguồn được hỗ trợ

Plesk Migrator hỗ trợ di chuyển từ các nền tảng nguồn sau:

- Các phiên bản cụ thể của Plesk cho Linux và Plesk cho Windows: 8.6, 9.5, 10.4, 11.0, 11.5, 12.0, 12.5, 17.0, 17.5, 17.8.
- cPanel 11.5
- Confixx 3.3
- Mũ bảo hiểm 3.2
- Plesk Mở rộng 2.3.2
- Bảng điều khiển Parallels Pro cho Linux 10.3.6
- DirectAdmin 1.51 (khi di chuyển từ DirectAdmin được cài đặt trên Ubuntu 10.x, chỉ hỗ trợ di chuyển tùy chỉnh)

## Dữ liệu nào được chuyển giao

Plesk Migrator chuyển các gói dịch vụ, đăng ký với tất cả các tên miền liên quan và các trang web có nội dung (như tệp, thư, cơ sở dữ liệu, v.v.). Các tài khoản đại lý và khách hàng không có bất kỳ tên miền nào sẽ không được chuyển. Các thiết lập của dịch vụ Plesk, chẳng hạn như trình xử lý PHP đã cài đặt, thiết lập Fail2Ban, thiết lập ModSecurity, thiết lập tường lửa, v.v. sẽ không được chuyển.

**Ghi chú**:

- Bạn không thể chọn di chuyển từng tên miền riêng lẻ. Chỉ có thể chọn từng đăng ký riêng lẻ để di chuyển và chúng được di chuyển cùng với tất cả các tên miền liên quan.

## Cài đặt và điều kiện tiên quyết

Trước khi bắt đầu di chuyển, hãy đảm bảo rằng máy chủ nguồn hoặc các máy chủ có thể truy cập qua mạng và cài đặt thành phần Plesk Migrator trên máy chủ Plesk đích.

### Cài đặt Plesk Migrator

**Để cài đặt Plesk Migrator bằng giao diện Plesk**:

1. Đăng nhập vào Plesk trên máy chủ đích.
2. Cài đặt tiện ích mở rộng Plesk Migrator miễn phí.

**Để cài đặt Plesk Migrator bằng dòng lệnh**:

1. Đăng nhập vào máy chủ đích thông qua SSH với tư cách là root (Linux) hoặc thông qua RDP với tư cách là administrator (Windows).
2. Chạy trình cài đặt Plesk như sau:
   - (Linux) Chạy lệnh `plesk installer`
   - (Windows) Mở dấu nhắc lệnh và chạy lệnh `"%plesk_bin%\ai.exe" --console`
3. Thực hiện theo trình hướng dẫn cài đặt theo hướng dẫn trên màn hình cho đến khi đến giai đoạn chọn thành phần.
4. Đánh dấu thành phần “Plesk Migrator” để cài đặt và hoàn tất quy trình theo hướng dẫn trên màn hình.

### Điều kiện tiên quyết di chuyển

Để đảm bảo quá trình di chuyển thành công, một số cổng TCP và UDP cần được mở trên máy chủ nguồn và máy chủ đích.

**Đối với máy chủ Unix**:

- Cổng TCP 22 dành cho kết nối SSH trên máy chủ nguồn.
- Cổng TCP 8443 để truy cập Plesk XML API trên máy chủ đích và trên máy chủ nguồn nếu di chuyển từ Plesk.
- Cổng TCP 110, 143 cho POP3 và IMAP, trên máy chủ nguồn và đích. Chúng được sử dụng để kiểm tra sau khi di chuyển.

**Đối với máy chủ Windows**:

- Cổng TCP 135, 139, 445 và cổng UDP 137, 138. Hãy đảm bảo mở các cổng này trên máy chủ nguồn và máy chủ đích.
- Cổng TCP 1433 dành cho Microsoft SQL Server, nếu cổng này được sử dụng làm phiên bản mặc định.
- Cổng UDP 1434 và tất cả các cổng TCP (hoặc được chọn thủ công) cho Microsoft SQL Server, nếu được sử dụng làm phiên bản được đặt tên.
- Cổng TCP 10155 dành cho dịch vụ Plesk Migrator tùy chỉnh thực hiện nhiều tác vụ khác nhau.
- Cổng TCP 10156 cho máy chủ rsync.
- Cổng TCP 8443 để truy cập Plesk XML API trên máy chủ đích và trên máy chủ nguồn nếu di chuyển từ Plesk.
- Cổng TCP 110, 143 cho POP3 và IMAP, trên máy chủ nguồn và đích. Chúng được sử dụng để kiểm tra sau khi di chuyển.

Ngoài ra, hãy đảm bảo rằng https://autoinstall.plesk.com có ​​thể truy cập được từ máy chủ đích.

Chúng tôi khuyên bạn nên cài đặt và cấu hình tất cả các dịch vụ và thiết lập cần thiết trên máy chủ đích trước khi thực hiện chuyển giao. Ví dụ, nếu bạn có kế hoạch di chuyển cơ sở dữ liệu MySQL/MariaDB, hãy đảm bảo rằng máy chủ MySQL/MariaDB được cài đặt và chạy trên máy chủ đích, v.v.

Đảm bảo Plesk trên máy chủ đích có giấy phép riêng. Nếu không, bạn có thể gặp sự cố với xác thực giấy phép trong quá trình di chuyển.

## Di chuyển từ nền tảng lưu trữ được hỗ trợ

Plesk Migrator cho phép bạn di chuyển cấu hình và dữ liệu lưu trữ từ một máy chủ khác với một trong những nền tảng lưu trữ được hỗ trợ đã được cài đặt. Các thiết lập, đối tượng và dữ liệu sau đây sẽ được di chuyển:

- **Tài khoản đại lý và khách hàng**, cùng với các gói thuê bao của họ sẽ được tạo trên máy chủ đích, cùng với tất cả các tên miền, tên miền bổ sung, tên miền con và bí danh tên miền. Tất cả các thiết lập tương ứng cũng sẽ được di chuyển.
- **Nội dung được lưu trữ**, chẳng hạn như cơ sở dữ liệu, thư và nội dung của các trang web cũng sẽ được di chuyển.
- Các **thiết lập Plesk toàn máy chủ** sẽ không được di chuyển.

Việc di chuyển từ máy chủ Plesk có thể được thực hiện qua giao diện Plesk hoặc qua dòng lệnh.



