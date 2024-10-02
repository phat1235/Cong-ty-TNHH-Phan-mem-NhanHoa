### Hướng dẫn Nhân (Clone) Một Máy Ảo thành Template

Sau khi bạn đã tạo một máy ảo, bạn có thể nhân (clone) nó thành một template. Templates là bản sao chính của máy ảo cho phép bạn tạo các máy ảo sẵn sàng để sử dụng. Bạn có thể thực hiện các thay đổi trên template, chẳng hạn như cài đặt thêm phần mềm trong hệ điều hành khách, trong khi vẫn bảo tồn máy ảo gốc.

#### Điều kiện tiên quyết
Trước khi thực hiện thao tác nhân, hãy dừng bất kỳ trình tạo tải nào đang chạy trong máy ảo. Đảm bảo rằng bạn có các quyền sau:

- **Virtual machine .Provisioning.Create template from virtual machine**: Quyền tạo template từ máy ảo nguồn.
- **Virtual machine .Inventory.Create from existing**: Quyền tạo máy ảo từ máy ảo đã tồn tại trong thư mục nơi template được tạo.
- **Resource.Assign virtual machine to resource pool**: Quyền gán máy ảo vào pool tài nguyên trên máy chủ, cụm, hoặc pool tài nguyên đích.
- **Datastore.Allocate space**: Quyền cấp phát không gian trên tất cả các datastore nơi template được tạo.

---

### Quy trình Nhân Máy Ảo thành Template

Dưới đây là các bước để nhân máy ảo thành template:

1. **Khởi động Wizard Nhân Máy Ảo**:
   - Từ một đối tượng cha hợp lệ của máy ảo, nhấp chuột phải vào bất kỳ đối tượng nào trong kho dữ liệu (inventory), như trung tâm dữ liệu, thư mục, cụm, pool tài nguyên hoặc máy chủ, và chọn **New Virtual Machine**.
   - Trên trang **Select a creation type**, chọn **Clone virtual machine to template** và nhấp **Next**.
   - Trên trang **Select a virtual machine**, chọn máy ảo mà bạn muốn nhân.

   Hoặc từ một máy ảo:
   - Nhấp chuột phải vào máy ảo và chọn **Clone > Clone to Template**.
![](	https://img001.prntscr.com/file/img001/V6uAeZjDSG-i-5pFy1uCEg.png
) ![](	https://img001.prntscr.com/file/img001/YDWdKyhaSsmPizPo9YquHA.png)
2. **Nhập Tên và Thư Mục**:
   - Trên trang **Select a name and folder**, nhập tên cho template và chọn trung tâm dữ liệu hoặc thư mục để triển khai nó.
   - Tên template sẽ xác định tên của các tệp và thư mục trên đĩa. Ví dụ: nếu bạn đặt tên template là `win8tmp`, các tệp template sẽ được đặt tên như `win8tmp.vmdk`, `win8tmp.nvram`, và tương tự. Nếu bạn thay đổi tên template, các tệp trên datastore sẽ không thay đổi.
![](	https://img001.prntscr.com/file/img001/IOM65UHWQMepgvFhzgsPow.png)
3. **Chọn Tài Nguyên Tính Toán**:
   - Trên trang **Select a compute resource**, chọn một máy chủ hoặc cụm tài nguyên cho template.
   - Bảng **Compatibility** sẽ hiển thị kết quả từ các kiểm tra tương thích.
   - **Lưu ý**: Nếu máy ảo bạn nhân có thiết bị NVDIMM và đĩa ảo PMem, máy chủ hoặc cụm đích phải có tài nguyên PMem khả dụng. Nếu không, bạn sẽ không thể tiến hành nhiệm vụ này.
   ![](https://img001.prntscr.com/file/img001/R48k8Q01QWKWz1vk9RhZxw.png)

4. **Chọn Lưu Trữ**:
   - Trên trang **Select storage**, chọn datastore hoặc cụm datastore để lưu trữ tệp cấu hình của template và tất cả các đĩa ảo. Nhấp **Next**.
   - Nếu bạn đang nhân một máy ảo có đĩa vPMem:
     - Chọn loại lưu trữ cho template bằng cách chọn **Standard**, **PMem**, hoặc **Hybrid**.
     - Nếu bạn chọn chế độ **Standard**, tất cả các đĩa ảo sẽ được lưu trữ trên một datastore tiêu chuẩn.
     - Nếu bạn chọn chế độ **PMem**, tất cả các đĩa ảo sẽ được lưu trữ trên datastore PMem cục bộ của máy chủ. Tệp cấu hình không thể được lưu trữ trên một datastore PMem, vì vậy bạn phải chọn một datastore tiêu chuẩn để lưu trữ tệp cấu hình.
     - Nếu bạn chọn chế độ **Hybrid**, tất cả các đĩa ảo PMem vẫn sẽ được lưu trữ trên datastore PMem. Các đĩa không PMem sẽ bị ảnh hưởng bởi chính sách lưu trữ VM và datastore hoặc cụm datastore mà bạn đã chọn.
   - Từ menu thả xuống **Select virtual disk format**, chọn định dạng đĩa ảo mới cho template hoặc giữ nguyên định dạng như máy ảo nguồn.
   - Chọn một datastore hoặc cụm datastore.
   - Tùy chọn: Bật **Configure per disk** để chọn một datastore hoặc cụm datastore riêng cho tệp cấu hình của template và cho mỗi đĩa ảo.
![](	https://img001.prntscr.com/file/img001/wc6YBi-_QnWmnYuZDSdN0w.png)
5. **Hoàn tất**:
![](	https://img001.prntscr.com/file/img001/HZhnuRYCTtCQF9M5UuT3-g.png)
   - Trên trang **Ready to complete**, xem lại các cài đặt template và nhấp **Finish**.
   - Tiến trình của nhiệm vụ nhân sẽ xuất hiện trong bảng **Recent Tasks**. Khi nhiệm vụ hoàn tất, template sẽ xuất hiện trong kho dữ liệu (inventory).
![](https://img001.prntscr.com/file/img001/7-9e3utsQrGJSaYDzOiTmA.png)
### Kết quả
Template mới sẽ có mặt trong kho dữ liệu của vSphere Client, sẵn sàng để được sử dụng và triển khai các máy ảo mới từ nó. 

### Kết luận
Việc nhân một máy ảo thành template là một cách hiệu quả để chuẩn bị các bản sao sẵn sàng cho việc triển khai nhanh chóng trong môi trường ảo hóa của bạn.
