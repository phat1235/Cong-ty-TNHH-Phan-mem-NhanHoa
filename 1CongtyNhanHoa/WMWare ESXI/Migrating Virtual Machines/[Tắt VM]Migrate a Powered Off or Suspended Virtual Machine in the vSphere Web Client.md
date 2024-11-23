### Di Chuyển Một Máy Ảo Đã Tắt Hoặc Đã Tạm Dừng Trong vSphere Web Client

Bạn có thể sử dụng cold migration để di chuyển một máy ảo và các đĩa liên quan của nó từ một datastore này sang datastore khác. Các máy ảo không nhất thiết phải ở trên lưu trữ chia sẻ.

#### Điều Kiện Tiên Quyết
- Hãy đảm bảo rằng bạn quen thuộc với các yêu cầu cho cold migration. Xem tài liệu về Quản lý vCenter Server và Host.
- Quyền yêu cầu: `Resource.Migrate powered off virtual machine`.

#### Quy Trình Di Chuyển
1. **Tắt hoặc Tạm Dừng Máy Ảo**:
   - Tắt hoặc tạm dừng máy ảo mà bạn muốn di chuyển.
![](https://img001.prntscr.com/file/img001/TAy0p3KBSAu2hXo0RBX8eA.png)
2. **Chọn Di Chuyển**:
   - Nhấp chuột phải vào máy ảo và chọn **Migrate**.
3. **Chọn Loại Di Chuyển** và nhấp **Next**:
   - **Change compute resource only**: Di chuyển máy ảo đến một máy chủ khác.
   - **Change storage only**: Di chuyển tệp cấu hình máy ảo và đĩa ảo.
   - **Change both compute resource and storage**: Di chuyển máy ảo đến một máy chủ khác và di chuyển tệp cấu hình và đĩa ảo.
  
![](https://img001.prntscr.com/file/img001/x-J4IJO6QLunEQxTPqvX3w.png)

![](https://img001.prntscr.com/file/img001/hFzUJGlMSfaxBFEWSgD0lw.png)
 **Chọn Định Dạng cho Đĩa Máy Ảo**:
   - **Same format as source**: Sử dụng định dạng giống như máy ảo nguồn.
   - **Thick Provision Lazy Zeroed**: Tạo một đĩa ảo ở định dạng dày mặc định. Không gian yêu cầu cho đĩa ảo được phân bổ trong quá trình tạo. Dữ liệu còn lại trên thiết bị vật lý không bị xóa trong quá trình tạo, mà được đưa vào không gian 0 khi có ghi từ máy ảo.
   - **Thick Provision Eager Zeroed**: Tạo một đĩa dày hỗ trợ các tính năng cụm như Fault Tolerance. Không gian yêu cầu cho đĩa ảo được phân bổ ngay tại thời điểm tạo.
   - **Thin Provision**: Sử dụng định dạng cấp phát mỏng. Ban đầu, một đĩa cấp phát mỏng chỉ sử dụng không gian lưu trữ cần thiết. Nếu đĩa mỏng cần thêm không gian sau này, nó có thể mở rộng đến dung lượng tối đa được phân bổ.

4. **Chọn Vị Trí Lưu Trữ Đĩa Máy Ảo**:
   - **Store all virtual machine files in the same location on a datastore**: Chọn một datastore và nhấp **Next**.
   - **Store all virtual machine files in the same Storage DRS cluster**: Chọn một cụm Storage DRS.
   - **Store virtual machine configuration files and disks in separate locations**: Nhấp vào **Advanced**.
   
![](https://img001.prntscr.com/file/img001/hFzUJGlMSfaxBFEWSgD0lw.png)
5. **Xác Nhận Thông Tin Di Chuyển**:
   - Tại trang **Ready to complete**, xem lại các thông tin và nhấp **Finish**.
![](https://img001.prntscr.com/file/img001/Nybnj0yoQpyDT-8ioojUfw.png)
#### Kết Quả
vCenter Server di chuyển máy ảo đến máy chủ hoặc vị trí lưu trữ mới. Các thông điệp sự kiện sẽ xuất hiện trong tab **Events**. Dữ liệu hiển thị trên tab **Summary** cho thấy trạng thái và tình trạng trong suốt quá trình di chuyển. Nếu có lỗi xảy ra trong quá trình di chuyển, máy ảo sẽ trở về trạng thái và vị trí ban đầu của nó.
