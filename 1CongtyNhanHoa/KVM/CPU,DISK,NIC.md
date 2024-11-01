Mô tả chi tiết về các lựa chọn của đĩa (disk) khi cấu hình máy ảo (VM) trong KVM thông qua Virt-Manager:

# DISK
![](https://img001.prntscr.com/file/img001/UWMot3u2SuOUowBzBDfe2Q.png)
### 1. Tùy Chọn Đĩa
#### 1.1. Readonly
- **Readonly**: Khi được bật, tùy chọn này cho phép máy ảo chỉ đọc đĩa, tức là không thể ghi dữ liệu vào. Điều này thường được sử dụng trong các trường hợp như khôi phục dữ liệu hoặc bảo vệ dữ liệu khỏi sự thay đổi.

#### 1.2. Shareable
- **Shareable**: Tùy chọn này cho phép đĩa được chia sẻ giữa nhiều máy ảo. Khi được kích hoạt, nhiều VM có thể truy cập vào cùng một hình ảnh đĩa, điều này hữu ích trong các tình huống như môi trường phát triển hoặc thử nghiệm.
![](https://img001.prntscr.com/file/img001/7Y8CXCqdQsG-s6-ZLXykMQ.png)
### 2. Tùy Chọn Nâng Cao (Advanced Options)
#### 2.1. Disk Bus
- **Disk Bus**: Chọn loại bus cho ổ đĩa. Các loại bus phổ biến bao gồm:
  - **VirtIO**: Tối ưu hóa cho ảo hóa, cung cấp hiệu suất cao với độ trễ thấp.
  - **IDE**: Tương thích với nhiều hệ điều hành, nhưng không tối ưu cho hiệu suất.
  - **SATA**: Tương tự như IDE, nhưng hỗ trợ nhiều tính năng hiện đại hơn.
  - **SCSI**: Hỗ trợ cho nhiều ổ đĩa và thiết bị hơn, thường được sử dụng trong các máy chủ.
  - **USB**: Sử dụng cho các thiết bị USB ảo.

#### 2.2. Serial Number
- **Serial Number**: Mã số duy nhất cho ổ đĩa, có thể được sử dụng để xác định và quản lý ổ đĩa trong môi trường ảo hóa.

#### 2.3. Storage Format
- **Storage Format**: Chọn định dạng lưu trữ cho hình ảnh đĩa. Một số định dạng phổ biến bao gồm:
  - **qcow2**: Hỗ trợ các tính năng như nén và snapshot, tiết kiệm dung lượng lưu trữ.
  - **raw**: Định dạng không có cấu trúc, cung cấp hiệu suất tối ưu nhưng không hỗ trợ tính năng nâng cao như qcow2.

### 3. Tùy Chọn Hiệu Suất (Performance Options)
#### 3.1. Cache Mode
- **Cache Mode**: Tùy chọn cấu hình bộ nhớ đệm cho ổ đĩa. Các chế độ bao gồm:
  - **Hypervisor Default**: Sử dụng cấu hình mặc định của hypervisor.
  - **None**: Không sử dụng bộ nhớ đệm.
  - **Write-through**: Dữ liệu được ghi cả vào bộ nhớ đệm và đĩa cứng.
  - **Write-back**: Dữ liệu chỉ được ghi vào bộ nhớ đệm trước, tăng tốc độ ghi nhưng có rủi ro mất dữ liệu.
  - **Directsync**: Ghi trực tiếp vào đĩa với chế độ đồng bộ, giảm hiệu suất nhưng an toàn hơn.
  - **Unsafe**: Không đảm bảo an toàn cho dữ liệu, cho phép ghi trực tiếp mà không có bất kỳ bộ đệm nào.

#### 3.2. IO Mode
- **IO Mode**: Tùy chọn cấu hình chế độ I/O cho đĩa. Các chế độ bao gồm:
  - **Hypervisor Default**: Sử dụng chế độ mặc định của hypervisor.
  - **Native**: Sử dụng giao diện I/O gốc của hệ điều hành khách.
  - **Threads**: Sử dụng nhiều luồng để tối ưu hóa hiệu suất I/O, cho phép xử lý đồng thời nhiều yêu cầu.



# CPU

### 1. **CPUs**
![](https://img001.prntscr.com/file/img001/ARIFUyusRTS9yiEJ0z4I7g.png)
- **Logical Host CPUs**: 
  - **Mô tả**: Số lượng CPU vật lý (logical CPUs) mà máy chủ đang có.
  - **Ví dụ**: Nếu máy chủ có 6 CPU logic, bạn có thể sử dụng tối đa 6 vCPU cho máy ảo.

- **Current Allocation**: 
  - **Mô tả**: Số lượng CPU ảo (vCPU) hiện tại mà máy ảo đang sử dụng.
  - **Ví dụ**: Nếu bạn đã chỉ định 2 vCPU cho máy ảo, thì current allocation sẽ là 2.

- **Maximum Allocation**: 
  - **Mô tả**: Số lượng vCPU tối đa mà máy ảo có thể sử dụng.
  - **Ví dụ**: Trong trường hợp này, nếu maximum allocation là 2, máy ảo không thể sử dụng nhiều hơn 2 vCPU.

### 2. **Configuration**
- **Copy Host CPU Configuration**: 
  - **Mô tả**: Tùy chọn này cho phép máy ảo sử dụng cấu hình CPU giống như CPU của máy chủ vật lý.
  - **Lợi ích**: Đảm bảo tính tương thích tốt hơn với các ứng dụng chạy trên máy ảo.

- **Model**: 
  - **Mô tả**: Chọn mô hình CPU cho máy ảo. Có một số lựa chọn như:
    - **Application Default**: Sử dụng mô hình mặc định cho ứng dụng.
    - **Hypervisor Default**: Sử dụng mô hình mặc định cho hypervisor.
    - **Broadwell-IBRS**: Sử dụng mô hình CPU Broadwell với tính năng bảo mật IBRS (Indirect Branch Restricted Speculation).
  - **Ví dụ**: Chọn `Broadwell-IBRS` nếu bạn đang chạy ứng dụng cần bảo mật cao.

### 3. **Topology**
- **Manually Set CPU Topology**: 
  - **Mô tả**: Cho phép cấu hình cấu trúc CPU cho máy ảo bằng tay.
  - **Tùy chọn bao gồm**:
    - **Socket**: Số lượng socket (bó) CPU cho máy ảo. Mỗi socket có thể chứa một hoặc nhiều core.
    - **Cores**: Số lượng core trong mỗi socket. Nếu bạn có 2 sockets và mỗi socket có 2 cores, tổng số vCPU sẽ là 4.
    - **Threads**: Số lượng thread trên mỗi core. Tính năng Hyper-Threading cho phép mỗi core xử lý nhiều hơn một luồng dữ liệu. 
  - **Ví dụ**: Nếu bạn cấu hình máy ảo với 1 socket, 2 cores, và 2 threads, tổng số vCPU sẽ là 4.




# NETWORK
![](https://img001.prntscr.com/file/img001/74E-VUriQTKImLG3aCysSQ.png)
### 1. **Virtual Network Interface**
#### a. **Network Source**
- **Mô tả**: Chọn nguồn mạng mà máy ảo sẽ sử dụng để kết nối mạng.
- **Tùy chọn bao gồm**:
  - **Source Mode**:
    - **Bridge**: 
      - Kết nối máy ảo trực tiếp vào mạng vật lý thông qua một bridge, cho phép máy ảo nhận địa chỉ IP từ DHCP và giao tiếp với các thiết bị trong mạng vật lý.
      - **Ví dụ**: Khi bạn sử dụng bridge, máy ảo sẽ có thể truy cập Internet như một thiết bị trong mạng nội bộ.
    - **Vepa** (Virtual Ethernet Port Aggregator): 
      - Tương tự như bridge, nhưng hỗ trợ các tính năng bảo mật và phân tách mạng tốt hơn.
      - **Ví dụ**: Thích hợp cho môi trường có nhiều máy ảo cần quản lý và bảo mật riêng biệt.
    - **Private**: 
      - Tạo một mạng riêng giữa các máy ảo mà không kết nối đến mạng vật lý. Chỉ các máy ảo trong cùng mạng mới có thể giao tiếp với nhau.
      - **Ví dụ**: Dùng để thử nghiệm và phát triển mà không cần ảnh hưởng đến mạng bên ngoài.
    - **Passthrough**: 
      - Cho phép máy ảo truy cập trực tiếp vào thiết bị mạng vật lý (NIC) trên máy chủ.
      - **Ví dụ**: Cần thiết cho các ứng dụng yêu cầu hiệu suất mạng cao, như trong các môi trường đòi hỏi băng thông lớn.

#### b. **Device Mode**
- **Mô tả**: Chọn loại thiết bị mạng ảo mà máy ảo sẽ sử dụng.
- **Tùy chọn bao gồm**:
  - **e1000**: 
    - Mô phỏng thiết bị mạng Intel e1000, tương thích tốt với nhiều hệ điều hành nhưng không phải là lựa chọn tối ưu cho hiệu suất.
  - **rtl8139**: 
    - Mô phỏng thiết bị mạng Realtek RTL8139, cũng có độ tương thích cao nhưng hiệu suất không tốt bằng các tùy chọn hiện đại hơn.
  - **virtio**: 
    - Tối ưu hóa cho ảo hóa, cung cấp hiệu suất cao với độ trễ thấp. Đây là lựa chọn tốt nhất cho môi trường ảo hóa.
  
### 2. **Virtual Port**
#### a. **Type**
- **Mô tả**: Loại cổng ảo mà bạn muốn tạo cho máy ảo.
- **Tùy chọn có thể bao gồm**: Các loại cổng khác nhau để kết nối mạng, chẳng hạn như `bridge`, `tap`, hoặc `vhostuser`.

#### b. **ManagerID**
- **Mô tả**: ID của trình quản lý cổng ảo, thường được sử dụng để xác định cổng trong các hệ thống mạng phức tạp.
  
#### c. **TypeID**
- **Mô tả**: ID loại cổng, giúp xác định rõ hơn loại kết nối mà cổng ảo sử dụng.
  
#### d. **TypeID Version**
- **Mô tả**: Phiên bản của loại cổng, đảm bảo rằng các cổng tương thích với các phiên bản phần mềm và thiết bị khác nhau.
  
#### e. **Instance ID**
- **Mô tả**: ID của phiên bản cổng ảo, giúp phân biệt giữa các cổng ảo khác nhau trong hệ thống.
 
