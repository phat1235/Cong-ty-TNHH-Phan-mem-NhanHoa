### Hướng dẫn Triển Khai (Deploy) Một Máy Ảo từ Template trong vSphere Web Client

Triển khai một máy ảo từ một template tạo ra một máy ảo là bản sao của template. Máy ảo mới sẽ có phần cứng ảo, phần mềm đã cài đặt, và các thuộc tính khác được cấu hình cho template.

#### Điều kiện tiên quyết
Bạn cần có các quyền sau để triển khai một máy ảo từ template:

- **Virtual machine .Inventory.Create from existing**: Quyền tạo máy ảo từ máy ảo đã tồn tại trên trung tâm dữ liệu hoặc thư mục máy ảo.
- **Virtual machine.Configuration.Add new disk**: Quyền thêm đĩa ảo mới, chỉ cần thiết nếu bạn tùy chỉnh phần cứng gốc.
- **Virtual machine .Provisioning.Deploy template**: Quyền triển khai template trên template nguồn.
- **Resource.Assign virtual machine to resource pool**: Quyền gán máy ảo vào pool tài nguyên trên máy chủ, cụm, hoặc pool tài nguyên đích.
- **Datastore.Allocate space**: Quyền cấp phát không gian trên datastore đích.
- **Network.Assign network**: Quyền gán mạng cho máy ảo, chỉ cần thiết nếu bạn tùy chỉnh phần cứng gốc bằng cách thêm card mạng mới.
- **Virtual machine .Provisioning.Customize**: Quyền tùy chỉnh hệ điều hành khách trên template hoặc thư mục template.
- **Virtual machine .Provisioning.Read customization specifications**: Quyền đọc các đặc tả tùy chỉnh trên máy chủ vCenter.
- **Virtual machine .Inventory.Create new**: Quyền tạo mới trong thư mục hoặc trung tâm dữ liệu đích.
- **vApp.Import**.

---

### Quy trình Triển Khai Máy Ảo từ Template

Dưới đây là các bước để triển khai máy ảo từ template:

1. **Khởi động Wizard Triển Khai Từ Template**:
   - Mở wizard từ bất kỳ đối tượng nào trong kho dữ liệu:
     - Nhấp chuột phải vào bất kỳ đối tượng nào là đối tượng cha hợp lệ của máy ảo, như trung tâm dữ liệu, thư mục, cụm, pool tài nguyên, hoặc máy chủ, và chọn **New Virtual Machine > New Virtual Machine**.
     - Trên trang **Select a creation type**, chọn **Deploy from template** và nhấp **Next**.
     - Trên trang **Select a template**, chọn template mà bạn muốn sử dụng.
     - (Tùy chọn) Chọn hộp kiểm **Customize the operating system** để tùy chỉnh hệ điều hành khách của máy ảo.
     - (Tùy chọn) Chọn hộp kiểm **Customize this virtual machine's hardware** để tùy chỉnh phần cứng ảo của máy ảo.
     - (Tùy chọn) Chọn hộp kiểm **Power On Virtual Machine after creation** để khởi động máy ảo sau khi tạo.

   - Mở wizard từ một template:
     - Nhấp chuột phải vào template và chọn **New VM from This Template**.
    
![](https://img001.prntscr.com/file/img001/vXWm7UpbRQm64Y3VfylSYw.png)
![](https://img001.prntscr.com/file/img001/o68B75veQo6Wg6foxHF18Q.png)

2. **Nhập Tên và Thư Mục**:
   - Trên trang **Select a name and folder**, nhập tên duy nhất cho máy ảo và chọn vị trí triển khai.
  ![](	https://img001.prntscr.com/file/img001/qKXci-yrRraCurulF70oHQ.png)

3. **Chọn Tài Nguyên Tính Toán**:
   - Trên trang **Select a compute resource**, chọn máy chủ, cụm, pool tài nguyên, hoặc vApp nơi máy ảo sẽ chạy và nhấp **Next**.
   - Máy ảo sẽ có quyền truy cập vào các tài nguyên của đối tượng đã chọn.
   
![](https://img001.prntscr.com/file/img001/YQWLk87mSleomxAM5RhPqQ.png)
4. **Chọn Lưu Trữ**:
   - Trên trang **Select storage**, cấu hình datastore.
   - **Chọn định dạng cho các đĩa của máy ảo**:
     - **Same format as source**: Sử dụng cùng định dạng với máy ảo nguồn.
     - **Thick Provision Lazy Zeroed**: Tạo một đĩa ảo ở định dạng dày mặc định. Không gian cần thiết cho đĩa ảo được cấp phát khi tạo. Dữ liệu còn lại trên thiết bị vật lý không bị xóa trong quá trình tạo, mà sẽ được zero hóa sau này khi ghi lần đầu từ máy ảo.
     - **Thick Provision Eager Zeroed**: Tạo một đĩa dày hỗ trợ các tính năng clustering như Fault Tolerance. Không gian cần thiết cho đĩa ảo được cấp phát ngay khi tạo.
     - **Thin Provision**: Sử dụng định dạng cấp phát mỏng. Ban đầu, đĩa cấp phát mỏng chỉ sử dụng không gian datastore mà nó cần. Nếu đĩa mỏng cần thêm không gian sau này, nó có thể phát triển đến dung lượng tối đa đã được cấp phát.
![](	https://img001.prntscr.com/file/img001/Qv4QWr_BRCWKA7dvHmkt2A.png)
5. **Tùy chỉnh phần cứng (Tùy chọn)**:
   - Trên trang **Customize hardware**, cấu hình phần cứng máy ảo, tùy chọn máy ảo và quy tắc Storage DRS, sau đó nhấp **Next**.
   - Tùy chỉnh hệ điều hành khách sẽ ngăn chặn các xung đột có thể xảy ra nếu bạn triển khai các máy ảo với cài đặt giống nhau, như tên máy tính trùng lặp.

   **Tùy chọn**:
   - **Select an existing specification**: Chọn một đặc tả tùy chỉnh từ danh sách.
   - **Create a specification**: Nhấp vào biểu tượng **Create a new specification** và hoàn thành các bước trong wizard.
   - **Create a specification from an existing specification**:
     - Chọn một đặc tả tùy chỉnh từ danh sách.
     - Nhấp vào biểu tượng **Create a spec from an existing spec** và hoàn thành các bước trong wizard.
![](	https://img001.prntscr.com/file/img001/DEcdZHaHSWKtazdeTyIPAQ.png)

![](	https://img001.prntscr.com/file/img001/-tW3PI7zTOOVUoJTGIxh-Q.png)
6. **Hoàn tất**:
   - Trên trang **Ready to complete**, xem lại thông tin và nhấp **Finish**.
![](	https://img001.prntscr.com/file/img001/RcKdOUg2RXOhlMric13rFg.png)
### Kết quả
Máy ảo mới sẽ được triển khai từ template và sẽ xuất hiện trong kho dữ liệu của vSphere Client, sẵn sàng để sử dụng trong môi trường ảo hóa của bạn. Việc triển khai máy ảo từ template giúp bạn tiết kiệm thời gian và công sức trong quá trình cài đặt và cấu hình.
