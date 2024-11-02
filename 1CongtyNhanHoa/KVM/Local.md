
### 1. Nơi lưu trữ máy ảo
Trong KVM, máy ảo thường được lưu trữ trong thư mục `/var/lib/libvirt/images/`. Tuy nhiên, vị trí này có thể thay đổi tùy thuộc vào cấu hình của bạn. Bạn có thể kiểm tra thư mục này bằng lệnh sau:

```bash
ls /var/lib/libvirt/images/
```
![](	https://img001.prntscr.com/file/img001/BmlwlGicThiXi2_S5I3oBw.png)

![](https://img001.prntscr.com/file/img001/RvQkGFM0SlafReoA1tqvDQ.png)
### 2. Các tệp tin trong thư mục máy ảo
Trong thư mục lưu trữ máy ảo, bạn có thể tìm thấy các tệp tin sau:

- **Tệp đĩa ảo (Virtual Disk Image)**: Đây là tệp chính chứa dữ liệu của máy ảo, thường có phần mở rộng `.img`, `.qcow2`, hoặc `.raw`. Ví dụ:
  - `ubuntu-vm.qcow2`: Tệp hình ảnh đĩa sử dụng định dạng QCOW2.
  
![](	https://img001.prntscr.com/file/img001/w-dMCdy2Tl-qPwd-OopJoQ.png)
- **Tệp cấu hình (XML)**: Mỗi máy ảo sẽ có một tệp cấu hình XML nằm trong `/etc/libvirt/qemu/`. Tệp này định nghĩa các tham số của máy ảo như CPU, RAM, thiết bị mạng, và các thiết bị ảo khác. Ví dụ:
  - `ubuntu-vm.xml`: Tệp cấu hình cho máy ảo Ubuntu.
![](https://img001.prntscr.com/file/img001/hC7eYBdeTPeLNSrFfxm8cA.png)
- **Tệp snapshot**: Nếu bạn tạo snapshot cho máy ảo, các tệp snapshot sẽ được lưu trong cùng thư mục với tệp hình ảnh đĩa hoặc trong một thư mục riêng. Ví dụ:
  - `ubuntu-vm-snap1.qcow2`: Một snapshot của máy ảo.
![](https://img001.prntscr.com/file/img001/07vqNBcsRAyvXy46y0HUkA.png)
### 3. Thông tin trong từng tệp
- **Tệp đĩa ảo** (`.img`, `.qcow2`, `.raw`):
  - Chứa dữ liệu của hệ điều hành và các tệp tin khác của máy ảo.
  - Định dạng `.qcow2` hỗ trợ các tính năng như nén và mã hóa, giúp tiết kiệm dung lượng.

- **Tệp cấu hình XML**:
  - Chứa thông tin chi tiết về cấu hình máy ảo, bao gồm:
    - **<name>**: Tên của máy ảo.
    - **<memory>**: Kích thước RAM mà máy ảo sử dụng.
    - **<vcpu>**: Số lượng CPU mà máy ảo có.
    - **<disk>**: Thông tin về đĩa ảo (tên tệp hình ảnh, định dạng, loại kết nối).
    - **<interface>**: Thông tin về kết nối mạng của máy ảo.

- **Tệp snapshot**:
  - Chứa trạng thái của máy ảo tại thời điểm snapshot được tạo.
  - Có thể bao gồm cả trạng thái đĩa và trạng thái RAM (nếu snapshot bao gồm cả RAM).

### 4. Vị trí tệp snapshot
Tùy thuộc vào cách bạn tạo snapshot, các tệp snapshot có thể được lưu trong:
- Cùng thư mục với tệp hình ảnh gốc (nếu sử dụng định dạng QCOW2).
