### Hướng dẫn Tạo Máy Ảo bằng Wizard Tạo Máy Ảo Mới



#### Điều kiện tiên quyết
Trước khi bắt đầu, hãy đảm bảo rằng bạn có đủ quyền hạn cần thiết:

- **Virtual machine .Inventory.Create new**: Quyền tạo máy ảo mới trong thư mục đích hoặc trung tâm dữ liệu.
- **Virtual machine.Configuration.Add new disk**: Quyền thêm đĩa mới trong thư mục đích hoặc trung tâm dữ liệu, nếu bạn thêm một đĩa mới.
- **Virtual machine.Configuration.Add existing disk**: Quyền thêm đĩa đã tồn tại trong thư mục đích hoặc trung tâm dữ liệu, nếu bạn thêm một đĩa đã tồn tại.
- **Virtual machine.Configuration.Configure Raw device**: Quyền cấu hình thiết bị RDM hoặc thiết bị SCSI pass-through trong thư mục đích hoặc trung tâm dữ liệu.
- **Virtual machine.Configuration.Configure Host USB device**: Quyền gán thiết bị USB ảo liên kết với thiết bị USB của máy chủ.
- **Virtual machine.Configuration.Advanced configuration**: Quyền cấu hình các cài đặt máy ảo nâng cao trong thư mục đích hoặc trung tâm dữ liệu.
- **Virtual machine.Configuration.Change Swapfile placement**: Quyền cấu hình vị trí tệp hoán đổi.
- **Virtual machine.Configuration.Toggle disk change tracking**: Quyền bật theo dõi thay đổi trên các đĩa của máy ảo.
- **Resource.Assign virtual machine to resource pool**: Quyền gán máy ảo vào pool tài nguyên.
- **Datastore.Allocate space**: Quyền cấp phát không gian trên datastore đích hoặc thư mục datastore.
- **Network.Assign network**: Quyền gán mạng cho máy ảo.

Để xác minh các quyền đã được gán cho vai trò của bạn, hãy nhấp vào **Menu > Administration > Roles** và chọn vai trò của bạn.

---

#### Quy trình Tạo Máy Ảo

Dưới đây là các bước để tạo máy ảo bằng Wizard:

1. **Khởi động Wizard Tạo Máy Ảo**:
   - Nhấp chuột phải vào bất kỳ đối tượng nào trong kho dữ liệu (inventory) mà là một đối tượng cha hợp lệ của máy ảo, như trung tâm dữ liệu, thư mục, cụm (cluster), pool tài nguyên hoặc máy chủ, và chọn **New Virtual Machine**.
   ![](https://img001.prntscr.com/file/img001/mwBJ08gkROKDDnI-gdtACQ.png)

2. **Chọn Loại Tạo**:
   - Trên trang **Select a creation type**, chọn **Create a new virtual machine** và nhấp **Next**.
![](https://img001.prntscr.com/file/img001/MmzPOG71Rs6hN0Uv5AuScg.png)
3. **Nhập Tên và Thư Mục**:
   - Trên trang **Select a name and folder**, nhập tên duy nhất cho máy ảo và chọn vị trí triển khai.
**Chọn Hệ Điều Hành Khách**:
   - Trên trang **Select a guest OS**, chọn loại và phiên bản hệ điều hành khách và nhấp **Next**.
   - Khi chọn hệ điều hành, BIOS hoặc EFI sẽ được chọn mặc định, tùy thuộc vào firmware hỗ trợ bởi hệ điều hành.
![](https://img001.prntscr.com/file/img001/Ec5RFXEuSRuh6XvJCDg9Pw.png)
**Bật Bảo Mật Dựa Trên Ảo Hóa Windows** (Tùy chọn):
   - Tùy chọn này có sẵn cho các phiên bản hệ điều hành Windows mới nhất như Windows 10 và Windows Server 2016.

4. **Chọn Lưu Trữ**:
   - Trên trang **Select storage**, chọn loại lưu trữ, chính sách lưu trữ, và datastore hoặc cụm datastore nơi lưu trữ tệp máy ảo.
     - **Lưu ý**: Nếu bạn muốn tạo máy ảo sử dụng bộ nhớ vĩnh viễn (PMem), hãy chọn một máy chủ hoặc cụm có tài nguyên PMem khả dụng.
![](https://img001.prntscr.com/file/img001/ag0rmh2tTEGj4QSFG9Y4zA.png)


9. **Tùy Chỉnh Phần Cứng**:
   - Trên trang **Customize hardware**, cấu hình phần cứng và các tùy chọn cho máy ảo và nhấp **Next**.
   - Nếu bạn chọn sử dụng bộ nhớ vĩnh viễn cho máy ảo, tất cả các thiết bị đĩa sẽ chia sẻ cùng một tài nguyên PMem, vì vậy hãy điều chỉnh kích thước thiết bị mới được thêm vào cho phù hợp với lượng PMem có sẵn.
![](https://img001.prntscr.com/file/img001/b6MWlDDiSjKckeX5082MDQ.png)
10. **Hoàn tất**:
    - Trên trang **Ready to complete**, xem lại các thông tin chi tiết và nhấp **Finish**.
![](https://img001.prntscr.com/file/img001/pA_kcUWjQUeu8w2-2C18Jw.png)
---

### Kết quả
Máy ảo mới sẽ xuất hiện trong kho dữ liệu (inventory) của vSphere Client, sẵn sàng để được cấu hình và sử dụng theo yêu cầu của bạn.
![](https://img001.prntscr.com/file/img001/Bp1h0IxARDK5_WACx6IjjA.png)
