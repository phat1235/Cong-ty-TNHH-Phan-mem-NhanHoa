<a name = "mucluc"></a>
[Mục lục](#mucluc)
[1. Ổ cứng HDD là gì?](#1)

[2. Ổ cứng SSD là gì?](#2)

[3. Ổ cứng NVME là gì?](#3)

[4. Điểm khác biệt giữa ổ cứng lưu trữ NVME, SSD và HDD](#4)

[5. Lợi ích của công nghệ NVME](#5)

[6. VPS NVME là gì?](#6)

<a name = "1"><a/>
# 1. Ổ cứng HDD là gì?

Ổ cứng HDD (Hard Disk Drive) là một ổ đĩa lưu trữ dữ liệu bên trong máy tính. Nó có các đĩa quay bên trong và dữ liệu được lưu trữ từ tính. Ổ HDD có một “cánh tay” (là một đầu dò) để ghi và đọc dữ liệu từ mặt đĩa phủ vật liệu từ tính. Nó hoạt động tương tự như đầu ghi đĩa CD. “Cánh tay” di chuyển giữa các vị trí khác nhau trên bề mặt đĩa để truy xuất dữ liệu khác nhau.

Ổ cứng HDD là công nghệ kế thừa và tồn tại trước cả SSD. Với chi phí rẻ để có được dung lượng lưu trữ lớn, ổ cứng HDD đặc biệt phù hợp cho việc lưu trữ dữ liệu truy cập không thường xuyên như tài liệu, phim, ảnh…

Hiện nay có 2 dạng ổ cứng HDD phổ biến là: 
- HDD 2.5 inch thường thấy trên laptop
- HDD 3.5 inch thường thấy trên máy tính để bàn

![](https://img001.prntscr.com/file/img001/VGM7LivbRNibZMlir7m0Lw.png)

**Bên trong một chiếc ổ cứng HDD**
<a name = "2"><a/>
# 2. Ổ cứng SSD là gì?

Khác với HDD, SSD (Solid State Drive) là loại ổ cứng thể rắn sử dụng bộ nhớ lưu trữ flash. Tất cả dữ liệu được lưu trữ trong các mạch tích hợp. Sự khác biệt này so với ổ cứng HDD là điều đặc biệt có ý nghĩa về mặt kích thước và hiệu suất. Không cần đĩa quay, việc SSD có kích thước như một thanh kẹo cao su (ở chuẩn M2) hoặc chỉ bằng một con tem bưu chính là điều đã được hiện thực hóa.

SSD làm giảm đáng kể thời gian truy cập của người dùng thay vì HDD cần phải đợi vòng quay của ổ đĩa. Vì SSD ở thể rắn nên nó bền hơn, độ tin cậy cao hơn HDD. SSD đang dần tiến đến khả năng truy cập dữ liệu nhanh hệt như một bộ nhớ flash khác trong PC là RAM.

SSD đắt hơn HDD trên từng dung lượng của ổ đĩa tính bằng GB, TB. Nhưng hiện nay, SSD đang có xu hướng và tốc độ giảm giá nhanh hơn HDD qua từng năm.

![](https://img001.prntscr.com/file/img001/zV0Hm_WeTdy0FrCBa3UIyg.png)

**Tốc độ đo được từ một ổ cứng SSD thông dụng**

<a name = "3"><a/>
# 3. Ổ cứng NVME là gì?

Ổ cứng NVME (Non-Volatile Memory Express) thực ra vẫn là một ổ cứng lưu trữ dạng rắn như SSD. Nhưng NVME nói về một công nghệ truyền tải dữ liệu khác so với SSD thông thường sử dụng SATA. NVME là một giao thức truyền dữ liệu qua các làn tốc độ cao của khe cắm PCIe trên mainboard.

Thông thường một cổng kết nối SATA (dùng cho ổ cứng HDD và SSD) chỉ truyền tải tốc độ tối đa qua cổng là 6Gbps. Khi sử dụng PCIe để truyền tải dữ liệu có thể đạt tốc độ cao hơn gấp nhiều lần vì mỗi làn trong giao diện PCIe có thể truyền dữ liệu xấp xỉ 2Gbps. Ngoài ra giao diện này còn có thể giao tiếp trực tiếp với CPU, cho phép băng thông cao hơn (tốc độ đọc tốt hơn), do đó thời gian phản hồi cũng ngắn hơn.
<a name = "4"><a/>
# 4. Điểm khác biệt giữa ổ cứng lưu trữ NVME, SSD và HDD

![](https://img001.prntscr.com/file/img001/nunkZLcoQGy9_QBdEKgzlA.png)

So với NVME và SSD, HDD là một dạng công nghệ ổ cứng sử dụng cách thức lưu trữ hoàn toàn khác và có thể coi là lỗi thời. Bằng việc đọc ghi dữ liệu từ một mặt đĩa phủ từ tính, HDD có độ an toàn dữ liệu, tốc độ truy cập, kích thước đều bị giới hạn bởi chất lượng vật liệu từ tính và vòng quay ổ đĩa. Khi muốn phát triển một HDD nhanh hơn, ta phải đánh đổi tuổi thọ ổ cứng vì phải tăng tốc độ vòng quay. Và kích thước, trọng lượng HDD gần như không thay đổi kể từ khi nó ra đời. Tuy nhiên bù lại bạn sẽ có dung lượng lưu trữ lớn hơn với chi phí rẻ hơn.

Cũng giống như SSD, NVME là một loại ổ cứng thể rắn, việc đọc ghi dữ liệu thông qua các mạch điện tử.

Như đã đề cập ở trên, sự khác biệt lớn nhất giữa NVME và SSD là giao diện truyền dữ liệu giữa ổ cứng và bo mạch chủ. “E” trong NVME là viết tắt của Express, một cách thức truyền dữ liệu qua làn PCIe trực tiếp tới CPU. Được thiết kế để nâng cao tính song song và độ trễ thấp.

Vì vậy, khi bạn nói lưu trữ SSD, nó có nghĩa là lưu trữ trạng thái rắn được kết nối với máy chủ thông qua giao diện SATA hoặc SATA chậm hơn. Mặt khác, lưu trữ NVMe đề cập đến lưu trữ trạng thái rắn được kết nối với máy chủ thông qua giao diện Express thế hệ tiếp theo, nhanh hơn, đáng tin cậy hơn.

<a name = "5"><a/>
# 5. Lợi ích của công nghệ NVME

![](https://img001.prntscr.com/file/img001/1cKKOqNGREqMzq-2YTTEAg.png)

## Các IOPS (Input/Output Per Second)

Với bus PCI Express thế hệ tiếp theo, ổ NVME cung cấp tốc độ đọc ghi cao hơn nhiều so với chuẩn giao diện SATA được sử dụng trong các loại ổ cứng thế hệ đầu. Các giao diện SATA III cung cấp băng thông 6Gbps trong khi theo lí thuyết PCIE cung cấp băng thông tối đa theo lí thuyết là 32Gbps (hoặc thậm chí 256Gbps) với giao diện PCIE 4.0 mới nhất. Hiện tại không có SSD nào có thể đạt tới tốc độ này, tuy nhiên đây là điều kiện lí tưởng để phát triển, có chỗ để mở rộng.

Một ổ SSD tốt, nếu được kết nối với giao diện SAS hoặc SATA nhanh, có thể đọc/ghi khoảng 550 MB/s dữ liệu. Ngoài ra, cùng một ổ SSD này có thể xử lý tới 10.000 I/O mỗi giây. Nhưng một NVMe tốt sẽ có thể đọc/ghi khoảng 3000 đến 3200 MB/s dữ liệu và xử lý lên đến 640.000 I/O mỗi giây. Tóm lại, NVME đang mang lại tốc độ truyền dữ liệu nhanh hơn đến 6 lần và hiệu suất IOPS tốt hơn tới 60 lần.

## Khả năng cung cấp hàng đợi dài hơn

Trong khi khả năng cung cấp hàng đợi của ổ cứng SSD sử dụng giao diện SATA là 32 lệnh, công nghệ SAS có thể cung cấp đến 256 lệnh hàng đợi. Nhưng thật kinh ngạc với khả năng cung cấp 64.000 lệnh hàng đợi khổng lồ từ công nghệ ổ cứng NVME khi sử dụng toàn bộ 12 làn PCIe.

## Công nghệ có thể mở rộng

Vì NVME sử dụng PCIe chứ không phải controller interface nên nó có thể mở rộng. Hiện tại NVME chỉ sử dụng 4 làn trên tổng số 16 làn PCIe. Do đó không gian để mở rộng về mặt tốc độ đọc ghi của ổ cứng sẽ còn rất nhiều.

## Công nghệ thân thiện hơn với môi trường

Chế độ chờ của NVME được coi là xanh với môi trường hơn tất cả những loại ổ cứng đã từng biết. Khi trong chế độ chờ NVME giảm mức tiêu thụ điện xuống tận 97%.

## Giảm hiện tượng “nghẽn cổ chai”

Khi sử dụng các loại ổ cứng truyền thống với mức đọc ghi và hàng chờ lệnh bị giới hạn như ổ cứng SSD, HDD sử dụng cổng SATA, khả năng bị tắc nghẽn có thể xảy ra trong trường hợp:
- Có quá nhiều lượt truy cập, cần truy xuất dữ liệu cùng lúc
- Có quá nhiều lệnh chờ trích xuất dữ liệu cần cho CPU xử lý của phần mềm

Điều này chạm đến ngưỡng giới hạn của CPU và dĩ nhiên sẽ gây ra hiện tượng chậm phản hồi (not responding thường thấy trên HĐH Windows). Máy tính sử dụng NVME có khả năng xử lý vấn đề này tốt hơn vì nó cung cấp hàng đợi dài hơn và tốc độ đọc/ghi cao hơn.
<a name = "6"><a/>
# 6. VPS NVME là gì?

VPS (viết tắt của Virtual Private Server) là một máy chủ riêng ảo được khởi tạo, hoạt động trên phần cứng của một máy chủ vật lý. VPS có thể quản lý từ xa, thực hiện cài đặt hệ điều hành, cấu hình riêng. Dữ liệu bên trong VPS được lưu trữ độc lập, bảo mật cao.

VPS NVME sử dụng loại ổ cứng NVME cho mục đích lưu trữ và cài đặt hệ điều hành, phần mềm trên đó. Tốc độ VPS NVME là không thể bàn cãi và so sánh ở thời điểm hiện tại.
