### Di Chuyển Máy Ảo

Bạn có thể di chuyển máy ảo từ một tài nguyên tính toán hoặc vị trí lưu trữ này sang một tài nguyên hoặc vị trí khác bằng cách sử dụng di chuyển lạnh (cold migration) hoặc di chuyển nóng (hot migration). Ví dụ, với **vSphere vMotion**, bạn có thể di chuyển các máy ảo đang chạy từ một máy chủ sang một máy chủ khác để thực hiện bảo trì, cân bằng tải, đặt các máy ảo mà giao tiếp với nhau ở gần nhau, hoặc di chuyển máy ảo sang phần cứng máy chủ mới.

**Lưu ý:** Di chuyển máy ảo từ một thư mục kho tài nguyên này sang thư mục khác hoặc nhóm tài nguyên trong cùng một trung tâm dữ liệu không phải là một hình thức di chuyển. Việc sao chép hoặc nhân bản một máy ảo cũng không phải là hình thức di chuyển.

### Các Loại Di Chuyển Máy Ảo

#### Di Chuyển Lạnh (Cold Migration)
- Di chuyển một máy ảo đã tắt hoặc đang tạm dừng đến một máy chủ mới.
- Bạn cũng có thể di chuyển các tệp cấu hình và đĩa cho máy ảo đã tắt hoặc tạm dừng sang các vị trí lưu trữ mới.
- Có thể sử dụng để di chuyển máy ảo từ một switch ảo sang switch ảo khác hoặc từ một trung tâm dữ liệu này sang một trung tâm dữ liệu khác.
- Bạn có thể thực hiện di chuyển lạnh thủ công hoặc lên lịch một tác vụ.

#### Di Chuyển Nóng (Hot Migration)
- Di chuyển một máy ảo đang chạy đến một máy chủ mới mà không có sự gián đoạn nào trong khả năng sử dụng của nó.
- Còn được gọi là di chuyển trực tiếp (live migration) hoặc **vMotion**.
- Bạn có thể di chuyển cả đĩa máy ảo hoặc thư mục sang một datastore khác.

### Các Loại Di Chuyển Dựa Trên Tài Nguyên Máy Ảo
1. **Chỉ Thay Đổi Tài Nguyên Tính Toán**
   - Di chuyển máy ảo mà không di chuyển lưu trữ của nó đến một tài nguyên tính toán khác như máy chủ, cluster, nhóm tài nguyên, hoặc vApp.
   - Nếu thay đổi tài nguyên tính toán của một máy ảo đang chạy, bạn sẽ sử dụng vMotion.

2. **Chỉ Thay Đổi Lưu Trữ**
   - Di chuyển một máy ảo và lưu trữ của nó, bao gồm các đĩa ảo, tệp cấu hình, hoặc sự kết hợp của chúng, đến một datastore mới trên cùng một máy chủ.
   - Bạn có thể thay đổi datastore của máy ảo bằng cách sử dụng di chuyển lạnh hoặc nóng. Nếu di chuyển một máy ảo đang chạy và lưu trữ của nó đến một datastore mới, bạn sẽ sử dụng **Storage vMotion**.

3. **Thay Đổi Cả Tài Nguyên Tính Toán và Lưu Trữ**
   - Di chuyển một máy ảo đến một máy chủ khác và đồng thời di chuyển đĩa của nó hoặc thư mục máy ảo đến một datastore khác.
   - Bạn có thể thay đổi cả máy chủ và datastore đồng thời bằng cách sử dụng di chuyển lạnh hoặc nóng.
### Điều Kiện và Giới Hạn Của Máy Ảo Khi Sử Dụng vMotion

Để di chuyển máy ảo bằng vMotion, máy ảo phải đáp ứng một số yêu cầu về mạng, đĩa, CPU, USB và các thiết bị khác. Dưới đây là các điều kiện và giới hạn áp dụng khi bạn sử dụng vMotion:

1. **Mạng Quản Lý**: Địa chỉ IP mạng quản lý của nguồn và đích phải khớp nhau. Bạn không thể di chuyển một máy ảo từ một máy chủ đã đăng ký với vCenter Server bằng địa chỉ IPv4 sang một máy chủ đã đăng ký bằng địa chỉ IPv6.

2. **Băng Thông Mạng**: Sử dụng bộ điều hợp mạng 1 GbE cho mạng vMotion có thể dẫn đến việc di chuyển thất bại nếu bạn di chuyển các máy ảo có hồ sơ vGPU lớn. Nên sử dụng bộ điều hợp mạng 10 GbE cho mạng vMotion.

3. **Bộ Đếm Hiệu Suất CPU Ảo**: Nếu bộ đếm hiệu suất CPU ảo được bật, bạn chỉ có thể di chuyển máy ảo đến các máy chủ có bộ đếm hiệu suất CPU tương thích.

4. **Đồ Họa 3D**: Bạn có thể di chuyển các máy ảo có tính năng đồ họa 3D được bật. Nếu Bộ Kết Xuất 3D được đặt ở chế độ Tự Động, máy ảo sẽ sử dụng bộ xử lý đồ họa có sẵn trên máy chủ đích. Nếu Bộ Kết Xuất 3D được đặt ở chế độ Phần Cứng, máy chủ đích phải có một thẻ đồ họa GPU.

5. **Hỗ Trợ vGPU**: Bắt đầu từ vSphere 6.7 Update 1 trở đi, vSphere vMotion hỗ trợ các máy ảo có vGPU. 

6. **Hỗ Trợ DRS cho vGPU**: vSphere DRS hỗ trợ việc đặt ban đầu các máy ảo vGPU chạy vSphere 6.7 Update 1 hoặc mới hơn mà không cần hỗ trợ cân bằng tải.

7. **Thiết Bị USB**: Bạn có thể di chuyển các máy ảo có thiết bị USB được kết nối với thiết bị USB vật lý trên máy chủ. Bạn phải kích hoạt các thiết bị này cho vMotion.

