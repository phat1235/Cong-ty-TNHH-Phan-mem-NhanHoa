

### **Tìm hiểu về máy chủ vật lý**

![](https://img001.prntscr.com/file/img001/boiFes9_SJyXqS8f05r6PQ.png)

#### **1. Các dòng máy chủ**

- **Máy chủ Rackmount (Rack Server)**
  - **Mô tả**: Máy chủ rackmount được thiết kế để lắp vào các khung giá rack (rackmount), tiết kiệm không gian và phù hợp cho môi trường trung tâm dữ liệu. Chúng có dạng hình chữ nhật và được thiết kế để dễ dàng lắp ráp vào các kệ rack tiêu chuẩn với kích thước 1U, 2U, 3U, 4U, v.v.
  - **Ưu điểm**: Tiết kiệm không gian, dễ dàng quản lý và bảo trì, khả năng mở rộng dễ dàng.
  - **Ứng dụng**: Phục vụ các trung tâm dữ liệu, hệ thống ảo hóa, dịch vụ web, và cơ sở dữ liệu.

- **Máy chủ Tower (Tower Server)**
  - **Mô tả**: Máy chủ tower có thiết kế giống như một máy tính để bàn đứng độc lập. Nó có hình dáng giống như một tháp, với các thành phần phần cứng bên trong được lắp ráp như một đơn vị độc lập.
  - **Ưu điểm**: Dễ dàng mở rộng và nâng cấp phần cứng, không yêu cầu giá đỡ, có thể sử dụng trong môi trường văn phòng nhỏ hoặc các doanh nghiệp vừa và nhỏ.
  - **Ứng dụng**: Các doanh nghiệp nhỏ, văn phòng làm việc, hoặc các ứng dụng không yêu cầu khối lượng công việc lớn.

- **Máy chủ Blade (Blade Server)**
  - **Mô tả**: Máy chủ blade là máy chủ có thiết kế mỏng và được lắp vào một khung giá blade. Mỗi blade là một đơn vị máy chủ riêng biệt và có thể lắp vào một khung giá blade để chia sẻ các tài nguyên chung như nguồn điện, mạng và hệ thống làm mát.
  - **Ưu điểm**: Tiết kiệm không gian và năng lượng, dễ dàng mở rộng và quản lý, chia sẻ các tài nguyên chung giúp giảm chi phí.
  - **Ứng dụng**: Các trung tâm dữ liệu lớn, môi trường ảo hóa và điện toán đám mây, nơi cần sự linh hoạt và hiệu suất cao.

- **Máy chủ Modular (Modular Server)**
  - **Mô tả**: Máy chủ modular cho phép kết hợp nhiều phần tử máy chủ riêng biệt vào một khung máy chủ duy nhất, mỗi phần tử có thể hoạt động độc lập hoặc cùng nhau.
  - **Ưu điểm**: Cung cấp khả năng mở rộng linh hoạt, dễ dàng nâng cấp và thay thế các phần tử.
  - **Ứng dụng**: Các trung tâm dữ liệu cần khả năng mở rộng nhanh chóng và dễ dàng điều chỉnh tài nguyên theo nhu cầu.

# Các linh kiện cấu thành lên máy chủ vật lý cơ bản
![](https://img001.prntscr.com/file/img001/boiFes9_SJyXqS8f05r6PQ.png)
1. Nút nguồn
2. Khóa nắp
3. Nút nguồn
4. Cổng IDRAC
5. Cổng VGA
6. Cổng Mạng
7. Cắm dây nguồn cho PSU
8. PSU(1100W)

### **Bộ xử lý (CPU) trong Máy chủ Vật lý**

#### **1. Khái niệm về Bộ xử lý (CPU)**

![](https://img001.prntscr.com/file/img001/se1eTQzCRdKZJjQJzeJvkA.png)

Bộ xử lý trung tâm (Central Processing Unit - CPU) là phần tử chính của máy tính hoặc máy chủ, có nhiệm vụ thực hiện các lệnh và phép toán theo chương trình đã được cài đặt. CPU được coi là "bộ não" của máy chủ, vì nó xử lý tất cả các tác vụ cần thiết để chạy hệ điều hành, ứng dụng, và các dịch vụ. CPU xử lý các lệnh từ bộ nhớ và thực hiện các phép toán để xử lý dữ liệu.

#### **2. Các loại CPU phổ biến**

- **Intel Xeon**
  - **Mô tả**: Intel Xeon là dòng CPU được thiết kế cho các máy chủ và trạm làm việc. Xeon nổi bật với khả năng xử lý đa nhiệm cao, khả năng mở rộng và tính ổn định. Nó hỗ trợ nhiều lõi và luồng, và có các tính năng đặc biệt như hỗ trợ ECC RAM (Error-Correcting Code) để đảm bảo độ tin cậy cao.
  - **Ứng dụng**: Thích hợp cho môi trường máy chủ doanh nghiệp, trung tâm dữ liệu, và các ứng dụng yêu cầu tính toán cao như phân tích dữ liệu lớn và ảo hóa.

- **AMD EPYC**
  - **Mô tả**: AMD EPYC là dòng CPU mới nổi bật với số lượng lõi và luồng cao, cung cấp hiệu suất xử lý đa nhiệm vượt trội. EPYC sử dụng kiến trúc Zen mới nhất và hỗ trợ các công nghệ tiên tiến như PCIe 4.0 và bộ nhớ DDR4.
  - **Ứng dụng**: Phù hợp cho các môi trường máy chủ cần hiệu suất cao và khả năng mở rộng, chẳng hạn như ảo hóa, điện toán đám mây, và các ứng dụng đòi hỏi tính toán cao.

- **IBM Power**
  - **Mô tả**: CPU IBM Power được thiết kế cho các máy chủ hạng nặng và các ứng dụng doanh nghiệp quan trọng. CPU Power cung cấp khả năng xử lý đồng thời cao và hiệu suất mạnh mẽ cho các ứng dụng yêu cầu tính toán phức tạp và khối lượng công việc lớn.
  - **Ứng dụng**: Được sử dụng trong các trung tâm dữ liệu lớn, máy chủ doanh nghiệp và các ứng dụng đòi hỏi độ tin cậy cao.

#### **3. Các thông số kỹ thuật của CPU**
![](https://img001.prntscr.com/file/img001/MJqROslpSPiFhMGGWbj2sA.png)

- **Nhân (Cores) và Luồng (Threads)**
  - **Nhân (Cores)**: Mỗi lõi của CPU có khả năng xử lý một nhiệm vụ độc lập. Số lượng lõi càng nhiều thì khả năng xử lý đa nhiệm càng tốt. Máy chủ thường có từ 8 đến 128 lõi hoặc nhiều hơn, giúp xử lý nhiều tác vụ đồng thời hiệu quả hơn.
  - **Luồng (Threads)**: Một lõi có thể xử lý nhiều luồng (threads) cùng một lúc nhờ công nghệ như Hyper-Threading của Intel hoặc Simultaneous Multithreading (SMT) của AMD. Số lượng luồng có thể gấp đôi số lõi, cho phép CPU xử lý nhiều tác vụ hơn trong cùng một thời điểm.

- **Xung nhịp (Clock Speed)**
  - **Mô tả**: Xung nhịp của CPU là số lượng chu kỳ lệnh mà CPU có thể thực hiện trong một giây, được đo bằng đơn vị Hertz (Hz). Ví dụ, 1 GHz (Gigahertz) tương đương với 1 tỷ chu kỳ mỗi giây.
  - **Tại sao xung nhịp của CPU máy chủ thường thấp?**: Trong máy chủ, việc xử lý nhiều tác vụ đồng thời và khả năng mở rộng thường quan trọng hơn việc có xung nhịp cao. Máy chủ thường ưu tiên số lượng lõi và luồng nhiều hơn là xung nhịp đơn, vì vậy các CPU máy chủ có xung nhịp thấp hơn nhưng nhiều lõi và luồng hơn, nhằm tối ưu hóa khả năng xử lý đa nhiệm và hiệu suất trong các môi trường ảo hóa và trung tâm dữ liệu.
  ![](https://img001.prntscr.com/file/img001/vb2dZB5-SrqXyAH4ipEvEw.png)
   1.  Số hiệu của CPU ở đây là I5 3th.
   2.  Tốc độ xung nhịp: 3.4Ghz(3 tỉ phép tính / giây)

- **Công nghệ và Tính năng đặc biệt**
  - **Hyper-Threading (Intel)**: Cho phép mỗi lõi xử lý hai luồng đồng thời, cải thiện hiệu suất khi chạy các ứng dụng đa nhiệm.
  - **Simultaneous Multithreading (AMD)**: Tương tự như Hyper-Threading, cho phép mỗi lõi xử lý nhiều luồng đồng thời.
  - **Turbo Boost (Intel)**: Tăng xung nhịp của CPU tạm thời khi cần thiết, giúp cải thiện hiệu suất trong các tác vụ đơn luồng.
  - **Precision Boost (AMD)**: Tương tự như Turbo Boost, tối ưu hóa xung nhịp để đạt hiệu suất tối đa trong các tác vụ đòi hỏi hiệu suất cao.

- **Điện năng tiêu thụ**
  - **Mô tả**: Điện năng tiêu thụ của CPU được đo bằng watt (W), cho biết lượng năng lượng mà CPU cần để hoạt động. Điện năng tiêu thụ ảnh hưởng đến hiệu suất tổng thể của máy chủ và chi phí vận hành.
  - **Lý do tại sao CPU máy chủ tiêu tốn điện năng nhiều hơn**: Các CPU máy chủ thường có nhiều lõi và luồng hơn, điều này dẫn đến việc tiêu thụ nhiều điện năng hơn so với các CPU cho máy tính cá nhân. Các máy chủ cũng thường yêu cầu hiệu suất liên tục và ổn định trong thời gian dài, dẫn đến mức tiêu thụ điện năng cao hơn.

#### **4. Lý do CPU máy chủ thường có nhiều nhân và luồng**

- **Hiệu suất đa nhiệm**: Máy chủ thường phải xử lý nhiều tác vụ đồng thời, từ các yêu cầu của người dùng đến các ứng dụng phức tạp. Số lượng lõi và luồng nhiều giúp máy chủ xử lý nhiều tác vụ đồng thời mà không làm giảm hiệu suất.
- **Ảo hóa**: Trong môi trường ảo hóa, mỗi máy chủ vật lý có thể chạy nhiều máy chủ ảo (VM). Số lượng lõi và luồng nhiều giúp phân phối tài nguyên hiệu quả cho các máy ảo, cải thiện khả năng xử lý và hiệu suất tổng thể.
- **Khả năng mở rộng**: Các máy chủ cần phải xử lý khối lượng công việc lớn và có khả năng mở rộng để đáp ứng nhu cầu ngày càng cao. CPU nhiều lõi và luồng cho phép máy chủ mở rộng khả năng xử lý mà không cần phải nâng cấp phần cứng thường xuyên.



### **Bộ nhớ (RAM) của Máy chủ**

#### **1. Khái niệm về Bộ nhớ (RAM)**

Bộ nhớ truy cập ngẫu nhiên (Random Access Memory - RAM) là loại bộ nhớ tạm thời cung cấp không gian cho dữ liệu và lệnh mà CPU đang xử lý. RAM giúp tăng tốc độ truy xuất dữ liệu so với việc truy cập từ ổ đĩa lưu trữ chậm hơn. Trong máy chủ, RAM rất quan trọng vì nó ảnh hưởng trực tiếp đến khả năng xử lý nhiều tác vụ đồng thời, tốc độ phản hồi của hệ thống và hiệu suất của các ứng dụng.

#### **2. Ứng dụng của RAM trong Máy chủ**

- **Chạy Ứng dụng**: RAM cung cấp không gian để lưu trữ dữ liệu và lệnh của các ứng dụng đang chạy, giúp cải thiện hiệu suất và tốc độ xử lý.
- **Ảo hóa**: Trong môi trường ảo hóa, mỗi máy ảo (VM) yêu cầu một phần của RAM để hoạt động hiệu quả. RAM nhiều hơn giúp chạy nhiều VM cùng lúc mà không làm giảm hiệu suất.
- **Cơ sở dữ liệu**: RAM giúp lưu trữ và xử lý các dữ liệu cơ sở dữ liệu tạm thời, tăng cường tốc độ truy xuất và xử lý dữ liệu.
- **Chạy các dịch vụ và nhiệm vụ phức tạp**: Các máy chủ thường chạy nhiều dịch vụ và nhiệm vụ đồng thời, đòi hỏi lượng RAM lớn để xử lý hiệu quả.

#### **3. Các thông số kỹ thuật của RAM**

- **Dung lượng (Capacity)**
  - **Mô tả**: Dung lượng RAM được đo bằng GB (Gigabytes). Dung lượng RAM cần thiết phụ thuộc vào khối lượng công việc và số lượng ứng dụng hoặc máy ảo đang chạy. Ví dụ, máy chủ có thể cần từ 16GB đến hàng TB (Terabytes) RAM, tùy vào ứng dụng và yêu cầu của hệ thống.
  
- **Tốc độ (Speed)**
  - **Mô tả**: Tốc độ RAM, được đo bằng MHz (Megahertz), xác định tốc độ mà RAM có thể truyền tải dữ liệu. Tốc độ RAM ảnh hưởng đến khả năng truyền tải dữ liệu và hiệu suất tổng thể của hệ thống. Ví dụ, DDR4 RAM có thể có tốc độ từ 2133 MHz đến 4266 MHz.
  
- **Thời gian trễ (Latency)**

![](https://img001.prntscr.com/file/img001/o6AJhEn6S4acC103coNqyg.png)
  - **Mô tả**: Thời gian trễ RAM đo thời gian cần thiết để truy xuất dữ liệu từ bộ nhớ. Được đo bằng các chỉ số CAS Latency (CL), thời gian trễ thấp hơn thường có nghĩa là RAM sẽ hoạt động nhanh hơn.

- **Kiến trúc (Architecture)**
  - **Mô tả**: Kiến trúc RAM xác định cách mà các thanh RAM được thiết kế và hoạt động. Các kiến trúc phổ biến bao gồm DDR (Double Data Rate), DDR2, DDR3, và DDR4. DDR5 là công nghệ mới nhất với hiệu suất cải thiện đáng kể so với các phiên bản trước.

#### **4. Các loại RAM**

- **DDR (Double Data Rate) RAM**
  - **DDR4**: Là loại RAM phổ biến hiện nay, cung cấp hiệu suất tốt và tiết kiệm năng lượng hơn so với DDR3. DDR4 có tốc độ từ 2133 MHz đến 4266 MHz.
  - **DDR5**: Công nghệ RAM mới nhất, cung cấp hiệu suất cao hơn và băng thông rộng hơn so với DDR4. DDR5 hỗ trợ tốc độ lên đến 8400 MHz và cải thiện hiệu quả năng lượng.

- **ECC RAM (Error-Correcting Code)**
  - **Mô tả**: ECC RAM có khả năng phát hiện và sửa lỗi dữ liệu, giúp đảm bảo tính ổn định và độ tin cậy cao trong các ứng dụng quan trọng. ECC RAM thường được sử dụng trong các máy chủ và hệ thống yêu cầu độ chính xác cao.

- **Registered (Buffered) RAM**
  - **Mô tả**: Registered RAM có thêm một bộ đệm giữa bộ nhớ và bộ điều khiển, giúp tăng cường khả năng ổn định và khả năng mở rộng. Thường được sử dụng trong các máy chủ và các hệ thống yêu cầu dung lượng RAM lớn.

#### **5. Công nghệ và Hãng sản xuất RAM**

- **Công nghệ**
  - **XMP (Extreme Memory Profile)**: Công nghệ cho phép người dùng cấu hình RAM để hoạt động ở tốc độ cao hơn so với tốc độ tiêu chuẩn, giúp tối ưu hóa hiệu suất hệ thống.
  - **Dual Channel, Triple Channel, Quad Channel**: Các công nghệ kênh bộ nhớ cho phép RAM hoạt động ở chế độ song song, cải thiện băng thông và hiệu suất tổng thể.

- **Hãng sản xuất**
  - **Corsair**: Nổi tiếng với các sản phẩm RAM hiệu suất cao và ổn định, bao gồm các dòng Vengeance, Dominator.
  - **Crucial**: Cung cấp các giải pháp RAM đáng tin cậy và hiệu suất tốt, bao gồm các dòng Ballistix.
  - **Kingston**: Được biết đến với các sản phẩm RAM chất lượng và ổn định, bao gồm các dòng HyperX.
  - **Samsung**: Sản xuất RAM chất lượng cao với công nghệ tiên tiến, thường được sử dụng trong các hệ thống máy chủ và máy tính cá nhân.

#### **6. Lưu ý khi chọn RAM cho Máy chủ**

- **Tương thích với Bo mạch chủ**: Đảm bảo rằng RAM bạn chọn tương thích với bo mạch chủ của máy chủ về loại (DDR4, DDR5), tốc độ, và dung lượng.
- **Dung lượng và yêu cầu ứng dụng**: Xác định dung lượng RAM cần thiết dựa trên khối lượng công việc, số lượng máy ảo, và ứng dụng chạy trên máy chủ.
- **ECC vs Non-ECC**: Chọn RAM ECC nếu bạn cần độ tin cậy cao và khả năng phát hiện và sửa lỗi. Đối với các ứng dụng không yêu cầu tính chính xác cao, RAM non-ECC có thể đủ.
- **Tốc độ và thời gian trễ**: Chọn RAM có tốc độ và thời gian trễ phù hợp với yêu cầu hiệu suất của hệ thống. RAM với tốc độ cao hơn có thể cải thiện hiệu suất, nhưng cần phải cân nhắc với chi phí và tương thích.
- **Nâng cấp và mở rộng**: Lên kế hoạch cho khả năng nâng cấp trong tương lai. Chọn RAM có dung lượng và khả năng mở rộng phù hợp với nhu cầu phát triển của hệ thống.
- 



### **Ổ đĩa lưu trữ (Disk) trong Máy chủ**

#### **1. Khái niệm về Ổ đĩa lưu trữ**

Ổ đĩa lưu trữ là phần tử quan trọng trong máy chủ, chịu trách nhiệm lưu trữ dữ liệu lâu dài. Các ổ đĩa lưu trữ có thể lưu trữ hệ điều hành, ứng dụng, dữ liệu của người dùng, và các tệp quan trọng khác. Trong máy chủ, ổ đĩa lưu trữ không chỉ cần có dung lượng lớn mà còn phải có hiệu suất cao và tính ổn định để đáp ứng yêu cầu xử lý dữ liệu nhanh chóng và tin cậy.

#### **2. Các loại ổ đĩa lưu trữ**

- **HDD (Hard Disk Drive)**
  - **Mô tả**: HDD là loại ổ đĩa lưu trữ truyền thống sử dụng đĩa từ và đầu đọc/ghi để lưu trữ dữ liệu. Dữ liệu được ghi lên các đĩa từ xoay và đọc qua các đầu đọc/ghi.
  - **Ưu điểm**: Giá thành thấp, dung lượng lớn, và phù hợp cho lưu trữ dữ liệu khối lượng lớn với chi phí hợp lý.
  - **Nhược điểm**: Tốc độ truy xuất dữ liệu chậm hơn so với SSD, dễ bị hư hỏng cơ học do các bộ phận chuyển động.

- **SSD (Solid State Drive)**
  - **Mô tả**: SSD là loại ổ đĩa lưu trữ sử dụng bộ nhớ flash để lưu trữ dữ liệu, không có các bộ phận chuyển động. SSD cung cấp tốc độ truy xuất dữ liệu nhanh hơn đáng kể so với HDD.
  - **Ưu điểm**: Tốc độ truy xuất dữ liệu nhanh, độ tin cậy cao, tiêu thụ điện năng thấp, và không bị ảnh hưởng bởi sự rung lắc.
  - **Nhược điểm**: Giá thành cao hơn so với HDD, mặc dù giá đang giảm dần theo thời gian.

- **NVMe (Non-Volatile Memory Express)**
  - **Mô tả**: NVMe là giao thức được thiết kế đặc biệt cho các ổ đĩa SSD sử dụng giao tiếp PCIe (Peripheral Component Interconnect Express). NVMe cung cấp tốc độ truy xuất dữ liệu cực kỳ nhanh chóng, gấp nhiều lần so với SSD sử dụng giao thức SATA.
  - **Ưu điểm**: Tốc độ cao hơn, hiệu suất tuyệt vời cho các ứng dụng đòi hỏi tốc độ truy xuất dữ liệu lớn, phù hợp cho các máy chủ hiệu suất cao.
  - **Nhược điểm**: Giá cao hơn so với SSD SATA và HDD, và yêu cầu bo mạch chủ hỗ trợ NVMe.

#### **3. Thông số kỹ thuật của ổ đĩa lưu trữ**

- **Dung lượng (Capacity)**
  - **Mô tả**: Dung lượng của ổ đĩa lưu trữ xác định số lượng dữ liệu mà nó có thể lưu trữ. Dung lượng ổ đĩa thường được đo bằng GB (Gigabytes) hoặc TB (Terabytes). Ví dụ, HDD có thể có dung lượng từ 500GB đến 16TB, trong khi SSD thường có dung lượng từ 128GB đến 4TB.

- **Tốc độ quay (RPM) (chỉ áp dụng cho HDD)**
  - **Mô tả**: Tốc độ quay của ổ đĩa HDD, đo bằng vòng/phút (RPM), ảnh hưởng đến tốc độ truy xuất dữ liệu. Tốc độ quay phổ biến là 5400 RPM và 7200 RPM. 10000 RPM và 15000 RPM thường được sử dụng trong các ứng dụng yêu cầu hiệu suất cao.
  
- **Tốc độ truyền dữ liệu (Data Transfer Rate)**
  - **Mô tả**: Tốc độ truyền dữ liệu đo lường tốc độ mà dữ liệu có thể được đọc từ hoặc ghi vào ổ đĩa. Tốc độ này thường được đo bằng MB/s (Megabytes per second). SSD thường có tốc độ truyền dữ liệu từ 500 MB/s đến 5500 MB/s, trong khi HDD có tốc độ thấp hơn, thường từ 80 MB/s đến 200 MB/s.

- **I/O Operations Per Second (IOPS)**
  - **Mô tả**: IOPS đo lường số lượng thao tác đọc/ghi mà ổ đĩa có thể thực hiện trong một giây. SSD có IOPS cao hơn nhiều so với HDD, giúp cải thiện hiệu suất cho các ứng dụng yêu cầu nhiều thao tác I/O.

#### **4. Công nghệ và Chuẩn kết nối**

- **SATA (Serial ATA)**
  - **Mô tả**: SATA là chuẩn kết nối phổ biến cho HDD và SSD. SATA III, phiên bản mới nhất, cung cấp tốc độ truyền dữ liệu tối đa 6 Gbps (gigabits per second). SATA SSD thường có tốc độ thấp hơn so với NVMe SSD.
  
- **PCIe (Peripheral Component Interconnect Express)**
  - **Mô tả**: PCIe là chuẩn kết nối được sử dụng bởi NVMe SSD. PCIe cung cấp băng thông cao hơn và tốc độ truyền dữ liệu nhanh hơn so với SATA, với tốc độ tối đa lên đến 32 Gbps (với PCIe 3.0 x4) và 64 Gbps (với PCIe 4.0 x4).

- **M.2**
  - **Mô tả**: M.2 là một dạng kết nối nhỏ gọn dành cho SSD, có thể sử dụng cả giao thức SATA hoặc NVMe. M.2 NVMe SSD cung cấp hiệu suất cao hơn, trong khi M.2 SATA SSD có tốc độ tương đương với các ổ đĩa SATA tiêu chuẩn.

- **U.2 (trước đây là SFF-8639)**
  - **Mô tả**: U.2 là chuẩn kết nối được sử dụng cho các SSD NVMe 2.5 inch, cung cấp băng thông cao hơn và khả năng mở rộng tốt hơn cho các máy chủ và các hệ thống lưu trữ doanh nghiệp.

#### **5. So sánh giữa các loại ổ đĩa**

- **HDD vs SSD**
  - **Tốc độ**: SSD nhanh hơn nhiều so với HDD. Trong khi HDD có tốc độ truyền dữ liệu từ 80 MB/s đến 200 MB/s, SSD có tốc độ từ 500 MB/s đến 5500 MB/s (đối với NVMe SSD).
  - **Giá thành**: HDD có giá thành thấp hơn SSD. HDD cung cấp dung lượng lưu trữ lớn hơn với chi phí thấp hơn, trong khi SSD có giá cao hơn nhưng cung cấp hiệu suất tốt hơn.
  - **Độ bền và tin cậy**: SSD có độ bền và tin cậy cao hơn vì không có các bộ phận chuyển động, trong khi HDD dễ bị hư hỏng cơ học do các bộ phận chuyển động.

- **SSD SATA vs SSD NVMe**
  - **Tốc độ**: SSD NVMe nhanh hơn nhiều so với SSD SATA. SSD SATA có tốc độ truyền dữ liệu tối đa khoảng 600 MB/s, trong khi SSD NVMe có thể đạt tốc độ lên đến 5500 MB/s.
  - **Giá thành**: SSD NVMe có giá cao hơn SSD SATA. SSD NVMe cung cấp hiệu suất tốt hơn nhưng với chi phí cao hơn.

#### **6. Lưu ý khi chọn ổ đĩa lưu trữ**

- **Yêu cầu hiệu suất**: Chọn loại ổ đĩa dựa trên yêu cầu hiệu suất của ứng dụng. SSD NVMe thích hợp cho các ứng dụng đòi hỏi tốc độ truy xuất dữ liệu cao, trong khi HDD phù hợp cho lưu trữ dữ liệu lớn với chi phí thấp.
- **Dung lượng lưu trữ**: Xác định dung lượng ổ đĩa cần thiết dựa trên nhu cầu lưu trữ dữ liệu hiện tại và dự kiến trong tương lai.
- **Tương thích với hệ thống**: Đảm bảo rằng ổ đĩa bạn chọn tương thích với bo mạch chủ và hệ thống máy chủ của bạn về chuẩn kết nối (SATA, PCIe) và kích thước (2.5 inch, 3.5 inch, M.2).
- **Chi phí và ngân sách**: Cân nhắc giữa giá thành và hiệu suất. SSD có hiệu suất cao nhưng giá thành cao hơn, trong khi HDD có giá thành thấp hơn nhưng tốc độ chậm hơn.
- 

### **Bộ nguồn (Power Supply Unit - PSU) trong Máy chủ**

#### **1. Khái niệm về Bộ nguồn (PSU)**

Bộ nguồn (PSU) là thành phần quan trọng trong máy chủ, có chức năng chuyển đổi nguồn điện từ lưới điện AC (Alternating Current) thành nguồn điện DC (Direct Current) mà các linh kiện máy chủ cần. PSU đảm bảo cung cấp nguồn điện ổn định và đủ mạnh để đáp ứng nhu cầu hoạt động của các thành phần phần cứng trong máy chủ, bao gồm CPU, RAM, ổ đĩa lưu trữ, và các thiết bị khác.

#### **2. Các thông số kỹ thuật của PSU**

- **Công suất (Wattage)**
  - **Mô tả**: Công suất của PSU đo lường khả năng cung cấp điện năng của bộ nguồn, thường được đo bằng watt (W). Công suất cần thiết phụ thuộc vào tổng lượng điện năng tiêu thụ của các linh kiện trong máy chủ. Công suất phổ biến cho PSU trong máy chủ có thể từ 500W đến 2000W hoặc cao hơn cho các hệ thống yêu cầu hiệu suất cao.
  - **Lưu ý**: Chọn PSU có công suất cao hơn một chút so với nhu cầu thực tế của hệ thống để đảm bảo hoạt động ổn định và khả năng mở rộng.

- **Hiệu suất (Efficiency)**
  - **Mô tả**: Hiệu suất của PSU đo lường tỷ lệ phần trăm của điện năng từ lưới điện được chuyển đổi thành điện năng sử dụng được. Hiệu suất cao hơn có nghĩa là ít điện năng bị lãng phí dưới dạng nhiệt. Hiệu suất PSU thường được đo bằng các chứng chỉ 80 PLUS, bao gồm 80 PLUS Bronze, Silver, Gold, Platinum, và Titanium.
  - **Lưu ý**: PSU có hiệu suất cao giúp tiết kiệm năng lượng và giảm chi phí vận hành, đồng thời giảm nhiệt phát sinh.

- **Điện áp đầu ra (Output Voltage)**
  - **Mô tả**: PSU cung cấp các mức điện áp đầu ra khác nhau cần thiết cho các linh kiện máy chủ, thường bao gồm +3.3V, +5V, và +12V. PSU phải đáp ứng các yêu cầu điện áp của các linh kiện để đảm bảo hoạt động ổn định.

- **Độ ổn định điện áp (Voltage Regulation)**
  - **Mô tả**: Độ ổn định điện áp đo lường khả năng của PSU trong việc duy trì mức điện áp đầu ra ổn định, ngay cả khi tải thay đổi. Độ ổn định tốt giúp bảo vệ các linh kiện khỏi các biến động điện áp có thể gây hại.

#### **3. Các loại PSU**

- **PSU đơn (Single Rail PSU)**
  - **Mô tả**: PSU đơn có một đường điện áp 12V chính cung cấp cho tất cả các thiết bị. Loại PSU này đơn giản và dễ sử dụng nhưng có thể gặp vấn đề nếu xảy ra quá tải ở một đường điện áp cụ thể.

- **PSU nhiều đường (Multi-Rail PSU)**
  - **Mô tả**: PSU nhiều đường có nhiều đường điện áp 12V, mỗi đường có giới hạn công suất riêng. Loại PSU này giúp phân phối tải đồng đều và bảo vệ các linh kiện khỏi quá tải, nhưng có thể phức tạp hơn trong việc cấu hình.

- **PSU dự phòng (Redundant PSU)**
  - **Mô tả**: PSU dự phòng bao gồm hai hoặc nhiều bộ nguồn hoạt động song song, với một bộ nguồn hoạt động chính và các bộ nguồn khác đóng vai trò dự phòng. Nếu bộ nguồn chính gặp sự cố, các bộ nguồn dự phòng sẽ tự động hoạt động để duy trì cung cấp điện. Loại PSU này thường được sử dụng trong các máy chủ yêu cầu tính khả dụng cao và liên tục hoạt động.

#### **4. Chuẩn kết nối và cổng**

- **Cổng ATX 24-pin**
  - **Mô tả**: Cổng ATX 24-pin cung cấp nguồn điện chính cho bo mạch chủ. Đây là chuẩn kết nối phổ biến nhất cho các máy chủ và máy tính cá nhân hiện đại.

- **Cổng EPS 8-pin**
  - **Mô tả**: Cổng EPS 8-pin cung cấp nguồn điện bổ sung cho CPU. Cổng này thường được yêu cầu trong các hệ thống máy chủ có nhiều CPU hoặc CPU hiệu suất cao.

- **Cổng PCIe 6-pin/8-pin**
  - **Mô tả**: Cổng PCIe cung cấp nguồn điện cho các card đồ họa hoặc các thiết bị mở rộng khác. Các card đồ họa cao cấp thường yêu cầu nguồn điện từ các cổng này.

- **Cổng SATA**
  - **Mô tả**: Cổng SATA cung cấp nguồn điện cho các ổ đĩa SSD và HDD SATA. Cổng này thường có thiết kế nhỏ gọn và dễ dàng kết nối.

- **Cổng Molex**
  - **Mô tả**: Cổng Molex cung cấp nguồn điện cho các thiết bị cũ hơn như quạt và ổ đĩa cứng IDE. Mặc dù không còn phổ biến, nhưng một số máy chủ và thiết bị vẫn sử dụng cổng này.

#### **5. Lưu ý khi chọn PSU**

- **Công suất cần thiết**: Đánh giá tổng lượng công suất cần thiết dựa trên các linh kiện và thiết bị trong máy chủ. Sử dụng công cụ tính toán PSU hoặc tham khảo bảng thông số của từng linh kiện để xác định công suất phù hợp.

- **Hiệu suất và chứng chỉ 80 PLUS**: Chọn PSU có chứng chỉ 80 PLUS để đảm bảo hiệu suất cao và tiết kiệm năng lượng. Chứng chỉ cao hơn (Gold, Platinum, Titanium) thường mang lại hiệu suất tốt hơn.

- **Tính năng dự phòng**: Nếu máy chủ yêu cầu độ tin cậy cao, chọn PSU dự phòng để đảm bảo nguồn điện liên tục ngay cả khi một bộ nguồn gặp sự cố.

- **Chất lượng và thương hiệu**: Chọn PSU từ các thương hiệu uy tín với chất lượng và độ tin cậy cao. Một số thương hiệu nổi tiếng bao gồm Corsair, EVGA, Seasonic, và SilverStone.

- **Tương thích với hệ thống**: Đảm bảo PSU có đủ cổng kết nối phù hợp với bo mạch chủ, card đồ họa, và các thiết bị khác trong máy chủ.

- **Tiết kiệm năng lượng và làm mát**: Chọn PSU có hiệu suất cao và hệ thống làm mát tốt để giảm nhiệt phát sinh và tiết kiệm chi phí điện năng.



### **Card mạng (Network Interface Card - NIC) trong Máy chủ**

#### **1. Khái niệm về Card mạng (NIC)**

Card mạng (Network Interface Card - NIC) là một thiết bị phần cứng có nhiệm vụ kết nối máy chủ với mạng nội bộ hoặc mạng internet. NIC có thể là một thẻ cắm vào khe mở rộng trên bo mạch chủ (PCIe, PCI) hoặc là một phần của bo mạch chủ. NIC chịu trách nhiệm chuyển đổi dữ liệu từ dạng tín hiệu số thành tín hiệu mạng (Ethernet, Fiber Channel) và ngược lại, giúp máy chủ giao tiếp với các thiết bị khác trong mạng.

#### **2. Các loại NIC**

- **NIC Ethernet**
  - **Mô tả**: NIC Ethernet là loại card mạng phổ biến nhất, sử dụng chuẩn Ethernet để kết nối máy chủ với mạng. NIC Ethernet có thể hỗ trợ các tốc độ khác nhau như 1G (Gigabit Ethernet), 10G (10 Gigabit Ethernet), 25G, 40G, và 100G.
  - **Ứng dụng**: Thích hợp cho hầu hết các môi trường mạng doanh nghiệp và trung tâm dữ liệu.

- **NIC Fiber Channel**
  - **Mô tả**: NIC Fiber Channel được sử dụng trong các mạng lưu trữ Fibre Channel (SAN). Nó cung cấp kết nối tốc độ cao giữa máy chủ và hệ thống lưu trữ mạng.
  - **Ứng dụng**: Thích hợp cho các môi trường lưu trữ đòi hỏi tốc độ cao và dung lượng lớn, như trong các trung tâm dữ liệu lớn.

- **NIC Wi-Fi**
  - **Mô tả**: NIC Wi-Fi cung cấp kết nối không dây cho máy chủ, sử dụng các chuẩn Wi-Fi như 802.11ac, 802.11ax (Wi-Fi 6).
  - **Ứng dụng**: Thích hợp cho các máy chủ yêu cầu kết nối mạng không dây, mặc dù trong môi trường máy chủ truyền thống, kết nối có dây vẫn phổ biến hơn.

#### **3. Thông số kỹ thuật của NIC**

- **Tốc độ kết nối**
  - **Mô tả**: Tốc độ kết nối của NIC đo lường khả năng truyền tải dữ liệu qua mạng. NIC Ethernet thường có tốc độ từ 1 Gbps (Gigabit per second) đến 100 Gbps, tùy thuộc vào mô hình và công nghệ.
  - **Lưu ý**: Chọn NIC với tốc độ phù hợp với yêu cầu băng thông của hệ thống và mạng.

- **Chuẩn giao tiếp**
  - **Mô tả**: NIC có thể sử dụng các chuẩn giao tiếp khác nhau như PCIe (Peripheral Component Interconnect Express) hoặc PCI (Peripheral Component Interconnect). PCIe là chuẩn phổ biến hiện nay do tốc độ truyền dữ liệu cao hơn.
  - **Lưu ý**: Đảm bảo NIC tương thích với khe cắm trên bo mạch chủ.

- **Số lượng cổng**
  - **Mô tả**: NIC có thể có một hoặc nhiều cổng mạng. Các NIC có nhiều cổng (dual-port, quad-port) giúp tăng khả năng dự phòng và phân phối tải.
  - **Lưu ý**: Chọn NIC với số lượng cổng phù hợp với cấu hình mạng và nhu cầu kết nối.

- **Hỗ trợ tính năng nâng cao**
  - **Mô tả**: Một số NIC hỗ trợ các tính năng nâng cao như VLAN (Virtual Local Area Network), QoS (Quality of Service), và offloading (tính năng chuyển một số nhiệm vụ từ CPU sang NIC để cải thiện hiệu suất).
  - **Lưu ý**: Tính năng nâng cao giúp tối ưu hóa hiệu suất mạng và quản lý lưu lượng tốt hơn.

#### **4. Công nghệ NIC**

- **Ethernet (1G, 10G, 25G, 40G, 100G)**
  - **Mô tả**: Công nghệ Ethernet cung cấp các tốc độ khác nhau cho NIC, từ Gigabit Ethernet (1G) đến 100 Gigabit Ethernet (100G). Công nghệ này được sử dụng rộng rãi trong các mạng doanh nghiệp và trung tâm dữ liệu.
  - **Lưu ý**: Chọn tốc độ phù hợp với nhu cầu băng thông và khả năng hỗ trợ của hạ tầng mạng.

- **Fibre Channel**
  - **Mô tả**: Fibre Channel là công nghệ mạng chuyên dụng cho lưu trữ với tốc độ cao, cung cấp khả năng truyền tải dữ liệu lớn giữa máy chủ và hệ thống lưu trữ. Các tốc độ phổ biến bao gồm 4G, 8G, 16G, 32G.
  - **Lưu ý**: Thích hợp cho các môi trường lưu trữ yêu cầu tốc độ cao và độ tin cậy.

- **Wi-Fi (802.11ac, 802.11ax)**
  - **Mô tả**: Công nghệ Wi-Fi cung cấp kết nối không dây với các chuẩn như 802.11ac (Wi-Fi 5) và 802.11ax (Wi-Fi 6), mang lại tốc độ và hiệu suất mạng không dây cao.
  - **Lưu ý**: Chọn NIC Wi-Fi phù hợp với chuẩn Wi-Fi và khả năng tương thích của các thiết bị trong mạng.

#### **5. Lưu ý khi chọn NIC**

- **Tốc độ và băng thông**: Chọn NIC với tốc độ phù hợp với yêu cầu băng thông của hệ thống và mạng. Đối với các ứng dụng yêu cầu tốc độ cao, như các trung tâm dữ liệu hoặc môi trường ảo hóa, NIC tốc độ cao như 10G hoặc 25G là cần thiết.

- **Tính năng hỗ trợ**: Kiểm tra các tính năng hỗ trợ như VLAN, QoS, và offloading. Những tính năng này giúp cải thiện hiệu suất mạng và quản lý lưu lượng.

- **Tương thích với hệ thống**: Đảm bảo NIC tương thích với bo mạch chủ và hệ điều hành của máy chủ. Kiểm tra chuẩn giao tiếp (PCIe, PCI) và các yêu cầu phần mềm.

- **Khả năng mở rộng**: Nếu cần mở rộng hoặc cải thiện tính sẵn sàng, chọn NIC với nhiều cổng hoặc khả năng hỗ trợ dự phòng.

- **Thương hiệu và chất lượng**: Chọn NIC từ các nhà sản xuất uy tín để đảm bảo chất lượng và hỗ trợ kỹ thuật tốt. Một số thương hiệu nổi tiếng bao gồm Intel, Broadcom, và Mellanox.

- **Chi phí và ngân sách**: Cân nhắc giữa hiệu suất và chi phí. NIC với tốc độ cao và tính năng nâng cao thường có giá cao hơn, vì vậy chọn NIC phù hợp với ngân sách và nhu cầu.


### **Card RAID (RAID Controller) trong Máy chủ**

#### **1. Khái niệm về Card RAID**

Card RAID, hay còn gọi là RAID Controller, là một thiết bị phần cứng được sử dụng để quản lý và điều khiển các ổ đĩa cứng (HDD) hoặc ổ đĩa thể rắn (SSD) trong hệ thống lưu trữ. Card RAID thực hiện các chức năng của RAID (Redundant Array of Independent Disks), bao gồm việc tổ chức các ổ đĩa thành các cấu hình RAID khác nhau để cải thiện hiệu suất, tăng cường độ tin cậy, và nâng cao khả năng chịu lỗi. RAID Controller giúp máy chủ bảo vệ dữ liệu khỏi mất mát bằng cách lưu trữ dữ liệu theo cách phân tán và có khả năng phục hồi khi xảy ra lỗi.

#### **2. Các loại Card RAID**

- **RAID Controller Onboard**
  - **Mô tả**: Một số bo mạch chủ có RAID Controller tích hợp sẵn. RAID Controller onboard thường hỗ trợ các cấp RAID cơ bản như RAID 0, 1, và 5.
  - **Ứng dụng**: Thích hợp cho các hệ thống nhỏ hoặc máy chủ không yêu cầu tính năng RAID phức tạp.

- **RAID Controller Add-on (Thẻ mở rộng)**
  - **Mô tả**: RAID Controller add-on là thẻ cắm vào khe PCIe trên bo mạch chủ, cung cấp khả năng điều khiển RAID với các tính năng và cấu hình nâng cao. Các RAID Controller add-on có thể hỗ trợ nhiều cấp RAID và số lượng ổ đĩa lớn hơn.
  - **Ứng dụng**: Thích hợp cho các hệ thống máy chủ yêu cầu hiệu suất cao, dung lượng lưu trữ lớn, và tính năng RAID tiên tiến.

#### **3. Các cấp RAID và chức năng của Card RAID**

- **RAID 0 (Striping)**
  - **Mô tả**: RAID 0 phân tán dữ liệu trên nhiều ổ đĩa để cải thiện hiệu suất đọc/ghi. Không có dự phòng dữ liệu, nếu một ổ đĩa gặp sự cố, toàn bộ dữ liệu sẽ bị mất.
  - **Ứng dụng**: Thích hợp cho các ứng dụng yêu cầu hiệu suất cao mà không cần bảo vệ dữ liệu.

- **RAID 1 (Mirroring)**
  - **Mô tả**: RAID 1 sao chép dữ liệu trên hai hoặc nhiều ổ đĩa. Nếu một ổ đĩa gặp sự cố, dữ liệu vẫn có sẵn trên các ổ đĩa còn lại.
  - **Ứng dụng**: Thích hợp cho các hệ thống yêu cầu độ tin cậy cao và bảo vệ dữ liệu, chẳng hạn như máy chủ cơ sở dữ liệu.

- **RAID 5 (Striping with Parity)**
  - **Mô tả**: RAID 5 phân tán dữ liệu và parity (dữ liệu kiểm tra lỗi) trên nhiều ổ đĩa. Parity cho phép phục hồi dữ liệu nếu một ổ đĩa bị lỗi. RAID 5 yêu cầu ít nhất ba ổ đĩa.
  - **Ứng dụng**: Thích hợp cho các hệ thống cần cân bằng giữa hiệu suất, dung lượng lưu trữ và bảo vệ dữ liệu.

- **RAID 6 (Striping with Double Parity)**
  - **Mô tả**: RAID 6 giống như RAID 5 nhưng sử dụng hai khối parity để cung cấp khả năng phục hồi nếu hai ổ đĩa gặp sự cố. RAID 6 yêu cầu ít nhất bốn ổ đĩa.
  - **Ứng dụng**: Thích hợp cho các hệ thống yêu cầu độ tin cậy cao hơn so với RAID 5, đặc biệt là trong môi trường lưu trữ lớn.

- **RAID 10 (1+0)**
  - **Mô tả**: RAID 10 kết hợp RAID 0 và RAID 1. Nó cung cấp cả phân tán dữ liệu (striping) và sao chép dữ liệu (mirroring). RAID 10 yêu cầu ít nhất bốn ổ đĩa.
  - **Ứng dụng**: Thích hợp cho các hệ thống yêu cầu hiệu suất cao và độ tin cậy, như các máy chủ cơ sở dữ liệu và ứng dụng yêu cầu đọc/ghi cao.

#### **4. Các thông số kỹ thuật của Card RAID**

- **Số lượng cổng**
  - **Mô tả**: Card RAID có thể có nhiều cổng để kết nối với nhiều ổ đĩa. Các card RAID cao cấp có thể hỗ trợ từ 8 đến 16 hoặc nhiều cổng hơn.
  - **Lưu ý**: Chọn card RAID với số lượng cổng phù hợp với số lượng ổ đĩa cần sử dụng.

- **Tốc độ giao tiếp**
  - **Mô tả**: Card RAID có thể sử dụng các chuẩn giao tiếp khác nhau như SATA (Serial ATA) hoặc SAS (Serial Attached SCSI). SAS thường cung cấp tốc độ cao hơn và độ tin cậy tốt hơn so với SATA.
  - **Lưu ý**: Chọn chuẩn giao tiếp phù hợp với yêu cầu hiệu suất và dung lượng lưu trữ của hệ thống.

- **Bộ nhớ cache**
  - **Mô tả**: Một số card RAID có bộ nhớ cache để tăng tốc độ truy cập dữ liệu và cải thiện hiệu suất. Bộ nhớ cache giúp giảm thời gian truy cập và tăng hiệu suất ghi dữ liệu.
  - **Lưu ý**: Card RAID có bộ nhớ cache lớn hơn có thể cung cấp hiệu suất tốt hơn, nhưng cũng có thể đắt hơn.

- **Hỗ trợ tính năng nâng cao**
  - **Mô tả**: Một số card RAID hỗ trợ các tính năng nâng cao như quản lý RAID từ xa, bảo vệ pin cho bộ nhớ cache (BBU - Battery Backup Unit), và quản lý các sự kiện lỗi.
  - **Lưu ý**: Các tính năng nâng cao giúp cải thiện quản lý và bảo trì hệ thống RAID.

#### **5. Công nghệ và Tính năng của Card RAID**

- **RAID Management Software**
  - **Mô tả**: Phần mềm quản lý RAID cho phép cấu hình, giám sát, và quản lý các thiết lập RAID từ xa. Phần mềm này thường đi kèm với card RAID hoặc có thể tải xuống từ trang web của nhà sản xuất.
  - **Lưu ý**: Phần mềm quản lý RAID giúp kiểm tra trạng thái của các ổ đĩa, cấu hình RAID, và thực hiện các tác vụ bảo trì.

- **Battery Backup Unit (BBU)**
  - **Mô tả**: BBU cung cấp năng lượng dự phòng cho bộ nhớ cache của card RAID trong trường hợp mất điện, giúp bảo vệ dữ liệu đang được ghi vào ổ đĩa.
  - **Lưu ý**: BBU là một tính năng quan trọng cho các hệ thống yêu cầu bảo vệ dữ liệu nghiêm ngặt và giảm nguy cơ mất dữ liệu.

- **Hot Swappable Drives**
  - **Mô tả**: Một số card RAID hỗ trợ tính năng thay thế ổ đĩa nóng (hot swap), cho phép thay thế ổ đĩa bị lỗi mà không cần tắt máy chủ.
  - **Lưu ý**: Tính năng này giúp giảm thời gian downtime và cải thiện khả năng duy trì hoạt động của hệ thống.

#### **6. Lưu ý khi chọn Card RAID**

- **Tính tương thích**: Đảm bảo card RAID tương thích với bo mạch chủ và các ổ đĩa sử dụng trong hệ thống. Kiểm tra chuẩn giao tiếp và số lượng cổng cần thiết.

- **Yêu cầu hiệu suất**: Chọn card RAID phù hợp với yêu cầu hiệu suất của hệ thống. Các card RAID cao cấp với bộ nhớ cache lớn hơn và tốc độ giao tiếp nhanh hơn sẽ cung cấp hiệu suất tốt hơn.

- **Tính năng nâng cao**: Cân nhắc các tính năng nâng cao như quản lý từ xa, BBU, và hỗ trợ hot swap nếu cần thiết cho hệ thống của bạn.

- **Ngân sách**: Card RAID có nhiều mức giá khác nhau. Xác định ngân sách và chọn card RAID phù hợp với yêu cầu của hệ thống và ngân sách.

- **Thương hiệu và chất lượng**: Chọn card RAID từ các nhà sản xuất uy tín như Dell, HP, LSI (Broadcom), hoặc Adaptec để đảm bảo chất lượng và hỗ trợ kỹ thuật tốt.



