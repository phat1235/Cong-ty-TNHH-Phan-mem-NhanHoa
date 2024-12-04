- Truy Cập Tuần Tự
- Truy Cập Trực Tiếp
- Truy Cập Theo Chỉ Mục

![](https://img001.prntscr.com/file/img001/8Yx-Cl0aQZieZg3oB_osBA.png)

Hầu hết các hệ điều hành truy cập File theo tuần tự. Nói cách khác, chúng ta có thể nói rằng hầu hết các File cần được hệ điều hành truy cập tuần tự.

Trong truy cập tuần tự, Hệ điều hành đọc File từng chữ. Một con trỏ được duy trì mà ban đầu trỏ đến địa chỉ cơ sở của File. Nếu người dùng muốn đọc từ đầu tiên của File thì con trỏ sẽ cung cấp từ đó cho người dùng và tăng giá trị của từ đó lên 1 từ. Quá trình này tiếp tục cho đến cuối File.

Các hệ thống từ hiện đại cung cấp khái niệm truy cập trực tiếp và truy cập được lập chỉ mục nhưng phương pháp được sử dụng nhiều nhất là truy cập tuần tự do thực tế là hầu hết các File như File văn bản, File âm thanh, File video, v.v. cần được truy cập tuần tự.

## Truy cập trực tiếp
Truy cập Trực tiếp hầu hết được yêu cầu trong trường hợp hệ thống cơ sở dữ liệu. Trong hầu hết các trường hợp, chúng tôi cần thông tin được lọc từ cơ sở dữ liệu. Việc truy cập tuần tự có thể rất chậm và không hiệu quả trong những trường hợp như vậy.

Giả sử mỗi khối lưu trữ lưu trữ 4 bản ghi và chúng ta biết rằng bản ghi chúng ta cần được lưu trữ trong khối thứ 10. Trong trường hợp đó, truy cập tuần tự sẽ không được thực hiện vì nó sẽ đi qua tất cả các khối để truy cập bản ghi cần thiết.

Truy cập trực tiếp sẽ cho kết quả cần thiết mặc dù hệ điều hành phải thực hiện một số tác vụ phức tạp như xác định số khối mong muốn. Tuy nhiên, điều đó thường được thực hiện trong các ứng dụng cơ sở dữ liệu.

![](https://img001.prntscr.com/file/img001/OqNcPVcFSZm8qXEjgRFv9w.png)

### Truy cập index

Nếu một File có thể được sắp xếp trên bất kỳ File nào trong số các File đó thì một chỉ mục có thể được gán cho một nhóm các bản ghi nhất định. Tuy nhiên, một bản ghi cụ thể có thể được truy cập bằng chỉ mục của nó. Chỉ mục không là gì ngoài địa chỉ của một bản ghi trong File.

Trong việc truy cập chỉ mục, việc tìm kiếm trong một cơ sở dữ liệu lớn trở nên rất nhanh chóng và dễ dàng nhưng chúng ta cần có thêm một số không gian trong bộ nhớ để lưu giá trị chỉ mục.

## So sánh về 3 loại truy cập này
Dưới đây là bảng so sánh giữa “Truy Cập Tuần Tự”, “Truy Cập Trực Tiếp”, và “Truy Cập Theo Chỉ Mục”:

![](https://img001.prntscr.com/file/img001/nCNqVxToRaq8E5oJHbjyew.png)
