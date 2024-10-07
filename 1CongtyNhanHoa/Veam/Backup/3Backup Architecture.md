
### Kiến trúc Sao lưu

**Veeam Backup & Replication** sử dụng các thành phần sau cho quy trình sao lưu:
- Một hoặc nhiều máy chủ nguồn với các datastore liên quan
- Một hoặc nhiều proxy sao lưu
- Kho lưu trữ sao lưu
- [Tùy chọn] Một hoặc nhiều proxy tương tác với khách
- [Đối với kho lưu trữ sao lưu thư mục chia sẻ] Máy chủ gateway

Tất cả các thành phần hạ tầng sao lưu tham gia vào công việc tạo thành một đường ống dữ liệu. Máy chủ nguồn và kho lưu trữ sao lưu tạo ra hai điểm cuối cho dòng dữ liệu. Veeam Backup & Replication xử lý dữ liệu VM theo nhiều chu kỳ, di chuyển dữ liệu VM qua đường ống dữ liệu từng khối một.

Veeam Backup & Replication thu thập dữ liệu VM, chuyển đổi và vận chuyển nó đến đích với sự trợ giúp của Veeam Data Movers. Veeam Backup & Replication sử dụng kiến trúc hai dịch vụ — một Veeam Data Mover kiểm soát tương tác với máy chủ nguồn, và một cái khác kiểm soát tương tác với kho lưu trữ sao lưu. Các Veeam Data Movers giao tiếp với nhau và duy trì một kết nối ổn định.

Khi một phiên sao lưu mới bắt đầu, Veeam Backup & Replication thực hiện các hành động sau:
1. Veeam Backup & Replication triển khai các quy trình thời gian chạy trên hệ điều hành khách của VM thông qua proxy tương tác với khách (cho các VM Microsoft Windows) hoặc máy chủ sao lưu (cho các VM với hệ điều hành khác).
2. Veeam Data Mover ở phía đích nhận hướng dẫn công việc và giao tiếp với Veeam Data Mover ở phía nguồn để bắt đầu thu thập dữ liệu.
3. Veeam Data Mover ở phía nguồn sao chép dữ liệu VM từ lưu trữ nguồn bằng một trong các chế độ vận chuyển. Trong các phiên công việc gia tăng, Veeam Data Mover ở phía nguồn chỉ thu thập những khối dữ liệu đã thay đổi kể từ phiên công việc trước đó.
4. Trong quá trình sao chép, Veeam Data Mover ở phía nguồn thực hiện xử lý dữ liệu bổ sung. Nó lọc ra các khối dữ liệu bằng không, các khối tệp hoán đổi và các khối tệp hệ điều hành khách bị loại trừ, nén và khử trùng các khối dữ liệu VM và chuyển chúng đến Dịch vụ Data Mover ở phía đích.
5. Veeam Data Mover ở phía đích khử trùng các khối dữ liệu tương tự ở phía đích và ghi kết quả vào tệp sao lưu trên kho lưu trữ sao lưu.

### Sao lưu Tại chỗ

Để sao lưu vào kho lưu trữ sao lưu Microsoft Windows hoặc Linux trong trang địa phương, bạn cần triển khai một proxy sao lưu trên một máy có quyền truy cập vào datastore nguồn và chỉ định công việc sao lưu cho proxy sao lưu này. Trong kịch bản này, Veeam Data Mover ở phía nguồn được khởi động trên proxy sao lưu, và Veeam Data Mover ở phía đích được khởi động trên kho lưu trữ Microsoft Windows hoặc Linux. Dữ liệu VM được gửi từ proxy sao lưu đến kho lưu trữ sao lưu qua mạng LAN.
![](https://img001.prntscr.com/file/img001/TNTttUZdS3ycf9G4cTDlhg.png)
Để sao lưu vào một thư mục chia sẻ trong trang địa phương, bạn cần triển khai một máy chủ gateway có quyền truy cập vào kho lưu trữ sao lưu thư mục chia sẻ. Bạn có thể chỉ định vai trò máy chủ gateway cho chính máy chủ sao lưu hoặc bất kỳ máy Microsoft Windows nào được thêm vào hạ tầng sao lưu.

Bạn có thể sử dụng cùng một máy Microsoft Windows làm proxy sao lưu và máy chủ gateway cho SMB. Trong kịch bản này, Veeam Backup & Replication khởi động Veeam Data Movers ở cả hai phía trên cùng một máy, và gửi dữ liệu VM từ proxy sao lưu đến kho lưu trữ sao lưu thư mục chia sẻ qua mạng LAN.
![](https://img001.prntscr.com/file/img001/wQBsuxlvRn-NMVwPEJru4w.png)
### Sao lưu Ngoài onsite

Yêu cầu phổ biến cho sao lưu ngoài địa điểm là một Veeam Data Mover chạy trong trang sản xuất (gần với datastore nguồn), và Veeam Data Mover còn lại chạy ở trang từ xa, gần với kho lưu trữ sao lưu. Trong quá trình sao lưu, các Veeam Data Movers duy trì một kết nối ổn định, cho phép hoạt động không bị gián đoạn qua WAN hoặc các liên kết chậm.
![](https://img001.prntscr.com/file/img001/9w8tN3m6SdGoQm3aHayuuA.png)
Để sao lưu vào kho lưu trữ Microsoft Windows hoặc Linux trong trang từ xa, bạn cần triển khai một proxy sao lưu trong trang sản xuất, gần với datastore nguồn. Trong kịch bản này, Veeam Data Mover ở phía nguồn được khởi động trên proxy sao lưu, và Veeam Data Mover ở phía đích được khởi động trên kho lưu trữ Microsoft Windows hoặc Linux. Dữ liệu VM được gửi từ proxy sao lưu đến kho lưu trữ sao lưu qua WAN.


Để sao lưu các VM vào kho lưu trữ sao lưu thư mục chia sẻ trong trang từ xa, bạn phải triển khai một proxy sao lưu trong trang nguồn và một máy chủ gateway trong trang từ xa. Kho lưu trữ sao lưu thư mục chia sẻ phải được chỉ định đến máy chủ gateway ở phía đích. Trong quá trình sao lưu, Veeam Data Mover ở phía nguồn được khởi động trên proxy sao lưu ở trang sản xuất, và Veeam Data Mover ở phía đích được khởi động trên máy chủ gateway ở trang từ xa. Dữ liệu VM được chuyển giữa proxy sao lưu và máy chủ gateway qua WAN.
![](https://img001.prntscr.com/file/img001/1A3bqtUNRu2eE6boEBJc_g.png)
---
