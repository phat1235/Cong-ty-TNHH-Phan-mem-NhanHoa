### Tạo Snapshots Cho Máy Ảo

Bạn có thể tạo một hoặc nhiều snapshots cho máy ảo để lưu trạng thái cài đặt, trạng thái đĩa, và trạng thái bộ nhớ tại những thời điểm cụ thể khác nhau. Khi tạo snapshot, bạn cũng có thể quiesce các tệp máy ảo và loại trừ các đĩa máy ảo khỏi snapshots.

Khi tạo snapshot, các hoạt động khác đang diễn ra trong máy ảo có thể ảnh hưởng đến quá trình snapshot khi bạn khôi phục lại snapshot đó. Thời điểm tốt nhất để tạo snapshot về mặt lưu trữ là khi không có tải **I/O** lớn. Thời điểm tốt nhất để tạo snapshot từ góc độ dịch vụ là khi không có ứng dụng nào trong máy ảo đang giao tiếp với các máy tính khác. Nguy cơ xảy ra vấn đề cao nhất là khi máy ảo đang giao tiếp với một máy tính khác, đặc biệt là trong môi trường sản xuất. Ví dụ, nếu bạn tạo snapshot trong khi máy ảo đang tải xuống tệp từ một máy chủ trên mạng, máy ảo vẫn tiếp tục tải xuống tệp và báo cáo tiến trình với máy chủ. Nếu bạn khôi phục về snapshot, quá trình giao tiếp giữa máy ảo và máy chủ sẽ bị rối loạn và quá trình truyền tải tệp có thể thất bại. Tùy thuộc vào tác vụ bạn đang thực hiện, bạn có thể tạo snapshot bộ nhớ hoặc quiesce hệ thống tệp trong máy ảo.

#### Snapshots Bộ Nhớ

Đây là tùy chọn mặc định khi tạo snapshot. Khi bạn lưu trạng thái bộ nhớ của máy ảo, snapshot sẽ giữ lại trạng thái hoạt động của máy ảo. Snapshots bộ nhớ tạo snapshot tại thời điểm chính xác, ví dụ như khi bạn đang nâng cấp phần mềm. Nếu bạn tạo snapshot bộ nhớ và quá trình nâng cấp không hoàn thành như mong đợi, hoặc phần mềm không đáp ứng yêu cầu của bạn, bạn có thể khôi phục máy ảo về trạng thái trước đó.

Khi lưu trạng thái bộ nhớ, các tệp của máy ảo không cần phải **quiesce**. Nếu bạn không lưu trạng thái bộ nhớ, snapshot sẽ không lưu trạng thái hoạt động của máy ảo và các đĩa sẽ được giữ ở trạng thái **crash consistent** trừ khi bạn quiesce chúng.

#### Snapshots Quiesced

Khi bạn quiesce máy ảo, **VMware Tools** sẽ quiesce hệ thống tệp của máy ảo. Hoạt động quiesce đảm bảo rằng đĩa snapshot đại diện cho trạng thái nhất quán của hệ thống tệp của khách. Snapshots quiesced phù hợp cho các bản sao lưu tự động hoặc định kỳ. Ví dụ, nếu bạn không biết chính xác hoạt động của máy ảo, nhưng muốn có một số bản sao lưu gần nhất để khôi phục, bạn có thể quiesce các tệp.

Nếu máy ảo bị tắt nguồn hoặc **VMware Tools** không khả dụng, tham số **Quiesce** sẽ không khả dụng. Bạn không thể quiesce các máy ảo có đĩa dung lượng lớn.

### Thay Đổi Chế Độ Đĩa Để Loại Trừ Các Đĩa Ảo Khỏi Snapshots

Bạn có thể đặt một đĩa ảo vào chế độ độc lập để loại trừ đĩa khỏi bất kỳ snapshot nào được thực hiện của máy ảo đó.

#### Điều Kiện Tiên Quyết

- Tắt máy ảo và xóa bất kỳ snapshot nào hiện có trước khi thay đổi chế độ đĩa. Việc xóa một snapshot liên quan đến việc cam kết dữ liệu hiện có trên đĩa snapshot vào đĩa cha.

**Quyền yêu cầu:**
- **Quản lý snapshot máy ảo**: Xóa snapshot
- **Cấu hình máy ảo**: Thay đổi cài đặt thiết bị

#### Quy Trình

1. Nhấp chuột phải vào một máy ảo trong danh sách và chọn **Chỉnh sửa cài đặt**.
2. Trên tab **Phần cứng Ảo**, mở rộng **Đĩa cứng**, và chọn một tùy chọn chế độ đĩa độc lập.

   | Tùy chọn                        | Mô tả                                                                                                           |
   |---------------------------------|----------------------------------------------------------------------------------------------------------------|
   | **Độc lập - Bền vững**           | Các đĩa ở chế độ bền vững hoạt động giống như các đĩa thông thường trên máy tính vật lý của bạn. Tất cả dữ liệu được ghi vào đĩa ở chế độ bền vững sẽ được ghi vĩnh viễn vào đĩa.        |
   | **Độc lập - Không bền vững** | Các thay đổi đối với đĩa ở chế độ không bền vững sẽ bị loại bỏ khi bạn tắt nguồn hoặc khởi động lại máy ảo. Với chế độ không bền vững, bạn có thể khởi động lại máy ảo với một đĩa ảo ở cùng một trạng thái mỗi lần. Các thay đổi đối với đĩa được ghi vào và đọc từ một tệp nhật ký redo sẽ bị xóa khi bạn tắt nguồn hoặc khởi động lại. |

3. Nhấp vào **OK**.
