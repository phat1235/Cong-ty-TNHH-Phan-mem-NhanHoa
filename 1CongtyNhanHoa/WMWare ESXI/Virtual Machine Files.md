Dưới đây là bảng tổng hợp các tệp tin được tạo ra trong quá trình hoạt động của một **máy ảo (Virtual Machine)** trên **VMware ESXi**. 

### Bảng 2-1. Các tệp của máy ảo (Virtual Machine Files)

| **Tệp tin**              | **Mô tả sử dụng**                                | **Giải thích chi tiết**                                                                                                  |
|-------------------------|--------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| **`.vmx`**              | Tệp cấu hình máy ảo                              | Chứa thông tin cấu hình về phần cứng và phần mềm của máy ảo, như CPU, RAM, mạng và các thiết bị lưu trữ.                   |
| **`.vmxf`**             | Tệp cấu hình bổ sung cho máy ảo                  | Tệp mở rộng cho cấu hình của máy ảo, thường được sử dụng khi máy ảo được chia sẻ giữa nhiều hệ thống khác nhau.           |
| **`.vmdk`**             | Tệp đặc tả ổ đĩa ảo                              | Chứa thông tin về đặc điểm của ổ đĩa ảo (virtual disk), như kích thước và định dạng của nó.                                |
| **`- flat.vmdk`**        | Ổ đĩa dữ liệu của máy ảo                         | Tệp chứa toàn bộ dữ liệu của máy ảo, lưu trữ nội dung thực tế của ổ đĩa ảo.                                                |
| **`.nvram`**            | Cấu hình BIOS hoặc EFI của máy ảo                | Lưu trữ thông tin cấu hình BIOS hoặc EFI của máy ảo, giống như BIOS trên máy vật lý.                                       |
| **`.vmsd`**             | Tệp quản lý snapshot của máy ảo                  | Quản lý thông tin về các snapshot của máy ảo, theo dõi những phiên bản snapshot đã được tạo ra.                            |
| **`.vmsn`**             | Dữ liệu snapshot của máy ảo                      | Chứa dữ liệu về snapshot, bao gồm trạng thái của RAM và hệ thống tại thời điểm snapshot được tạo ra.                      |
| **`.vswp`**             | Tệp hoán đổi (swap) của máy ảo                   | Được tạo ra khi máy ảo thiếu bộ nhớ RAM và cần sử dụng đĩa cứng để thay thế (swap file).                                    |
| **`.vmss`**             | Tệp treo máy ảo (suspend file)                   | Lưu trạng thái của máy ảo khi nó bị tạm dừng (suspend), cho phép tiếp tục từ trạng thái đó sau khi bật lại.               |
| **`.log`**              | Tệp nhật ký của máy ảo hiện tại                  | Lưu trữ các sự kiện và thông tin lỗi của máy ảo trong phiên làm việc hiện tại, giúp quản trị viên kiểm tra sự cố.          |
| **`-#.log`**            | Các tệp nhật ký cũ                               | Tệp nhật ký của các phiên trước đó (được đánh số thứ tự, bắt đầu từ 1), giúp theo dõi lịch sử hoạt động của máy ảo.        |
| **`.hlog`**             | Tệp nhật ký của vCenter Server                   | Được vCenter Server sử dụng để theo dõi các tệp của máy ảo cần xóa sau khi một số thao tác hoàn thành.                     |
| **`.vmtx`**             | Tệp cấu hình máy ảo khi chuyển thành template    | Được tạo ra khi máy ảo được chuyển đổi thành template. Tệp này thay thế cho tệp cấu hình máy ảo `.vmx`.                   |

### Các tệp đặc biệt:

1. **`.hlog`**: Tệp này không phải lúc nào cũng có mặt. Nó được tạo ra và sử dụng bởi **vCenter Server** để theo dõi các tệp máy ảo cần xóa sau khi hoàn thành một số tác vụ (như di chuyển máy ảo hoặc snapshot).
   
2. **`.vmtx`**: Khi máy ảo được chuyển thành một **template** (mẫu), tệp `.vmtx` sẽ thay thế cho tệp cấu hình `.vmx`. Template thường được dùng để triển khai nhanh các máy ảo mới với cấu hình cố định.

