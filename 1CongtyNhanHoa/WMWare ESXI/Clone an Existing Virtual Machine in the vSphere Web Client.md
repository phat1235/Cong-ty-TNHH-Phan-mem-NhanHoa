### Sao chép (Clone) một Máy ảo hiện có trên vSphere Web Client

Sao chép một máy ảo sẽ tạo ra một máy ảo mới giống hệt với máy ảo gốc, bao gồm phần cứng ảo, phần mềm đã cài đặt, và các thuộc tính khác. Dưới đây là các bước để thực hiện sao chép một máy ảo.

---

### **Yêu cầu**:
- Đảm bảo bạn có các quyền sau để sao chép máy ảo:
  - Virtual machine .Provisioning.Clone virtual machine trên máy ảo bạn muốn sao chép.
  - Virtual machine .Inventory.Create from existing trên datacenter hoặc thư mục máy ảo.
  - Virtual machine.Configuration.Add new disk trên datacenter hoặc thư mục máy ảo (nếu cần thêm đĩa mới).
  - Resource.Assign virtual machine to resource pool trên máy chủ, cụm (cluster), hoặc resource pool đích.
  - Datastore.Allocate space trên datastore hoặc thư mục datastore đích.
  - Network.Assign network trên mạng mà máy ảo mới sẽ được gán.
  - Virtual machine .Provisioning.Customize nếu bạn đang tùy chỉnh hệ điều hành của máy khách.

---

### **Quy trình**:

#### **1. Mở trình ảo thuật :)) Clone Existing Virtual Machine**:
- **Từ một đối tượng hợp lệ trong inventory**:
  - Nhấp chuột phải vào đối tượng cha hợp lệ của một máy ảo (như datacenter, thư mục, cluster, resource pool hoặc host), sau đó chọn **New Virtual Machine**.
  - Trong trang **Select a creation type**, chọn **Clone an existing virtual machine** và nhấp **Next**.
  - Chọn máy ảo mà bạn muốn sao chép từ trang **Select a virtual machine**.

- **Từ một máy ảo hiện có**:
  - Nhấp chuột phải vào máy ảo và chọn **Clone > Clone to Virtual Machine**.
![](	https://img001.prntscr.com/file/img001/gdE-_rtSSJ-XQkoV-2HL8A.png)
![](https://img001.prntscr.com/file/img001/evGucQNWQ8OOJQhg9lJ4GA.png)
---

#### **2. Đặt tên và chọn thư mục**:
- Nhập một tên duy nhất cho máy ảo mới và chọn vị trí triển khai.
![](	https://img001.prntscr.com/file/img001/GJ0qyXavSBaSbPU05mGRTA.png
)
---

#### **3. Chọn tài nguyên tính toán (compute resource)**:
- Chọn máy chủ, cụm (cluster), resource pool hoặc vApp nơi máy ảo sẽ chạy và nhấp **Next**.
  
![](	https://img001.prntscr.com/file/img001/pyEAUvewR7ChqX5kCJ8Ygg.png)

---

#### **4. Chọn lưu trữ**:
- Chọn datastore hoặc cụm datastore để lưu trữ các tệp cấu hình và đĩa ảo của máy ảo.

  - **Định dạng đĩa ảo**:
    - **Same format as source**: Sử dụng cùng định dạng như máy ảo nguồn.
    - **Thick Provision Lazy Zeroed**: Đĩa dày với không gian được phân bổ khi tạo, nhưng dữ liệu không được xóa ngay lập tức.
    - **Thick Provision Eager Zeroed**: Đĩa dày với không gian phân bổ ngay lập tức và dữ liệu được xóa trong quá trình tạo (hỗ trợ Fault Tolerance).
    - **Thin Provision**: Chỉ sử dụng không gian thực sự cần thiết và có thể mở rộng khi cần.
![](	https://img001.prntscr.com/file/img001/J-32xVooRxK63xHC1zidkw.png)
---

#### **5. Chọn các tùy chọn sao chép bổ sung**:
- Tùy chỉnh hệ điều hành máy khách hoặc phần cứng máy ảo nếu cần. Bạn cũng có thể chọn khởi động máy ảo sau khi tạo.
- Tùy chỉnh phần cứng (tùy chọn)**:
- Cấu hình phần cứng và các tùy chọn cho máy ảo. Bạn có thể để các cài đặt mặc định và tùy chỉnh sau.
![](https://img001.prntscr.com/file/img001/LBtvOC_RRdi9K8otuYHkug.png)
---
X
![](https://img001.prntscr.com/file/img001/-HRMGNiNQFiVig9XD5SdfA.png)



#### **6. Hoàn thành**:
- Xem lại cấu hình trên trang **Ready to complete** và nhấp **Finish** để hoàn tất.
![](	https://img001.prntscr.com/file/img001/DosM-RCASO64b3d4pskGBA.png)
---

### **Kết quả**:
Máy ảo mới sẽ xuất hiện trong inventory.
![](https://img001.prntscr.com/file/img001/8-SzFGUpTxixGTFX5VW94w.png)
