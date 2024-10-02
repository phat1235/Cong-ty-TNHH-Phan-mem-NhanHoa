# Tạo Job Sao Lưu (Backup Job)

## Trước Khi Bắt Đầu

Đảm bảo rằng tất cả các thành phần của hạ tầng sao lưu tham gia vào quá trình sao lưu đã được thêm vào hạ tầng sao lưu. Các thành phần này bao gồm các **ESXi hosts** mà các máy ảo (VMs) đã được đăng ký, **proxy sao lưu VMware** và **kho lưu trữ sao lưu** (backup repository).

## Tạo Job Sao Lưu

Để sao lưu các máy ảo (VMs), thực hiện các bước sau:

1. Trong **inventory pane** của tab **Home**, nhấp chuột phải vào **Jobs** và chọn **Backup > Virtual Machine > VMware vSphere** để khởi chạy trình hướng dẫn **New Backup Job**.
![](https://img001.prntscr.com/file/img001/GXzV6SVqTL-0--a4ggPF-g.png)

2. Tại bước **Name** của trình hướng dẫn, chỉ định tên và mô tả cho job sao lưu.

3. Tại bước **Virtual Machines**, nhấn **Add**. Từ danh sách, chọn các máy ảo mà bạn muốn sao lưu. Bạn cũng có thể sao lưu các container của VM như: thư mục, pool tài nguyên, cụm, vApps, datastores, và các đối tượng khác. Nếu bạn thêm một VM mới vào container sau khi job sao lưu được tạo, **Veeam Backup & Replication** sẽ tự động cập nhật job để bao gồm VM mới này.
![](https://img001.prntscr.com/file/img001/UqUNFIWBQhutmn3Q3IoEzQ.png)
4. Tại bước **Storage** của trình hướng dẫn, thực hiện các thao tác sau:
   - Từ danh sách **Backup repository**, chọn kho lưu trữ sao lưu mà bạn đã cấu hình trong phần **Configure Backup Repository**.
   - Trong trường **Restore points to keep on disk**, xác định số lượng điểm khôi phục cần giữ lại.
   - Khi số lượng điểm khôi phục vượt quá giá trị cho phép, **Veeam Backup & Replication** sẽ tự động xóa điểm khôi phục sớm nhất khỏi chuỗi sao lưu. 
   - Nhấn nút **Advanced** và trong tab **Backup**, chỉ định phương pháp sao lưu hoặc để các thiết lập mặc định. 
![](	https://img001.prntscr.com/file/img001/webvzUaxS_awyvliZpyDhQ.png)
![](https://img001.prntscr.com/file/img001/_PDenNYoRjePj3EO2N-lgw.png)
5. Tại bước **Guest Processing**, giữ các thiết lập mặc định. 
![](https://img001.prntscr.com/file/img001/_PDenNYoRjePj3EO2N-lgw.png)

6. Tại bước **Schedule** của trình hướng dẫn, thực hiện các thao tác sau:
   - Chọn ô **Run the job automatically**. Nếu bạn không chọn ô này, bạn sẽ phải khởi chạy job thủ công. Chi tiết thêm có thể xem trong phần **Start Backup Job Manually**.
   - Chọn loại lịch: hàng ngày, hàng tháng hoặc theo chu kỳ.
   - Đảm bảo rằng ô **Retry failed VM processing** đã được chọn.
   - Nhấn **Apply**.
![](	https://img001.prntscr.com/file/img001/JbYFI8Z-Sb6fmV8SKYeWvw.png)
7. Tại bước **Summary** của trình hướng dẫn, chọn ô **Run the job when I click Finish** và nhấn nút **Finish**.
![](https://img001.prntscr.com/file/img001/J9fXkO7eRJ22S5HSztsaJw.png)

8. Trong **inventory pane** của tab **Home**, mở rộng node **Last 24 Hours** để xem job đã được tạo.
![](https://img001.prntscr.com/file/img001/BDAtAE_QTw-BQc1Tisgrug.png)

![](https://img001.prntscr.com/file/img001/CglQf7vaR1CaZyDK1fEbGQ.png)

![](https://img001.prntscr.com/file/img001/LP4tI2JISNe4wKSRpjj7Iw.png)

![](https://img001.prntscr.com/file/img001/hF-C2dThQG63HISaPX1Dow.png)
Đây là file backup lưu tại local. Nên tuân tủ nguyên tắc 3-2-1-0 nhé!!!
![](https://img001.prntscr.com/file/img001/FzEykGSPQsiaWwjoFlt5Ww.png)
