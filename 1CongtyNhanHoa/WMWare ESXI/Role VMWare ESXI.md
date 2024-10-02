VMware ESXi 6.7 cung cấp một hệ thống phân quyền chi tiết, cho phép quản trị viên kiểm soát quyền truy cập và hành động đối với các đối tượng trong hạ tầng ảo hóa. 

### 1. **System**
![](https://img001.prntscr.com/file/img001/t5HJTHSISaaebW0phAnwJQ.png)

   Quyền **System** bao gồm một tập hợp các quyền điều khiển hoạt động của các thành phần hệ thống chính. Nhóm quyền này chủ yếu dành cho các dịch vụ hệ thống hoặc quản lý các hoạt động cấp thấp. Quyền **System** có thể bao gồm:

- Anonymous: Quyền **Anonymous** là một quyền hạn tối thiểu, thường dành cho người dùng không cần xác thực hoặc khi thực hiện các hành động cơ bản không yêu cầu quyền cụ thể. Người dùng có quyền này có thể thực hiện các tác vụ rất hạn chế trong hệ thống. Một số đặc quyền có thể bao gồm:

   - **Basic Access**: Truy cập vào các phần công khai của hệ thống mà không cần phải cung cấp thông tin xác thực.
   - **View Public Information**: Cho phép xem các thông tin cơ bản, không nhạy cảm, thường không bao gồm dữ liệu nhạy cảm hoặc cài đặt cấu hình.
   - **Limited Interaction**: Người dùng có thể thực hiện một số hành động công khai như gửi yêu cầu không yêu cầu xác thực, nhưng không có quyền ghi hoặc thay đổi bất kỳ thông tin nào.

- View: Quyền **View** cho phép người dùng xem nhưng không thay đổi bất kỳ đối tượng nào trong hệ thống. Đây là quyền đọc cơ bản, hữu ích cho những người dùng chỉ cần xem thông tin mà không can thiệp vào hoạt động của hệ thống. Một số đặc quyền của quyền View có thể bao gồm:

   - **View Objects**: Cho phép xem thông tin về các đối tượng như máy ảo, datastore, host, và cấu hình hệ thống.
   - **View Status**: Xem trạng thái hoạt động của hệ thống và các thành phần liên quan (ví dụ: xem mức độ sử dụng CPU hoặc RAM của các máy ảo).
   - **Access Logs**: Cho phép người dùng xem các bản ghi (logs) hệ thống để kiểm tra hoặc giám sát hoạt động nhưng không được chỉnh sửa nội dung các bản ghi.

- Read: Quyền **Read** cho phép người dùng truy cập và đọc các đối tượng hoặc tài nguyên trong hệ thống mà không có quyền thay đổi chúng. Khác với quyền View, quyền **Read** có thể cho phép xem chi tiết hơn về các cấu hình hoặc tài nguyên. Các đặc quyền thường bao gồm:

   - **Read Configurations**: Truy cập để đọc cấu hình của các đối tượng trong hệ thống (ví dụ: cấu hình máy ảo, thiết lập mạng).
   - **Read Data**: Cho phép người dùng đọc dữ liệu lưu trữ trên các datastore hoặc các tài nguyên khác mà không có quyền ghi hoặc xóa.
   - **Read-Only Access**: Người dùng có thể duyệt qua hệ thống và xem các thành phần chi tiết, nhưng không thể thực hiện thay đổi bất kỳ thông tin hoặc cấu hình nào.


### 2. **Global**
![](https://img001.prntscr.com/file/img001/AMM7GpaCQeykuuZ6ONh46A.png)
   Quyền **Global** cung cấp các quyền trên phạm vi toàn cục, cho phép thực hiện các tác vụ ảnh hưởng đến toàn bộ hệ thống. Các quyền trong nhóm này bao gồm:

   - **ManageCustomFields**: Quản lý các trường tùy chỉnh (custom fields) được sử dụng để thêm thông tin cho các đối tượng.
   - **SetCustomField**: Thiết lập giá trị cho các trường tùy chỉnh trên các đối tượng trong hệ thống.
   - **LogEvent**: Ghi nhật ký sự kiện vào các bản ghi hệ thống để theo dõi hành động của người dùng.
   - **CancelTask**: Hủy các tác vụ đang diễn ra trong hệ thống.
   - **Licenses**: Quản lý các giấy phép (licenses) trong hệ thống, bao gồm cài đặt và gỡ bỏ giấy phép.
   - **Diagnostics**: Truy cập vào các công cụ chẩn đoán hệ thống, cho phép kiểm tra sức khỏe và hiệu suất của hệ thống.
   - **Settings**: Điều chỉnh các cài đặt chung cho hệ thống, bao gồm cấu hình các chính sách và các cài đặt quan trọng khác.
   - **VCServer**: Quản lý máy chủ vCenter, bao gồm việc quản lý kết nối và trạng thái của máy chủ.
   - **CapacityPlanning**: Thực hiện các tác vụ liên quan đến lập kế hoạch năng lực (capacity planning) cho tài nguyên trong hệ thống.
   - **ScriptAction**: Chạy các tập lệnh hoặc thực hiện các hành động tự động trên hệ thống thông qua các kịch bản (scripts).
   - **Proxy**: Quản lý các cài đặt và dịch vụ proxy liên quan đến hệ thống.
   - **DisableMethods**: Vô hiệu hóa các phương thức quản lý nhất định trong hệ thống.
   - **EnableMethods**: Kích hoạt các phương thức quản lý nhất định trong hệ thống.
   - **ServiceManagers**: Quản lý các dịch vụ đang chạy trên hệ thống, bao gồm việc khởi động, dừng và quản lý các dịch vụ.
   - **Health**: Giám sát sức khỏe của hệ thống, theo dõi các báo cáo và cảnh báo về tình trạng hệ thống.
   - **SystemTag**: Quản lý các thẻ hệ thống, cho phép người dùng gắn thẻ các đối tượng trong hệ thống để quản lý dễ dàng hơn.
   - **GlobalTag**: Quản lý thẻ toàn cầu, giúp tổ chức và phân loại đối tượng trên toàn hệ thống.

### 3. **Folder**
![](https://img001.prntscr.com/file/img001/RtFbhydzSjqPEHJIya2AdQ.png)
   Quyền **Folder** cho phép quản lý các thư mục trong hệ thống. Các thư mục được sử dụng để tổ chức và phân loại các đối tượng như máy ảo, datastore, và tài nguyên khác. Các quyền bao gồm:
   
   - **Create Folder**: Tạo các thư mục mới trong hệ thống để tổ chức đối tượng.
   - **Delete Folder**: Xóa các thư mục hiện có và các đối tượng bên trong chúng.
   - **Move Folder**: Di chuyển các thư mục và các đối tượng giữa các cấp tổ chức khác nhau trong hệ thống.
   - **Rename Folder**: Đổi tên thư mục để giúp tổ chức dữ liệu dễ dàng hơn.

### 4. **Datacenter**

![](https://img001.prntscr.com/file/img001/kTSfj6tZT96cCicmT2HcOg.png)
   Quyền **Datacenter** liên quan đến việc quản lý các trung tâm dữ liệu (datacenter), cung cấp các quyền để điều khiển cấu trúc và hành động bên trong các datacenter. Quyền này bao gồm:

- **Create**: Quyền này cho phép người dùng tạo mới một đối tượng Datacenter trong môi trường vSphere. Khi có quyền này, người dùng có thể định cấu hình một Datacenter mới để quản lý các tài nguyên ảo hóa trong đó.

- **Delete**: Quyền này cho phép người dùng xóa một Datacenter hiện có. Đây là một quyền quan trọng vì việc xóa một Datacenter có thể ảnh hưởng đến toàn bộ cơ sở hạ tầng trong đó, bao gồm các máy ảo, host, và datastore liên quan.

- **Rename**: Quyền này cho phép người dùng đổi tên một Datacenter. Thay đổi tên không ảnh hưởng đến hoạt động của các tài nguyên bên trong Datacenter nhưng có thể giúp tổ chức và quản lý hệ thống một cách hợp lý hơn.

- **Move**: Quyền này cho phép người dùng di chuyển một Datacenter từ một vị trí này sang vị trí khác trong cấu trúc quản lý của vSphere. Điều này có thể bao gồm việc thay đổi cấu trúc thư mục hoặc tổ chức lại các tài nguyên.

- **IpPoolConfig**: Quyền này cho phép người dùng cấu hình các IP Pool trong Datacenter. IP Pool là một danh sách các địa chỉ IP được cấp phát cho các tài nguyên trong Datacenter, chẳng hạn như các máy ảo hoặc vApp.

- **IpPoolReleaseIp**: Quyền này cho phép người dùng giải phóng (release) các địa chỉ IP từ IP Pool đã được gán cho các tài nguyên. Khi một địa chỉ IP không còn được sử dụng, quyền này cho phép trả nó về pool để sử dụng lại.

- **IpPoolQueryAllocations**: Quyền này cho phép người dùng truy vấn và xem các thông tin về các địa chỉ IP đã được cấp phát từ IP Pool trong Datacenter. Điều này giúp quản lý tài nguyên mạng trong Datacenter một cách hiệu quả.

- **Reconfigure**: Quyền này cho phép người dùng thay đổi cấu hình của Datacenter, bao gồm việc điều chỉnh tài nguyên, thay đổi cài đặt hoặc thêm mới các cấu hình mạng, lưu trữ và máy ảo trong Datacenter.


### 5. **Datastore**
![](https://img001.prntscr.com/file/img001/iqgFg7lOSWCMSXsDpbAAgw.png)
   Quyền **Datastore** liên quan đến việc quản lý kho dữ liệu (datastore), nơi lưu trữ các tệp tin máy ảo và các dữ liệu khác. Các quyền bao gồm:
   
   ### **Datastore**
 Các quyền liên quan đến **Datastore** cho phép người dùng thực hiện các thao tác quan trọng trên các kho lưu trữ này. Dưới đây là chi tiết về từng quyền trong mục **Datastore**:

- **Rename**: Quyền này cho phép người dùng thay đổi tên của một **Datastore**. Thao tác đổi tên không ảnh hưởng đến dữ liệu lưu trữ trong **Datastore**, nhưng giúp quản lý và tổ chức các kho lưu trữ dễ dàng hơn.

- **Move**: Quyền này cho phép người dùng di chuyển các tệp tin và đối tượng từ **Datastore** này sang **Datastore** khác. Điều này thường được sử dụng khi cần tối ưu hóa hoặc tái tổ chức tài nguyên lưu trữ.

- **Delete**: Quyền này cho phép người dùng xóa một **Datastore** hoàn toàn khỏi hệ thống. Đây là một thao tác có tính rủi ro cao vì tất cả dữ liệu trong **Datastore** sẽ bị mất, nên thường chỉ được cấp cho người dùng có quyền quản trị.

- **Browse**: Quyền này cho phép người dùng duyệt qua nội dung của **Datastore**, bao gồm việc xem các tệp tin và thư mục được lưu trữ trong đó. Đây là quyền cơ bản thường được cấp cho nhiều người dùng để họ có thể truy cập và kiểm tra các tệp tin.

- **DeleteFile**: Quyền này cho phép người dùng xóa các tệp tin hoặc thư mục cụ thể bên trong **Datastore**. Người dùng có thể loại bỏ các tệp tin không còn cần thiết, chẳng hạn như ảnh snapshot cũ hoặc tệp ISO.

- **FileManagement**: Quyền này bao gồm các hoạt động quản lý tệp tin khác, như tạo mới thư mục, di chuyển hoặc sao chép tệp tin trong **Datastore**. Quyền này giúp người dùng có thể tổ chức lại các tệp tin trong kho lưu trữ một cách hợp lý.

- **AllocateSpace**: Quyền này cho phép người dùng phân bổ dung lượng trong **Datastore** cho các máy ảo hoặc các tệp tin mới. Quyền này rất quan trọng khi tạo hoặc mở rộng các tệp tin đĩa ảo (VMDK) trong **Datastore**.

- **Config**: Quyền này cho phép người dùng thay đổi cấu hình của **Datastore**, bao gồm việc thay đổi cách thức quản lý dung lượng và hiệu năng của kho lưu trữ.

- **UpdateVirtualMachineFiles**: Quyền này cho phép người dùng cập nhật các tệp tin liên quan đến máy ảo bên trong **Datastore**, chẳng hạn như việc sửa đổi hoặc thay thế các tệp cấu hình máy ảo (VMX) hoặc các tệp đĩa ảo (VMDK).

- **UpdateVirtualMachineMetadata**: Quyền này cho phép người dùng cập nhật các thông tin siêu dữ liệu của máy ảo được lưu trữ trong **Datastore**. Siêu dữ liệu có thể bao gồm các thông tin về cấu hình, trạng thái của máy ảo hoặc các thông tin khác liên quan đến quản lý máy ảo.

### 6. **Network**
![](https://img001.prntscr.com/file/img001/g1QkAS81SHeaUHPEjBNEqg.png)


 **Network** là một thành phần cốt lõi dùng để quản lý các kết nối mạng cho các máy ảo và hạ tầng ảo hóa. Các quyền liên quan đến **Network** cho phép người dùng thực hiện các thao tác trên mạng ảo, bao gồm di chuyển, xóa và cấu hình các thiết lập mạng cho các máy ảo. Dưới đây là chi tiết về các quyền trong mục **Network**:

- **Move**: Quyền này cho phép người dùng di chuyển các đối tượng mạng như **Port Groups** hoặc **Distributed Port Groups** từ một mạng ảo này sang một mạng ảo khác. Điều này hữu ích khi cần tái cấu trúc hoặc điều chỉnh lại hạ tầng mạng của hệ thống.

- **Delete**: Quyền này cho phép người dùng xóa các đối tượng mạng trong hệ thống như **Port Groups**, **vSwitches** hoặc **Distributed vSwitches**. Đây là thao tác có thể gây gián đoạn mạng cho các máy ảo nếu không được thực hiện cẩn thận.

- **Config**: Quyền này cho phép người dùng cấu hình các thành phần của mạng ảo, bao gồm việc tạo, chỉnh sửa các **Port Groups**, **vSwitches**, và các chính sách liên quan đến bảo mật, phân bổ băng thông và xử lý lỗi. Đây là quyền quan trọng giúp quản trị viên kiểm soát các chính sách và luồng dữ liệu trên mạng ảo.

- **Assign**: Quyền này cho phép người dùng gán mạng ảo cho các máy ảo hoặc các đối tượng khác trong môi trường ảo hóa. Điều này có nghĩa là người dùng có thể kết nối các máy ảo với các mạng cụ thể, giúp máy ảo có thể giao tiếp với các thành phần mạng khác trong hạ tầng ảo hóa.

### 7. **DVSwitch**
![](https://img001.prntscr.com/file/img001/ZKEcMkEhRmWp8NZR-I4kUw.png)

### **DVSwitch** (Distributed Virtual Switch)
 **DVSwitch** (Distributed Virtual Switch) là một thành phần quan trọng trong việc quản lý mạng phân tán, giúp quản trị viên cấu hình và quản lý mạng ảo trên nhiều máy chủ ESXi từ một vị trí trung tâm. Các quyền liên quan đến **DVSwitch** giúp kiểm soát việc tạo, cấu hình, và quản lý các **Distributed Virtual Switches**  và các thành phần liên quan. Dưới đây là mô tả chi tiết về từng quyền trong mục **DVSwitch**:

- **Create**: Quyền này cho phép người dùng tạo **Distributed Virtual Switches** (DVSwitch) mới. Việc tạo DVSwitch cho phép quản trị viên triển khai một hệ thống mạng phân tán ảo hóa trên nhiều máy chủ ESXi, cung cấp tính nhất quán và đơn giản hóa việc quản lý mạng.

- **Delete**: Quyền này cho phép người dùng xóa một **DVSwitch**. Việc xóa một DVSwitch có thể ảnh hưởng đến các máy chủ và máy ảo được kết nối với nó, do đó, quyền này cần được cấp một cách cẩn trọng.

- **Move**: Quyền này cho phép người dùng di chuyển các thành phần mạng, bao gồm cổng và nhóm cổng, từ một DVSwitch sang một DVSwitch khác.

- **Modify**: Quyền này cho phép người dùng thay đổi các thiết lập cấu hình của một **DVSwitch**. Người dùng có thể sửa đổi các thiết lập như chính sách bảo mật, QoS (Quality of Service), và các thông số liên quan đến hiệu suất.

- **HostOp**: Quyền này cho phép người dùng thêm hoặc loại bỏ các máy chủ ESXi khỏi một **DVSwitch**. Điều này rất quan trọng để mở rộng hoặc thu hẹp quy mô mạng phân tán của hạ tầng ảo hóa.

- **PolicyOp**: Quyền này cho phép người dùng thay đổi các chính sách liên quan đến DVSwitch, bao gồm các chính sách bảo mật, kiểm soát truy cập, và điều chỉnh băng thông. Điều này giúp quản trị viên kiểm soát các giao thức mạng và đảm bảo an toàn mạng.

- **PortConfig**: Quyền này cho phép người dùng cấu hình các cổng của **DVSwitch**, bao gồm việc thiết lập các nhóm cổng, kiểm soát việc cấp phát tài nguyên mạng và gán các máy ảo vào các nhóm cổng cụ thể.

- **PortSetting**: Quyền này cho phép người dùng cấu hình các thiết lập riêng lẻ cho từng cổng trên DVSwitch, chẳng hạn như gán VLAN, thiết lập băng thông, và cấu hình bảo mật cho từng cổng.

- **Vspan**: Quyền này cho phép người dùng cấu hình **vSPAN** (Virtual Switch Port Analyzer), tính năng giúp phân tích lưu lượng mạng cho mục đích giám sát và xử lý sự cố.

- **Ipfix**: Quyền này cho phép người dùng cấu hình **IPFIX** (Internet Protocol Flow Information Export), một tính năng theo dõi luồng dữ liệu trong DVSwitch để phân tích hiệu suất mạng và phát hiện sự cố.

- **ResourceManagement**: Quyền này cho phép người dùng quản lý tài nguyên mạng được phân bổ cho DVSwitch, bao gồm việc kiểm soát sử dụng băng thông và đảm bảo tính nhất quán trong việc cấp phát tài nguyên mạng.


### 8. **DVPortgroup**
![](https://img001.prntscr.com/file/img001/3CSqGsF4SDGE2cuYmLPbtg.png)
  **DVPortgroup** (Nhóm cổng ảo phân tán) là một thành phần quan trọng trong việc quản lý mạng ảo hóa. Nó cho phép quản trị viên tổ chức và phân loại các cổng ảo được kết nối với các máy ảo trên một **Distributed Virtual Switch** (DVSwitch). Dưới đây là mô tả chi tiết về từng quyền trong mục **DVPortgroup**:

- **Create**: Quyền này cho phép người dùng tạo các **DVPortgroups** mới. Việc tạo DVPortgroup giúp tổ chức các cổng ảo theo nhóm dựa trên nhu cầu sử dụng, như theo ứng dụng, nhóm dự án hoặc phân loại theo cấp độ bảo mật.

- **Modify**: Quyền này cho phép người dùng thay đổi cấu hình của một **DVPortgroup** hiện có. Người dùng có thể điều chỉnh các thiết lập như VLAN, chính sách bảo mật và QoS (Quality of Service) để tối ưu hóa hiệu suất mạng cho các máy ảo được kết nối.

- **PolicyOp**: Quyền này cho phép người dùng thay đổi các chính sách liên quan đến **DVPortgroup**, bao gồm các chính sách bảo mật và kiểm soát lưu lượng mạng. Điều này giúp quản trị viên điều chỉnh cách thức mà lưu lượng được quản lý trong nhóm cổng.

- **ScopeOp**: Quyền này cho phép người dùng xác định phạm vi của một **DVPortgroup**. Điều này có nghĩa là người dùng có thể chỉ định các máy ảo nào có thể sử dụng nhóm cổng này, đảm bảo rằng chỉ những máy ảo hợp lệ mới có thể truy cập vào nhóm cổng.

- **Ipfix**: Quyền này cho phép người dùng cấu hình **IPFIX** (Internet Protocol Flow Information Export) cho **DVPortgroup**. Tính năng này giúp theo dõi và phân tích lưu lượng mạng, cung cấp thông tin chi tiết về việc sử dụng băng thông và phát hiện các vấn đề mạng.

- **Delete**: Quyền này cho phép người dùng xóa một **DVPortgroup**. Việc xóa DVPortgroup có thể ảnh hưởng đến các máy ảo đang sử dụng nhóm cổng đó, vì vậy quyền này cần được cấp phát cẩn thận.


### 9. **Host**
   Quyền **Host** liên quan đến việc quản lý các máy chủ vật lý (host) ESXi. Quyền này bao gồm:
   
   - **Add Host**: Thêm một máy chủ mới vào trung tâm dữ liệu hoặc cluster.
   - **Remove Host**: Xóa một máy chủ khỏi trung tâm dữ liệu.
   - **Configure Host**: Thay đổi cấu hình của máy chủ, bao gồm cài đặt mạng, lưu trữ, và bảo mật.

### 10. **VirtualMachine**
   Quyền **VirtualMachine** cung cấp các quyền quản lý máy ảo, bao gồm khởi động, tắt, di chuyển, sao chép và thay đổi cấu hình của máy ảo. Các quyền cụ thể bao gồm:
   
   - **Power On/Off**: Bật hoặc tắt máy ảo.
   - **Migrate VM**: Di chuyển máy ảo giữa các host hoặc datastore.
   - **Clone VM**: Tạo bản sao của máy ảo.
   - **Modify VM Settings**: Thay đổi cấu hình phần cứng và phần mềm của máy ảo.

### 11. **Resource**
   Quyền **Resource** cho phép quản lý các nhóm tài nguyên (Resource Pools), nơi các tài nguyên như CPU, RAM, và lưu trữ được phân bổ cho máy ảo. Các quyền bao gồm:
   
   - **Create Resource Pool**: Tạo nhóm tài nguyên mới.
   - **Delete Resource Pool**: Xóa nhóm tài nguyên hiện có.
   - **Modify Resource Pool**: Thay đổi cấu hình của nhóm tài nguyên, bao gồm việc điều chỉnh tài nguyên cho các máy ảo.

### 12. **Alarm**
   Quyền **Alarm** liên quan đến việc quản lý các cảnh báo trong hệ thống, bao gồm:
   
   - **Create Alarm**: Tạo các cảnh báo mới cho các đối tượng như máy ảo, host, hoặc datastore.
   - **Modify Alarm**: Thay đổi cấu hình của các cảnh báo hiện có.
   - **Acknowledge Alarm**: Xác nhận cảnh báo đã được xử lý.

### 13. **Task**
   Quyền **Task** điều khiển việc quản lý và thao tác các tác vụ trong hệ thống, bao gồm việc theo dõi, hủy, hoặc quản lý các tác vụ đang chạy hoặc đã hoàn thành. Các quyền trong nhóm này bao gồm:

   - **Create Task**: Tạo các tác vụ mới trong hệ thống (ví dụ: di chuyển máy ảo, sao chép dữ liệu).
   - **Modify Task**: Thay đổi trạng thái hoặc thuộc tính của các tác vụ hiện có.
   - **Cancel Task**: Hủy các tác vụ đang diễn ra, đặc biệt hữu ích khi cần ngừng những hành động không mong muốn hoặc sai sót.
   - **View Task**: Xem và theo dõi các tác vụ trong danh sách công việc, kiểm tra tiến độ và kết quả của các tác vụ đã hoàn thành.

### 14. **ScheduledTask**
   Quyền **ScheduledTask** cho phép quản lý các tác vụ được lên lịch tự động trong tương lai. Điều này đặc biệt hữu ích cho các hoạt động bảo trì hoặc kiểm soát hệ thống định kỳ. Các quyền bao gồm:

   - **Create Scheduled Task**: Tạo các tác vụ được lên lịch tự động thực hiện vào một thời điểm cụ thể.
   - **Modify Scheduled Task**: Thay đổi lịch trình hoặc thuộc tính của các tác vụ đã được lập lịch.
   - **Delete Scheduled Task**: Xóa các tác vụ đã lên lịch mà không cần phải thực hiện chúng.
   - **Run Scheduled Task**: Kích hoạt các tác vụ đã được lập lịch để chạy ngay lập tức.

### 15. **Sessions**
   Quyền **Sessions** quản lý các phiên làm việc của người dùng và quản trị viên trên hệ thống ESXi. Việc theo dõi và kiểm soát các phiên truy cập là rất quan trọng trong môi trường quản lý lớn. Các quyền bao gồm:

   - **View Sessions**: Xem danh sách các phiên truy cập của người dùng hiện tại và các phiên đã đăng nhập.
   - **Terminate Session**: Kết thúc hoặc hủy bỏ các phiên truy cập của người dùng, hữu ích trong trường hợp có truy cập trái phép hoặc cần bảo trì.
   - **Modify Session**: Thay đổi các thuộc tính liên quan đến phiên truy cập (ví dụ: thời gian hết hạn của phiên).

### 16. **Performance**
   Quyền **Performance** điều khiển quyền truy cập vào dữ liệu và công cụ phân tích hiệu suất của hệ thống. Các quyền này cho phép người dùng theo dõi hiệu suất của máy ảo, máy chủ vật lý, và các thành phần khác:

   - **View Performance**: Xem dữ liệu hiệu suất của các đối tượng trong hệ thống như CPU, RAM, và I/O.
   - **Modify Performance Counters**: Thay đổi cài đặt của các bộ đếm hiệu suất để điều chỉnh cách thức thu thập dữ liệu.
   - **Export Performance Data**: Xuất dữ liệu hiệu suất ra ngoài để phân tích thêm hoặc lưu trữ.

### 17. **Authorization**
   Quyền **Authorization** liên quan đến việc quản lý hệ thống phân quyền và xác thực trong môi trường VMware. Các quyền này giúp quản trị viên thiết lập và quản lý người dùng, nhóm và vai trò. Các quyền bao gồm:

   - **Manage Roles**: Tạo, xóa, hoặc chỉnh sửa vai trò trong hệ thống.
   - **Assign Roles**: Gán các vai trò cho người dùng hoặc nhóm để điều khiển quyền truy cập vào các đối tượng và tác vụ.
   - **Modify Permissions**: Thay đổi quyền truy cập cho người dùng hoặc nhóm dựa trên vai trò đã được gán.
   - **View Permissions**: Xem quyền hiện có của người dùng và nhóm để hiểu được ai có quyền gì trên các đối tượng.

### 18. **Extension**
   Quyền **Extension** cho phép quản lý các tiện ích mở rộng (extensions) được cài đặt trong hệ thống vSphere, như các plugin hoặc phần mềm bên thứ ba tích hợp. Các quyền bao gồm:

   - **Register Extension**: Đăng ký một tiện ích mở rộng mới vào vSphere.
   - **Unregister Extension**: Hủy đăng ký hoặc gỡ bỏ một tiện ích mở rộng khỏi hệ thống.
   - **View Extension**: Xem thông tin về các tiện ích mở rộng đã được cài đặt.

### 19. **VApp**
   Quyền **VApp** điều khiển các ứng dụng ảo hóa (vApp), là một tập hợp các máy ảo và tài nguyên khác được quản lý như một thực thể duy nhất. Các quyền bao gồm:

   - **Create vApp**: Tạo một ứng dụng ảo mới.
   - **Delete vApp**: Xóa một ứng dụng ảo cùng với tất cả các máy ảo và tài nguyên bên trong.
   - **Modify vApp Settings**: Thay đổi cấu hình của một ứng dụng ảo, bao gồm việc phân bổ tài nguyên và chính sách.

### 20. **Profile**
   Quyền **Profile** cho phép quản lý cấu hình và hồ sơ của máy chủ ESXi và vSphere. Các quyền này rất quan trọng trong việc tự động hóa cấu hình và duy trì sự nhất quán trong môi trường ảo hóa:

   - **Create Profile**: Tạo hồ sơ cấu hình mới để sử dụng trên các máy chủ ESXi.
   - **Edit Profile**: Chỉnh sửa hồ sơ cấu hình hiện có để cập nhật các thiết lập.
   - **Apply Profile**: Áp dụng hồ sơ cấu hình lên máy chủ hoặc đối tượng.
   - **Delete Profile**: Xóa các hồ sơ cấu hình không còn sử dụng.

### 21. **EAM (ESX Agent Manager)**
   Quyền **EAM** điều khiển việc quản lý ESX Agent Manager, công cụ quản lý các tác nhân (agent) chạy trên ESXi. Các quyền bao gồm:

   - **Register Agent**: Đăng ký các tác nhân mới vào ESX Agent Manager.
   - **Unregister Agent**: Hủy đăng ký hoặc gỡ bỏ các tác nhân khỏi hệ thống.
   - **View Agent**: Xem thông tin về các tác nhân đã được đăng ký.

### 22. **StoragePod**
   Quyền **StoragePod** cho phép quản lý các nhóm lưu trữ (storage pods) trong hệ thống. Storage Pods tập hợp nhiều datastore thành một nhóm để quản lý dễ dàng hơn. Các quyền bao gồm:

   - **Create StoragePod**: Tạo một nhóm lưu trữ mới.
   - **Delete StoragePod**: Xóa một nhóm lưu trữ và tất cả các datastore bên trong.
   - **Modify StoragePod**: Thay đổi cấu hình của nhóm lưu trữ, bao gồm việc thêm hoặc xóa các datastore.

### 23. **Certificate**
   Quyền **Certificate** cho phép quản lý chứng chỉ bảo mật trong hệ thống, đảm bảo các kết nối an toàn giữa các thành phần của vSphere. Các quyền bao gồm:

   - **Manage Certificates**: Quản lý chứng chỉ SSL/TLS cho các máy chủ ESXi và các thành phần khác.
   - **View Certificates**: Xem các chứng chỉ hiện có và các thuộc tính của chúng.
   - **Revoke Certificates**: Thu hồi chứng chỉ khi không còn sử dụng hoặc khi chúng bị xâm phạm.

### 24. **HealthUpdateProvider**
   Quyền **HealthUpdateProvider** cho phép quản lý các nhà cung cấp cập nhật sức khỏe hệ thống, bao gồm việc giám sát tình trạng và bảo trì định kỳ các thành phần của hạ tầng ảo hóa.

   - **Register Health Provider**: Đăng ký nhà cung cấp dịch vụ theo dõi sức khỏe mới vào hệ thống.
   - **Unregister Health Provider**: Hủy đăng ký hoặc gỡ bỏ nhà cung cấp dịch vụ sức khỏe khỏi hệ thống.
   - **View Health Status**: Xem thông tin và trạng thái sức khỏe của các đối tượng trong hệ thống.

### 25. **ExternalStatsProvider**
   Quyền **ExternalStatsProvider** điều khiển việc quản lý các nhà cung cấp số liệu thống kê bên ngoài, thường là các dịch vụ tích hợp với vSphere để cung cấp phân tích sâu hơn về hiệu suất.

   - **Register Stats Provider**: Đăng ký nhà cung cấp thống kê bên ngoài.
   - **Unregister Stats Provider**: Hủy đăng ký hoặc gỡ bỏ nhà cung cấp thống kê khỏi hệ thống.
   - **View Stats**: Xem dữ liệu thống kê do nhà cung cấp cung cấp.

### 26. **Cryptographer**
   Quyền **Cryptographer** liên quan đến quản lý các hoạt động mã hóa trong hệ thống, bao gồm bảo vệ dữ liệu nhạy cảm và quản lý khóa mã hóa:

   - **Encrypt/Decrypt Virtual Machines**: Thực hiện việc mã hóa hoặc giải mã máy ảo và dữ liệu của chúng.
   - **Manage Encryption Keys**: Quản lý khóa mã hóa, bao gồm tạo, lưu trữ và hủy các khóa này.
   - **Rotate Encryption Keys**: Thay đổi khóa mã hóa định kỳ để tăng cường bảo mật.

