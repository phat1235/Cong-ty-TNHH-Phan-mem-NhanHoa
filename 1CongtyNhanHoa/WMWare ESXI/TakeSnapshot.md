**Chụp Ảnh (Snapshot)**  
Snapshots ghi lại toàn bộ trạng thái của máy ảo tại thời điểm bạn chụp ảnh. Bạn có thể chụp ảnh khi máy ảo đang bật, tắt hoặc đang tạm dừng. Nếu bạn đang tạm dừng máy ảo, hãy đợi cho đến khi quá trình tạm dừng hoàn tất trước khi chụp ảnh.  

Khi bạn tạo một snapshot bộ nhớ, snapshot sẽ ghi lại trạng thái bộ nhớ của máy ảo và cài đặt nguồn của máy ảo. Khi bạn ghi lại trạng thái bộ nhớ của máy ảo, quá trình chụp ảnh sẽ mất nhiều thời gian hơn để hoàn thành. Bạn cũng có thể thấy một sự chậm trễ nhất thời trong phản hồi qua mạng.  

Khi bạn làm tĩnh (quiesce) một máy ảo, VMware Tools sẽ làm tĩnh hệ thống tệp trong máy ảo. Quá trình làm tĩnh tạm dừng hoặc thay đổi trạng thái của các quá trình đang chạy trên máy ảo, đặc biệt là các quá trình có thể thay đổi thông tin được lưu trữ trên đĩa trong quá trình khôi phục.  

**Ghi chú**: Làm tĩnh đồng bộ ứng dụng không được hỗ trợ cho các máy ảo có đĩa IDE hoặc SATA. Nếu bạn chụp ảnh một đĩa động (Dynamic Disk - loại đĩa đặc biệt của Microsoft), công nghệ chụp ảnh sẽ ghi lại trạng thái làm tĩnh của hệ thống tệp, nhưng không ghi lại trạng thái làm tĩnh của ứng dụng.

### Các yêu cầu trước khi thực hiện:
- Nếu bạn đang chụp ảnh bộ nhớ của một máy ảo có nhiều đĩa ở các chế độ đĩa khác nhau, hãy xác nhận rằng máy ảo đang tắt. Ví dụ, nếu bạn có một cấu hình đặc biệt yêu cầu sử dụng đĩa độc lập, bạn phải tắt máy ảo trước khi chụp ảnh.
- Để ghi lại trạng thái bộ nhớ của máy ảo, hãy xác nhận rằng máy ảo đang bật.
- Để làm tĩnh các tệp của máy ảo, hãy xác nhận rằng máy ảo đang bật và VMware Tools đã được cài đặt.
- Đảm bảo rằng bạn có quyền "Quản lý snapshot của máy ảo. Tạo snapshot" trên máy ảo.

### Quy trình chụp ảnh:
1. Nhấp chuột phải vào máy ảo trong danh sách và chọn **Snapshots > Take Snapshot**. Hộp thoại Chụp Ảnh sẽ mở ra.
![](https://img001.prntscr.com/file/img001/NS9LqqZ2SW-CU9Qv4Krbrg.png)
2. Nhập tên cho snapshot.
3. (Tùy chọn) Nhập mô tả cho snapshot.
4. (Tùy chọn) Để ghi lại bộ nhớ của máy ảo, chọn hộp kiểm **Snapshot the virtual machine’s memory**.
5. (Tùy chọn) Để tạm dừng các quá trình đang chạy trên hệ điều hành khách nhằm đảm bảo nội dung hệ thống tệp ở trạng thái nhất quán khi bạn chụp ảnh, hãy chọn hộp kiểm **Quiesce guest file system (Needs VMware Tools installed)**.  
   Bạn chỉ có thể làm tĩnh các tệp của máy ảo khi máy ảo đang bật và hộp kiểm **Snapshot the virtual machine's memory** không được chọn.  
6. Nhấp **OK**.  
