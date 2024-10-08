### Cách hoạt động của Chuyển đổi Chuỗi Sao lưu

Giả sử bạn cấu hình công việc sao lưu để thực hiện sao lưu gia tăng tiến tiếp hàng ngày và lên lịch sao lưu toàn bộ tổng hợp vào Thứ Năm. Ngoài ra, bạn đã chọn chuyển đổi chuỗi sao lưu gia tăng thành chuỗi sao lưu gia tăng ngược. Công việc sao lưu bắt đầu từ Chủ nhật. Trong trường hợp này, Veeam Backup & Replication thực hiện sao lưu theo cách sau:

1. **Chủ nhật**: Veeam Backup & Replication tạo một tệp sao lưu toàn bộ.
2. **Thứ Hai đến Thứ Tư**: Veeam tạo các bản sao lưu gia tăng và thêm chúng vào chuỗi sao lưu.
3. **Thứ Năm**: Veeam tạo một bản sao lưu gia tăng mới và sau đó chuyển đổi chuỗi sao lưu:
   - **a**. Veeam chèn các thay đổi từ bản gia tăng của Thứ Hai vào tệp sao lưu toàn bộ của Chủ nhật. Các khối dữ liệu đã thay đổi sẽ được tách ra và lưu lại như một tệp gia tăng ngược. Kết quả là bạn có tệp sao lưu toàn bộ của Thứ Hai và tệp gia tăng ngược của Chủ nhật.
   - **b**. Veeam lặp lại quá trình này cho các bản gia tăng của Thứ Ba, Thứ Tư và Thứ Năm. Kết quả là bạn có một tệp sao lưu toàn bộ tổng hợp được tạo vào Thứ Năm và một bộ tệp gia tăng ngược từ Chủ nhật đến Thứ Tư.

![](https://img001.prntscr.com/file/img001/S0lH8NA2Sqi83nhf6cd0pg.png)
4. Khi công việc sao lưu tiếp theo chạy, Veeam thêm một bản gia tăng mới vào chuỗi sao lưu. Tệp sao lưu toàn bộ tổng hợp sẽ được sử dụng làm điểm bắt đầu mới.

### Chính sách Lưu giữ cho Chuỗi Sao lưu Hỗn hợp

Để duy trì số lượng điểm khôi phục cần thiết trong các chuỗi sao lưu hỗn hợp (gồm các tệp sao lưu gia tăng ngược và gia tăng tiến tiếp), Veeam sẽ xóa các tệp gia tăng ngược cũ khi công việc thêm một tệp sao lưu gia tăng tiến tiếp mới vào chuỗi.

### Chính sách Lưu giữ

Mỗi phiên công việc sao lưu thành công sẽ tạo một điểm khôi phục mới, cho phép bạn quay lại trạng thái dữ liệu VM trước đó. Để kiểm soát số lượng điểm khôi phục trong chuỗi sao lưu, bạn cần xác định cài đặt chính sách lưu giữ. Chính sách lưu giữ xác định số lượng điểm khôi phục mà bạn muốn giữ lại trên đĩa, do đó quyết định khoảng thời gian bạn có thể quay ngược lại.

Sau khi số điểm khôi phục cho phép bị vượt quá, Veeam sẽ tự động xóa điểm khôi phục sớm nhất khỏi chuỗi sao lưu. Để thiết lập chính sách lưu giữ cho một công việc sao lưu, bạn cần chỉ định số lượng điểm khôi phục cần giữ trong trường "Restore points to keep on disk" trong cài đặt công việc sao lưu. Theo mặc định, Veeam giữ lại 14 điểm khôi phục trên đĩa.
![](https://img001.prntscr.com/file/img001/8awXVvyrSIaReOen0Yq8CQ.png)
Veeam xử lý các điểm khôi phục theo cách khác nhau đối với các chuỗi sao lưu gia tăng mãi mãi (forever forward incremental), gia tăng tiến tiếp và gia tăng ngược:

- Chính sách lưu giữ cho sao lưu gia tăng mãi mãi
- Chính sách lưu giữ cho sao lưu gia tăng tiến tiếp
- Chính sách lưu giữ cho sao lưu gia tăng ngược

**Lưu ý**: Khi số điểm khôi phục trong chuỗi sao lưu vượt quá giới hạn cho phép, Veeam sẽ xóa toàn bộ tệp sao lưu, không phải từng VM riêng lẻ.


### Chính sách Lưu giữ Sao lưu Gia tăng Mãi Mãi (Forever Forward Incremental Backup Retention Policy)

Nếu số lượng điểm khôi phục trong chuỗi sao lưu gia tăng mãi mãi vượt quá thiết lập của chính sách lưu giữ, Veeam Backup & Replication sẽ chuyển đổi chuỗi sao lưu để tạo khoảng trống cho điểm khôi phục mới nhất. Quá trình này diễn ra như sau:

1. **Thêm tệp gia tăng mới**: Veeam thêm một tệp sao lưu gia tăng mới vào chuỗi và phát hiện rằng số điểm khôi phục vượt quá giới hạn.
2. **Xây dựng lại tệp sao lưu toàn bộ**: Veeam chèn các khối dữ liệu từ tệp sao lưu gia tăng đầu tiên vào tệp sao lưu toàn bộ. Kết quả là tệp sao lưu toàn bộ được "di chuyển" một bước tiến lên.
![](https://img001.prntscr.com/file/img001/WWqdI2HsSIGOKLPsqCsUAQ.png)
3. **Xóa tệp gia tăng đầu tiên**: Tệp gia tăng đầu tiên bị loại bỏ vì dữ liệu của nó đã được chèn vào tệp sao lưu toàn bộ.
4. 
![](https://img001.prntscr.com/file/img001/JOp36l6-T3CyFjWDuk0SrQ.png)
**Ví dụ**: Bạn muốn giữ lại 7 điểm khôi phục. Công việc sao lưu bắt đầu vào Chủ nhật và chạy hàng ngày. Veeam sẽ:

- Tạo bản sao lưu toàn bộ đầu tiên vào Chủ nhật.
- Từ Thứ Hai đến Thứ Bảy, thêm sáu tệp sao lưu gia tăng.
![](https://img001.prntscr.com/file/img001/q_K5j0acSgecrvM1IXuUJg.png)

- Chủ nhật tiếp theo, thêm tệp gia tăng mới và bắt đầu quá trình chuyển đổi. Tệp sao lưu gia tăng của Thứ Hai được chèn vào tệp sao lưu toàn bộ, và tệp gia tăng của Thứ Hai sẽ bị xóa.
![](https://img001.prntscr.com/file/img001/EThPfXFxToWs3G8C4FI5uA.png)
![](	https://img001.prntscr.com/file/img001/pLRFT6ehQByyifij1rMR7A.png)
### Chính sách Lưu giữ Sao lưu Gia tăng Tiến tiếp (Forward Incremental Backup Retention Policy)

Để khôi phục từ bản sao lưu gia tăng tiến tiếp, cần có tệp sao lưu toàn bộ và chuỗi các tệp gia tăng tiếp theo. Nếu xóa tệp sao lưu toàn bộ, chuỗi gia tăng sẽ trở nên vô dụng. Nếu xóa tệp gia tăng trước điểm muốn khôi phục, không thể khôi phục dữ liệu VM.

Vì lý do này, với phương pháp sao lưu gia tăng tiến tiếp, đôi khi số điểm khôi phục sẽ vượt quá giới hạn. Veeam chỉ xóa toàn bộ chuỗi sao lưu sau khi tệp sao lưu gia tăng cuối cùng trong chuỗi trở nên lỗi thời.

**Ví dụ**: Chính sách lưu giữ là 3 điểm khôi phục. Một bản sao lưu toàn bộ được tạo vào Chủ nhật, các tệp gia tăng từ Thứ Hai đến Thứ Bảy, và một sao lưu tổng hợp vào Thứ Năm. Dù chính sách đã bị vượt quá vào Thứ Tư, tệp sao lưu toàn bộ không bị xóa cho đến khi tệp sao lưu mới nhất được tạo vào Thứ Bảy.
![](	https://img001.prntscr.com/file/img001/LObr6HTmT-edX1BYnRDFxw.png)

### Chính sách Lưu giữ Sao lưu Gia tăng Ngược (Reverse Incremental Backup Retention Policy)

Với sao lưu gia tăng ngược, Veeam sẽ xóa ngay tệp sao lưu gia tăng ngược cũ nhất khi nó trở nên lỗi thời.

**Ví dụ**: 
- Công việc sao lưu bắt đầu vào Chủ nhật.
- Phương pháp sao lưu là gia tăng ngược.
- Chính sách lưu giữ là 6 điểm khôi phục.

Veeam sẽ thêm các điểm khôi phục mới từ Thứ Hai đến Thứ Sáu và xây dựng lại tệp sao lưu toàn bộ. Đến Thứ Bảy, khi thêm điểm khôi phục mới, tệp gia tăng ngược cũ nhất sẽ bị xóa.
![](https://img001.prntscr.com/file/img001/nVksOM-hTC-q20ujwcrT0Q.png)

### Chính sách Lưu giữ cho Các Mục Bị Xóa (Retention Policy for Deleted Items)

Khi thay đổi hạ tầng ảo hoặc chiến lược sao lưu, bạn có thể cần xóa một số máy khỏi công việc sao lưu. Cách Veeam xử lý dữ liệu các máy bị xóa sẽ phụ thuộc vào tùy chọn "Per-VM backup file":

- **Nếu bật "Per-VM"**: Veeam sẽ xóa dữ liệu của các máy không còn được sao lưu khỏi kho lưu trữ.
- **Nếu tắt "Per-VM"**: Veeam chỉ xóa dữ liệu về các mục bị xóa khỏi công việc sao lưu và cơ sở dữ liệu của Veeam. Các khối dữ liệu lưu trữ vẫn còn trên kho lưu trữ và sẽ chỉ bị xóa khi giới hạn điểm khôi phục đạt tới hoặc khi thực hiện việc nén tệp sao lưu toàn bộ.

Bạn cần bật tùy chọn "Remove deleted items data after" trong cài đặt công việc sao lưu và chỉ định thời gian lưu trữ dữ liệu các mục đã bị xóa. 
![](https://img001.prntscr.com/file/img001/03fh7D74RlWsTn7XasgeMw.png)
**Lưu ý**: Nên thiết lập chính sách lưu giữ các mục đã bị xóa tối thiểu là 3 ngày để tránh mất dữ liệu không mong muốn.
