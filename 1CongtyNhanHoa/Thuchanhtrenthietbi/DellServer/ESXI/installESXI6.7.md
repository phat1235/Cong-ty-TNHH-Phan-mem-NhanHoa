### – Bước 1: Sau khi tải tập tin ISO ESXi từ địa chỉ của nhà cung cấp :V, bạn cần dùng chương trình Rufus để ghi tập tin ISO này vào USB.
Nhưng ở đây tôi đang giả dụ là tôi đang ở xa server nên tôi sẽ cài đặt qua IDRAC

Tôi sẽ mount ISO. Rồi thực hiện khởi động lại hệ thống để hệ thống vào boot file ISO
![](https://img001.prntscr.com/file/img001/sn4x6mjYQx6HaQUhSZsPgg.png)
	
![](https://img001.prntscr.com/file/img001/1AEnWykKT6OwR8LDwteehQ.png)
![](https://img001.prntscr.com/file/img001/QhblepblRw-RhoI0e5xwvw.png)
### – Bước 2: trong cửa sổ Welcome to the Installation, bấm nút Enter để tiếp tục cài đặt.

![](https://img001.prntscr.com/file/img001/GepZVMF1R7CFibhSUaE2IA.png)

### – Bước 3: bấm nút F11 để chấp thuận thoả thuận cấp phép người dùng cuối

![](https://img001.prntscr.com/file/img001/HN7YpnjbSyqE2BibqB_Y5w.png)

### – Bước 4: lúc này, các thiết bị hiện có trên hệ thống của bạn sẽ được quét

![](https://img001.prntscr.com/file/img001/BYpFJ2owSWCvURS6fBdwaA.png)

VÀ chọn ổ đĩa muốn cài đặt và bấm nút Enter

### – Bước 5: chọn bố cục bàn phím của bạn và bấm nút Enter

![](https://img001.prntscr.com/file/img001/BrghWxTzRmKNNUcoNKybKw.png)

### – Bước 6: nhằm đảm bảo bảo mật hệ thống, bạn cần tạo một password root thật mạnh. Sau khi đảm bảo password có chứa các ký tự in hoa và ký tự đặc biệt, bấm nút Enter. Lưu ý, bố cục bàn phím của máy host mà bạn đặt password root, và bố cục bàn phím VMware ESXi, phải giống nhau, nếu không, bạn sẽ bị báo lỗi password root khi kết nối với máy chủ ảo bằng trình duyệt web.

![](https://img001.prntscr.com/file/img001/DgfL_FxNQpyLiVvWFGLJdA.png)

### – Bước 7: sau khi thực hiện các thiết lập cần thiết, bấm nút F11 để xác nhận ổ đĩa sẽ được phân vùng và bắt đầu cài đặt. Lưu ý, nếu bạn gặp thông báo vi xử lý máy tính có thể không được hỗ trợ trong các phiên bản VMware ESXi tương lai ở bước này, bấm nút Enter để bỏ qua và tiếp tục.

![](	https://img001.prntscr.com/file/img001/0BrWNIqjQxGBUbTLo57JfA.png)

### – Bước 8: chờ trong khi ESXi 8.0b được cài đặt lên máy tính hoặc máy chủ

![](https://img001.prntscr.com/file/img001/7G1-zi8pTnyQ3UaV3ukMOQ.png)

### – Bước 9: sau khi cài đặt hoàn thành, bấm nút Enter ở lựa chọn Remove the installation media before rebooting để tháo USB trước khi khởi động lại máy
![](	https://img001.prntscr.com/file/img001/9OfDZzhFS1CDq-R-QfeacA.png)

### – Bước 10: sau khi cài đặt hoàn thành thành công, mở một trong các trình duyệt web Chrome, Opera, hoặc Internet Explorer và kết nối đến máy chủ với địa chỉ IP được chỉ định trên màn hình máy chủ VMware ESXi
![](https://img001.prntscr.com/file/img001/_swqE4zWRVCZN4g4QsSXpg.png)

### – Bước 11: sau khi nhập địa chỉ vào thanh URL của trình duyệt web, bấm vào mục Help me understand khi trình duyệt hiển thị màn hình You connection is not private, sau đó bấm vào Proceed to [địa chỉ IP] (unsafe)

![](https://img001.prntscr.com/file/img001/0N66hyHlR_i51N9mWU-CLw.png)

###– Bước 12: gõ root trong mục Username và password đã tạo, sau đó bấm Login. 

![](https://img001.prntscr.com/file/img001/mqLJSE3BRGSxIQo9r6qNcQ.png)
