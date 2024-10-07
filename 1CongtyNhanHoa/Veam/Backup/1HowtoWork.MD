### Cách Veeam Backup & Replication Thực Hiện Sao Lưu

Veeam Backup & Replication thực hiện việc sao lưu máy ảo (VM) theo các bước sau:

1. **Khởi động phiên làm việc sao lưu**: Khi một phiên công việc sao lưu mới bắt đầu, Veeam Backup Manager trên máy chủ sao lưu sẽ được khởi động. Nó đọc cài đặt công việc từ cơ sở dữ liệu cấu hình và tạo danh sách các tác vụ VM để xử lý. Mỗi đĩa của các VM được thêm vào công việc sẽ tạo một tác vụ mới.

2. **Kết nối với Dịch vụ Sao lưu**: Veeam Backup Manager kết nối với Veeam Backup Service, bao gồm thành phần quản lý tài nguyên. Trình lập lịch tài nguyên kiểm tra tài nguyên có sẵn trong hạ tầng sao lưu và phân công các proxy sao lưu và kho lưu trữ sao lưu để xử lý các tác vụ.

3. **Kết nối với Dịch vụ Vận chuyển**: Veeam Backup Manager kết nối với Veeam Transport Services trên kho lưu trữ và proxy sao lưu. Dịch vụ Vận chuyển bắt đầu Veeam Data Movers, một thể hiện mới của Data Mover sẽ được khởi động cho mỗi tác vụ mà proxy sao lưu đang xử lý.

4. **Thiết lập quy tắc truyền tải dữ liệu**: Veeam Backup Manager thiết lập kết nối với Veeam Data Movers trên kho lưu trữ và proxy sao lưu, cũng như đặt ra các quy tắc cho việc truyền dữ liệu, như quy tắc kiểm soát lưu lượng mạng.

5. **Thiết lập kết nối giữa Data Movers**: Veeam Data Movers trên proxy sao lưu và kho lưu trữ thiết lập kết nối với nhau để truyền dữ liệu.

6. **Truy vấn thông tin VM**: Veeam Backup Manager truy vấn thông tin về các VM và máy chủ ảo hóa từ Veeam Broker Service.

7. **Xử lý hình ảnh có nhận thức ứng dụng**: Nếu xử lý hình ảnh có nhận thức ứng dụng được bật cho công việc, Veeam Backup & Replication kết nối với hệ điều hành khách VM, triển khai các tiến trình runtime và thực hiện các tác vụ xử lý trong hệ điều hành khách.

8. **Tạo snapshot cho VM**: Veeam Backup & Replication yêu cầu vCenter Server hoặc máy chủ ESXi tạo một snapshot cho VM. Các đĩa VM sẽ được đặt ở trạng thái chỉ đọc, và mỗi đĩa ảo sẽ nhận được một tệp delta. Tất cả các thay đổi mà người dùng thực hiện trên VM trong quá trình sao lưu sẽ được ghi vào các tệp delta.

9. **Đọc dữ liệu VM và truyền tải**: Veeam Data Mover nguồn đọc dữ liệu VM từ đĩa VM chỉ đọc và truyền dữ liệu đến kho lưu trữ sao lưu theo một trong các chế độ vận chuyển. Trong các phiên công việc gia tăng, Veeam Data Mover nguồn sử dụng Change Block Tracking (CBT) để lấy chỉ các khối dữ liệu đã thay đổi kể từ phiên công việc trước. Nếu CBT không khả dụng, Veeam Data Mover nguồn tương tác với Veeam Data Mover đích trên kho lưu trữ để nhận thông tin sao lưu và sử dụng thông tin này để phát hiện các khối đã thay đổi.

10. **Xác nhận snapshot**: Sau khi proxy sao lưu hoàn thành việc đọc dữ liệu VM, Veeam Backup & Replication yêu cầu vCenter Server hoặc máy chủ ESXi cam kết snapshot của VM.

### Lưu ý
- Quá trình sao lưu này được tối ưu hóa để giảm thiểu tải lên hạ tầng ảo hóa và đảm bảo sao lưu nhanh chóng và hiệu quả.

