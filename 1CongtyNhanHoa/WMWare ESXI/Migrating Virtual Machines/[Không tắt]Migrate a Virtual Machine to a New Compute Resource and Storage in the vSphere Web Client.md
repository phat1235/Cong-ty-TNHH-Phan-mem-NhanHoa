### Di Chuyển Một Máy Ảo Đến Tài Nguyên Tính Toán và Lưu Trữ Mới

Bạn có thể di chuyển một máy ảo đến một tài nguyên tính toán khác và di chuyển đĩa của nó hoặc thư mục máy ảo đến một datastore khác. Với vMotion, bạn có thể di chuyển máy ảo và các đĩa cũng như tệp của nó trong khi máy ảo vẫn đang hoạt động. Việc di chuyển đồng thời đến một tài nguyên tính toán và datastore mới cung cấp khả năng di động lớn hơn cho các máy ảo bằng cách loại bỏ ranh giới của vCenter Server.

#### Điều Kiện Tiên Quyết
- Xác minh rằng máy chủ và máy ảo của bạn đáp ứng các yêu cầu cho việc di chuyển trực tiếp (live migration). Xem "Requirements and Limitations for vMotion Without Shared Storage" trong tài liệu quản lý vCenter Server và Host.
- Đối với di chuyển giữa các phiên bản vCenter Server, xác minh xem hệ thống của bạn có đáp ứng các yêu cầu bổ sung hay không.
- Đối với di chuyển một máy ảo có NVIDIA vGPU, xác minh rằng máy chủ ESXi đích có một khe vGPU miễn phí. Ngoài ra, xác minh rằng tham số nâng cao `vgpu.hotmigrate.enabled` được thiết lập thành true.
- Quyền yêu cầu: `Resource.Migrate powered on virtual machine`.
![](	https://img001.prntscr.com/file/img001/R1brOWFNTG-H-iFZnkeb-g.png)
#### Quy Trình Di Chuyển
1. **Chọn Di Chuyển**:
   - Nhấp chuột phải vào máy ảo và chọn **Migrate**.
   - Để tìm kiếm máy ảo, chọn một trung tâm dữ liệu, thư mục, cụm, nhóm tài nguyên, máy chủ hoặc vApp.
   - Nhấp vào tab **Virtual Machines**.
 ![](	https://img001.prntscr.com/file/img001/A6BC7QX3T4Kqt3C1tEmxKw.png)
![](https://img001.prntscr.com/file/img001/mAT7N-ZZR_utTf0HYdLUMg.png)
2. **Chọn Di Chuyển Cả Tài Nguyên Tính Toán và Lưu Trữ** và nhấp **Next**.

3. **Chọn Tài Nguyên Đích**:
   - Chọn một tài nguyên đích cho máy ảo và nhấp **Next**.
   - Bất kỳ vấn đề tương thích nào sẽ xuất hiện trong bảng Tương Thích. Sửa chữa vấn đề hoặc chọn một máy chủ hoặc cụm khác.
![](https://img001.prntscr.com/file/img001/mAT7N-ZZR_utTf0HYdLUMg.png)

4. **Chọn Định Dạng Đĩa Cho Máy Ảo**:
   - **Same format as source**: Sử dụng định dạng giống như máy ảo nguồn.
   - **Thick Provision Lazy Zeroed**: Tạo một đĩa ảo ở định dạng dày mặc định.
   - **Thick Provision Eager Zeroed**: Tạo một đĩa dày hỗ trợ các tính năng cụm như Fault Tolerance.
   - **Thin Provision**: Sử dụng định dạng cung cấp mỏng.

5. **Chọn Vị Trí Datastore**:
![](https://img001.prntscr.com/file/img001/c-QEyfhXRliILPuf9P16Pg.png)
   - **Store all virtual machine files in the same location on a datastore**: Chọn một datastore và nhấp **Next**.
   - **Store all virtual machine files in the same Storage DRS cluster**: Chọn một cụm Storage DRS.
   - **Store virtual machine configuration files and disks in separate locations**: Nhấp **Advanced** để chọn datastore cho từng tệp.

7. **Chọn Mạng Đích**:
   - Chọn một mạng đích cho tất cả các bộ điều hợp mạng của VM được kết nối với một mạng nguồn hợp lệ và nhấp **Next**.
![](https://img001.prntscr.com/file/img001/Tr-rNLbkSOGFPr35R3mJJw.png)
8. **Chọn Mức Độ Ưu Tiên Di Chuyển** và nhấp **Next**:
   - **Schedule vMotion with high priority**: vCenter Server cố gắng giữ tài nguyên trên cả máy chủ nguồn và đích.
   - **Schedule regular vMotion**: vCenter Server giữ tài nguyên với mức ưu tiên nhỏ hơn.
![](https://img001.prntscr.com/file/img001/clK0JVq9RGyah-3sYmiNHg.png)
9. **Xác Nhận Thông Tin Di Chuyển**:
   - Xem lại trang và nhấp **Finish**.
![](	https://img001.prntscr.com/file/img001/MxORpMGlT6OnAM-GwHSV5Q.png)
#### Kết Quả
vCenter Server sẽ di chuyển máy ảo đến máy chủ hoặc vị trí lưu trữ mới. Các thông điệp sự kiện sẽ xuất hiện trong tab **Events**. Dữ liệu hiển thị trên tab **Summary** sẽ cho thấy trạng thái và tình trạng trong suốt quá trình di chuyển. Nếu có lỗi xảy ra trong quá trình di chuyển, máy ảo sẽ trở về trạng thái và vị trí ban đầu của nó.
![](	https://img001.prntscr.com/file/img001/vDW8ljxcRamZlNW4EZGLOA.png)
![](https://img001.prntscr.com/file/img001/1jQgYUH_To-KYkqd6g8PSA.png)
