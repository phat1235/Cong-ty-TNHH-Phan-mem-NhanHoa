### Chương 2: Triển khai Hyper-V

**San sát hóa** mang lại nhiều lợi ích cho doanh nghiệp của bạn, chẳng hạn như tăng tính linh hoạt, tăng tính khả dụng và cải thiện hiệu quả chi phí. Bạn có thể đã biết rằng Hyper-V rất mạnh về chi phí, nhưng còn về các tính năng và chức năng thì sao? Với tất cả những cải tiến trong **Windows Server 2012 Hyper-V**, các tổ chức có thể tận dụng một hệ điều hành được xây dựng cho **điện toán đám mây**.

Trong chương này, bạn sẽ tìm hiểu về:

- Những gì cần chuẩn bị cho việc triển khai Hyper-V
- Cách cài đặt và cấu hình Hyper-V
- Cách tận dụng một số tính năng mới
- Cách di chuyển một máy chủ Hyper-V
### Chuẩn bị cho việc Triển khai Hyper-V

Phần đầu tiên này tập trung vào việc chuẩn bị cho một triển khai Hyper-V mới. Sự chú ý được đặt vào việc hiểu các yêu cầu và quyết định bạn sẽ phải đưa ra. Việc chuẩn bị này nên được thực hiện trước khi bắt đầu cài đặt. Có thể sẽ tốt hơn nếu bạn dành "vài phút nữa" để suy nghĩ về môi trường và việc triển khai trước khi bạn chèn đĩa DVD (hoặc hình ảnh ISO) và bắt đầu cài đặt.

#### Thiết kế và Kiến trúc

**San sát hóa máy chủ** là một yếu tố then chốt trong **Cơ sở hạ tầng dưới dạng Dịch vụ (IaaS)**, nhờ việc tách rời các lớp kiến trúc như phần cứng khỏi hệ điều hành, ứng dụng khỏi hệ điều hành, và nhiều hơn nữa. Vai trò của Hyper-V trong **Windows Server 2012** và **Hyper-V Server 2012** cung cấp cơ sở hạ tầng phần mềm và các công cụ quản lý cơ bản có thể được sử dụng để tạo ra và quản lý một môi trường máy chủ ảo hóa. 

Khi sử dụng Hyper-V, các tài nguyên mà người dùng tiếp cận sẽ là các phiên bản hệ điều hành ảo hóa. Nền tảng ảo hóa của Microsoft được xây dựng dựa trên hệ sinh thái **Windows Server** và có thể hưởng lợi từ hệ sinh thái đối tác rộng lớn trong lĩnh vực phần cứng cũng như các giải pháp phần mềm. Do đó, các mẫu thiết kế được viết theo cách không phụ thuộc vào sản phẩm cụ thể.
![](https://img001.prntscr.com/file/img001/qvF5cWSvR4yey3q4kNEHUw.png)
### Trong thiết kế này, máy chủ lưu trữ là một điểm thất bại duy nhất. 

Kiến trúc yêu cầu phải “lưu trạng thái” hoặc “tắt nguồn” các máy ảo nếu máy chủ lưu trữ cần bảo trì hoặc khởi động lại. Mô hình này thích hợp cho các môi trường thử nghiệm và phát triển cũng như các văn phòng chi nhánh nhỏ, nơi mà những hạn chế về khả năng sẵn sàng là chấp nhận được.

Một giải pháp tuyệt vời cho các văn phòng chi nhánh với phần cứng hạn chế hoặc yêu cầu phục hồi sau thảm họa là tính năng **Hyper-V Replica**, cho phép sao chép máy ảo sang một máy chủ Hyper-V khác. Hyper-V Replica theo dõi các thao tác ghi trên máy ảo chính và sao chép các thay đổi này một cách hiệu quả sang máy chủ sao chép qua WAN. Kết nối mạng giữa hai máy chủ sử dụng HTTP hoặc HTTPS và hỗ trợ cả xác thực tích hợp và xác thực dựa trên chứng chỉ.

### Những cân nhắc cho các triển khai vừa và lớn

Kiến trúc được đề xuất cho các triển khai vừa thường dựa trên **Windows Server 2012 Hyper-V** và **Failover Clustering**. Mô hình này cung cấp khả năng hợp nhất máy chủ cũng như độ sẵn sàng cao cho các máy ảo. Phân vùng quản lý chỉ được dành riêng cho vai trò máy chủ ảo hóa. Việc giảm thiểu các vai trò máy chủ trong phân vùng gốc mang lại những lợi ích bổ sung như giảm bề mặt tấn công và tần suất cập nhật, điều này sẽ được trình bày chi tiết hơn trong chương này.

Việc sử dụng **Failover Clustering** yêu cầu phải có bộ nhớ chia sẻ, có thể là **Fibre Channel**, **iSCSI**—hoặc mới trong **Windows Server 2012**, **Server Message Block 3 (SMB3)**. Chương 7, “Sử dụng Máy chủ Tệp,” sẽ đi vào chi tiết hơn về cách hoạt động của SMB3. Chương 6, “Microsoft iSCSI Software Target,” sẽ cung cấp thông tin chi tiết về Microsoft iSCSI Software Target trong Windows Server 2012.
![](https://img001.prntscr.com/file/img001/7G6wKfQmRGStnGHHpg-BYQ.png)

Như đã đề cập trước đó, để đạt được độ sẵn sàng cao, các máy chủ **Hyper-V** sẽ được cấu hình như một **cluster dự phòng** (failover cluster) để cung cấp khả năng chuyển giao tài nguyên tự động sang các máy chủ khác, cũng như sử dụng các khả năng di chuyển máy ảo như **Live Migration**. So với mô hình độc lập, các máy chủ này chỉ nên được sử dụng ở mức mà vẫn có thể chịu đựng một sự cố máy chủ mà không bị ảnh hưởng.

Việc di chuyển các máy ảo có thể được thực hiện mà không cần dừng hoạt động thông qua tất cả các nút trong cluster bằng cách tận dụng **Live Migration**. Tuy nhiên, các thông số phần cứng giống nhau (ví dụ, bộ vi xử lý và bộ nhớ) là yêu cầu bắt buộc cho tất cả các máy chủ **Hyper-V** tham gia. Thông thường, các máy ảo được lưu trữ trên bộ nhớ chia sẻ được cấu hình cho **Cluster Shared Volumes (CSV)**, mang lại lợi ích của một không gian tên duy nhất được sử dụng bởi nhiều tài nguyên cùng một lúc. Nếu một sự cố được phát hiện, cluster dự phòng sẽ tự động chuyển giao và khởi động lại tất cả các tài nguyên cluster bị lỗi (trong trường hợp này là các máy ảo) trên các nút **Hyper-V** còn lại. Chương 8 “Xây dựng Cluster Hyper-V” sẽ đi vào chi tiết hơn về cách hoạt động của một cluster dự phòng Hyper-V.

Các triển khai vừa và lớn nên được quản lý bởi bộ công cụ **Microsoft System Center 2012 SP1**, bao gồm các thành phần sau:

- **App Controller**: cho việc triển khai và quản lý máy ảo
- **Configuration Manager**: cho việc triển khai
- **Data Protection Manager**: cho sao lưu
- **Operations Manager**: cho giám sát
- **Orchestrator**: cho tự động hóa
- **Service Manager**: cho quản lý dịch vụ và quy trình
- **Virtual Machine Manager**: cho quản lý cơ sở hạ tầng và máy ảo

Chúng tôi không đề cập đến **System Center** vì nó nằm ngoài phạm vi của cuốn sách này. **Microsoft Private Cloud Computing** của Aidan Finn, Hans Vredevoort, Patrick Lownds, và Damian Flynn (Sybex, 2012) đề cập đến **System Center 2012**; mặc dù cuốn sách không đề cập đến **Windows Server 2012**, nó vẫn là một tài liệu tham khảo tuyệt vời về các khái niệm có thể có.

**Phần cứng**  
Kiến trúc máy chủ host là một thành phần quan trọng trong cơ sở hạ tầng ảo hóa và là biến số chính trong tỷ lệ hợp nhất và phân tích chi phí. Khả năng của một host Hyper-V xử lý khối lượng công việc của một số lượng lớn các ứng viên hợp nhất tăng tỷ lệ hợp nhất và giúp cung cấp lợi ích về chi phí mong muốn. Một số khía cạnh cần xem xét được trình bày trong phần này.

### Cân nhắc về Tài nguyên Tính toán  
Giống như **Windows Server 2008 R2**, hệ điều hành máy chủ chỉ có sẵn dưới dạng phiên bản 64-bit. Không có các phiên bản 32-bit của hệ điều hành này. Tuy nhiên, các ứng dụng 32-bit sẽ chạy trên hệ điều hành **Windows Server 2012** 64-bit. Do đó, các bộ vi xử lý 64-bit là yêu cầu bắt buộc để chạy **Hyper-V**.

Để có nhiều tài nguyên tính toán hơn, hãy tìm kiếm các bộ vi xử lý với tần số cao hơn và nhiều lõi. Đừng mong đợi một tỷ lệ mở rộng hoàn hảo với nhiều lõi. Tỷ lệ mở rộng có thể còn thấp hơn khi **Hyper-Threading** được bật, vì **Hyper-Threading** dựa vào việc chia sẻ tài nguyên trên cùng một lõi vật lý. Khuyến nghị chung là nên bật **Hyper-Threading**, miễn là không vượt quá số bộ xử lý logic (LPs) hỗ trợ. Cuối cùng, đừng đánh giá thấp bộ nhớ cache L2 hoặc L3 của bộ vi xử lý, vì chúng thường đóng vai trò lớn hơn so với tần số.

**Lưu ý:** Đừng so sánh thông số kỹ thuật của bộ vi xử lý, đặc biệt là tần số, giữa các nhà sản xuất hoặc ngay cả giữa các thế hệ bộ vi xử lý khác nhau từ cùng một nhà sản xuất. Việc so sánh này trong nhiều trường hợp là một chỉ số gây hiểu lầm về tốc độ và hiệu suất.

Ngoài bộ vi xử lý 64-bit, **Hyper-V** yêu cầu các bộ vi xử lý hỗ trợ các tính năng được hiển thị trong **Bảng 2.1**.

**Bảng 2.1: Yêu cầu CPU**  

| Công nghệ Bộ vi xử lý      | AMD                     | Intel                    |
|----------------------------|-------------------------|--------------------------|
| Kiến trúc bộ vi xử lý      | 64-bit                  | 64-bit                   |
| Ảo hóa phần cứng           | AMD-V                   | Intel VT                 |
| Tắt thực thi phần cứng     | Không (No Execute - NX) | eXecute Disable (XD) bit |
| Tùy chọn: Chuyển địa chỉ cấp hai (SLAT) | Rapid Virtualization Indexing (RVI) | Extended Page Tables (EPT) |

Nhiều công cụ khác nhau có thể giúp xác định khả năng của bộ vi xử lý. Một công cụ nổi tiếng là **CPU-Z**, có sẵn miễn phí từ **CPUID** (www.cpuid.com). Ngoài ra, **AMD** có **Công nghệ Ảo hóa** và **Công cụ Kiểm tra Tương thích Hệ thống Microsoft Hyper-V**, trong khi **Intel** có **Công cụ Nhận dạng Bộ vi xử lý**.

**WMI** có thể được sử dụng để xác định xem **DEP** có khả dụng hay không:  
`use wmic OS Get DataExecutionPrevention_Available`, trong đó `true` có nghĩa là **DEP** được bật.

**Xây dựng Máy chủ Hyper-V Đầu tiên**  
Bắt đầu với một máy chủ độc lập có lẽ là cách tiếp cận tốt nhất nếu bạn mới làm quen với Hyper-V, vì việc triển khai này rất đơn giản. Nó cũng giúp bạn hiểu nhanh hơn cách Hyper-V hoạt động và cách phát triển để xây dựng một trang trại Hyper-V lớn hơn.

### Chuẩn bị Windows Server  
Vì Hyper-V là một vai trò của Windows Server, yêu cầu đầu tiên là có một hệ điều hành đã được cài đặt mới. Nhiệm vụ này không khác gì việc cài đặt một Windows Server mới được sử dụng cho **Active Directory** hoặc một máy chủ tệp, ví dụ. Không có tùy chọn cụ thể nào cho Hyper-V được cung cấp. Trừ khi bạn sử dụng **Hyper-V Server** miễn phí, vai trò Hyper-V cũng không được bật theo mặc định, ngay cả khi bạn sử dụng phiên bản **Datacenter** (xem Hình 2.6).
![](https://img001.prntscr.com/file/img001/QM6qBXANSzGaliJ7IvPy8A.png)

Như đã đề cập trước đó trong chương này, chế độ cài đặt **Server Core** được ưa chuộng cho việc triển khai Hyper-V. Tuy nhiên, bạn có thể muốn bắt đầu với chế độ **Server với giao diện đồ họa (GUI)** và sau đó chuyển sang chế độ **Server Core** sau khi bạn đã hoàn thành tất cả các cấu hình.

### Cấu hình Máy chủ Hyper-V
Nhìn chung, chúng tôi khuyên bạn chỉ nên cấu hình tối thiểu hệ điều hành. Sau đó, hãy tiến hành cài đặt vai trò Hyper-V và hoàn thành cấu hình nâng cao sau.

Để tiếp tục, máy chủ nên được cấu hình như sau:
1. Cài đặt tất cả các trình điều khiển cần thiết.
2. Cấu hình các bộ điều hợp mạng cho mạng quản lý.
3. Kích hoạt **Remote Desktop** để quản trị từ xa.
4. Thay đổi tên máy tính.
5. Kiểm tra cài đặt **Regional** cũng như cài đặt **Ngày và Giờ**.
6. Thêm máy tính vào miền.
7. Cài đặt các bản cập nhật Windows mới nhất.
8. Cài đặt các bản sửa lỗi liên quan đến Hyper-V và **Failover Clustering**.
9. Thêm lưu trữ bổ sung cho việc đặt máy ảo.

**Lưu ý:** Microsoft **System Center 2012 Configuration Manager** và **Virtual Machine Manager** cung cấp các tùy chọn cho việc triển khai tự động và tối ưu hóa Hyper-V với cấu hình bare-metal (BMD) để giảm thiểu tương tác thủ công. BMD từ **Virtual Machine Manager** dựa trên việc khởi động từ **VHD**, thay vì triển khai hệ điều hành trong **Configuration Manager**.

Để quản lý năng lượng từ đầu đến cuối, như đã giải thích trước đó trong chương này, cũng hãy cấu hình hệ điều hành cho chế độ **high-performance**. Điều này có thể thực hiện thông qua bảng điều khiển hoặc bằng lệnh sau, áp dụng sơ đồ năng lượng cao nhất:

```bash
powercfg /S 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
```
