### Sao chép một Template thành Template trên vSphere Web Client

Bạn có thể sao chép một template hiện có thành một template khác để lưu trữ các máy ảo sẵn sàng sử dụng. Dưới đây là quy trình thực hiện.

---

### **Yêu cầu**:
- Bạn cần có các quyền sau để thực hiện việc sao chép template:
  - **Virtual machine .Provisioning.Clone template** trên template nguồn.
  - **Virtual machine .Inventory.Create from existing** trên thư mục nơi tạo template.
  - **Datastore.Allocate space** trên tất cả các datastore nơi template sẽ được tạo.

---

### **Quy trình**:

#### **1. Mở trình thuật sĩ Clone Template to Template**:
- **Từ một đối tượng trong inventory**:
  - Nhấp chuột phải vào bất kỳ đối tượng cha nào hợp lệ, chẳng hạn như datacenter, thư mục, cluster, resource pool hoặc host, và chọn **New Virtual Machine**.
  - Chọn **Clone Template to Template** và nhấp **Next**.
  - Trên trang **Select a template to clone**, duyệt đến template bạn muốn sao chép hoặc chấp nhận template mặc định.
![](	https://img001.prntscr.com/file/img001/6FNgPSUISqm8PM92YpdtwA.png)
- **Từ một template**:
  - Nhấp chuột phải vào template và chọn **Clone to Template**.
![](https://img001.prntscr.com/file/img001/C-CQV5KnRB6lmXz7Wxvomw.png)
---

#### **2. Đặt tên và chọn thư mục**:
- Nhập một tên duy nhất cho template mới và chọn datacenter hoặc thư mục nơi sẽ triển khai template. Nhấp **Next**.
![](https://img001.prntscr.com/file/img001/5R50uVxhRbaTxD36hPSt_w.png)
---

#### **3. Chọn tài nguyên tính toán**:
- Chọn máy chủ hoặc cluster để đăng ký template. Máy chủ ESXi phải hoạt động khi tạo máy ảo từ template.
![](https://img001.prntscr.com/file/img001/DCm8Us0OS8GTY65xONTeMg.png)

---

#### **4. Chọn lưu trữ**:
- Chọn datastore hoặc datastore cluster để lưu trữ các tệp cấu hình máy ảo và tất cả các đĩa ảo.

  - **Định dạng đĩa**:
    - **Same format as source**: Sử dụng cùng định dạng đĩa như template nguồn.
    - **Thick Provision Lazy Zeroed**: Tạo đĩa dày với không gian phân bổ trong quá trình tạo.
    - **Thick Provision Eager Zeroed**: Đĩa dày với không gian phân bổ ngay lập tức, hỗ trợ tính năng clustering.
    - **Thin Provision**: Đĩa mỏng chỉ sử dụng không gian khi cần và có thể mở rộng sau này.
![](	https://img001.prntscr.com/file/img001/Zv4Z4pOqReybS1ghq8GHjg.png)
---
![](https://img001.prntscr.com/file/img001/Zv4Z4pOqReybS1ghq8GHjg.png)
#### **5. Hoàn tất**:
- Xem lại cài đặt trên trang **Ready to complete** và nhấp **Finish** để hoàn tất.
![](	https://img001.prntscr.com/file/img001/EzX1z3gZQ0G3XqiCjYz5iQ.png)
---

### **Kết quả**:
![](	https://img001.prntscr.com/file/img001/8y410PfUTMiFoSnnhCsIfA.png)
Tiến trình của tác vụ sẽ xuất hiện trong bảng **Recent Tasks** và template mới sẽ xuất hiện trong inventory khi hoàn thành.
