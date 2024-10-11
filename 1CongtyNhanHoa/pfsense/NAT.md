### Các bước cấu hình NAT Local Internet trên pfSense:

#### 1. **Đăng nhập vào giao diện web của pfSense**:
  
   - Đăng nhập bằng tài khoản quản trị.

#### 2. **Kiểm tra cấu hình Gateway**:
   - Đảm bảo rằng pfSense đã được cấu hình với **Gateway WAN** chính xác để có thể kết nối ra ngoài internet.
   - Kiểm tra ở **System > Routing > Gateways** và đảm bảo rằng **Gateway** tương ứng với giao diện WAN đang ở trạng thái **Online**.
![](https://img001.prntscr.com/file/img001/reM95kGYR0KaagA82vwAZw.png)
#### 3. **Cấu hình Outbound NAT**:
   - Truy cập vào **Firewall > NAT**.
   - Chọn tab **Outbound**.
   - Bạn sẽ thấy hai tùy chọn: **Automatic Outbound NAT rule generation** và **Manual Outbound NAT rule generation**.
     - Mặc định, **pfSense** sử dụng **Automatic Outbound NAT**, tức là pfSense tự động tạo các quy tắc NAT cho mạng nội bộ ra ngoài internet.
     - Nếu bạn muốn tùy chỉnh các quy tắc NAT, hãy chọn **Manual Outbound NAT** rồi nhấn **Save**.
![](https://img001.prntscr.com/file/img001/a3sfwfPDS-KrfwK36m0jiA.png)
#### 4. **Thêm quy tắc NAT thủ công (nếu cần)**:

![](https://img001.prntscr.com/file/img001/O1oaZwKUTK2i1DVP1ri2tA.png)
   - Sau khi chuyển sang **Manual Outbound NAT**, nhấn vào **Add** (+) để thêm quy tắc NAT.
   - Cấu hình như sau:
     - **Interface**: Chọn **WAN** (giao diện mà bạn sử dụng để kết nối ra ngoài internet).
     - **Source**: Đặt là mạng nội bộ của bạn (LAN subnets).
     - **Source Port Range**: Đặt là **any**.
     - **Destination**: Chọn **any** để NAT tất cả các đích.
     - **Translation / target**: Chọn **interface address** để sử dụng địa chỉ IP của giao diện WAN.
   - Nhấn **Save** rồi nhấn **Apply Changes** để lưu và áp dụng thay đổi.
![](https://img001.prntscr.com/file/img001/FkpQt9S3RN2HCN7b81ZRxQ.png)
#### 5. **Kiểm tra cấu hình Firewall Rules trên giao diện LAN**:
   - Truy cập **Firewall > Rules**.
   - Chọn tab **LAN** và đảm bảo rằng bạn có một quy tắc **Allow** cho phép tất cả lưu lượng từ mạng LAN ra ngoài internet. Quy tắc này thường sẽ trông như sau:
     - **Action**: Pass
     - **Interface**: LAN
     - **Source**: LAN net
     - **Destination**: any (cho phép kết nối đến mọi địa chỉ).
![](https://img001.prntscr.com/file/img001/uzOP_2xNSTmjNK548EMYxQ.png)  


#### 6. **Kiểm tra kết nối Internet**:
   - Kiểm tra từ một thiết bị trong mạng nội bộ để xem liệu nó có thể truy cập internet hay không.
   - Nếu thiết bị có thể duyệt web và truy cập internet, cấu hình NAT đã được thiết lập đúng cách.

### Những lưu ý khi thiết lập NAT trên pfSense:
- **Dynamic vs. Static IP**: Nếu bạn có địa chỉ IP công cộng động từ nhà cung cấp dịch vụ internet, hãy đảm bảo chọn **interface address** trong phần **Translation** để pfSense tự động sử dụng IP hiện tại của WAN.


![](https://img001.prntscr.com/file/img001/65EjmfAnRNOnxHTQ643yBg.png)
![](https://img001.prntscr.com/file/img001/m3T2KIObSsahNDQcwr5qvg.png)
