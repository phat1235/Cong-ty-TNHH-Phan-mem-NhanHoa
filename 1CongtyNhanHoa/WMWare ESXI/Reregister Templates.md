### Xóa một Template khỏi Đĩa

Nếu bạn không còn cần template hoặc cần giải phóng dung lượng đĩa, bạn có thể xóa template khỏi đĩa. **Lưu ý rằng template bị xóa sẽ bị loại bỏ vĩnh viễn và không thể khôi phục.**

### **Quy trình Xóa Template khỏi Đĩa**:

1. Nhấp chuột phải vào template và chọn **Delete from Disk**.
2. Nhấp **Yes** để xác nhận xóa template khỏi datastore.

---

### **Đăng ký lại Template**

Template có thể bị hủy đăng ký khỏi vCenter Server nếu chúng bị xóa khỏi inventory hoặc nếu các máy chủ liên kết với chúng bị xóa khỏi vCenter Server và sau đó được thêm lại.



### **Quy trình Đăng ký lại Template**:

1. Trong vSphere Client, điều hướng đến datastore chứa template.
2. Chọn datastore và nhấp vào tab **Files**.
3. Tìm thư mục chứa template và nhấp vào nó để hiển thị các tệp template.
4. Chọn tệp **.vmtx** và nhấp vào biểu tượng **Register VM**.
   - Trình thuật sĩ **Register VM Template** sẽ mở ra.
5. Trên trang **Select a name and folder**, chỉ định tên và vị trí cho template, sau đó nhấp **Next**.
6. Trên trang **Select a compute resource**, chọn host hoặc cluster để lưu template, rồi nhấp **Next**.
7. Trên trang **Ready to complete**, xem lại lựa chọn của bạn và nhấp **Finish**.
8. (Tùy chọn) Để xác minh template đã được đăng ký lại, kiểm tra inventory của host hoặc cluster.
   - **Host**: Duyệt đến host, trên tab **VMs**, nhấp vào **VM Templates**.
   - **Cluster**: Trên tab **VMs**, nhấp vào **VM Templates**.

---
