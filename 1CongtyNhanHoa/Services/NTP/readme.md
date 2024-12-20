**Các câu hỏi thường gặp về Chrony**  

### Mục lục  
1. **Chrony so sánh với các chương trình khác**  
   1.1. Chrony khác gì so với ntpd?  

2. **Các vấn đề cấu hình**  
   2.1. Cấu hình tối thiểu cho một máy khách NTP là gì?  
   2.2. Làm thế nào để cấu hình một máy chủ NTP?  
   2.3. Có nên để tất cả máy tính trong mạng LAN làm máy khách của máy chủ ngoài không?  
   2.4. Có cần sử dụng địa chỉ IP cho máy chủ nếu DNS không hoạt động khi chronyd khởi động?  
   2.5. Làm cách nào để tăng cường bảo mật cho chronyd?  
   2.6. Làm cách nào để bảo vệ đồng hồ hệ thống tốt hơn?  
   2.7. Làm thế nào để cải thiện độ chính xác của đồng hồ hệ thống khi sử dụng nguồn NTP?  
   2.8. Chronyd có chế độ hoạt động như ntpdate không?  
   2.9. Có thể cấu hình chronyd để kiểm soát đồng hồ như ntpd không?  
   2.10. Máy chủ NTP và máy khách NTP có thể tách biệt không?  
   2.11. Có nên kích hoạt leap smear trên máy chủ NTP không?  
   2.12. Chrony có hỗ trợ PTP không?  
   2.13. Điều gì xảy ra với các chỉ thị `commandkey` và `generatecommandkey`?  

3. **Máy tính không đồng bộ hóa**  
   3.1. Máy tính có bị chắn bởi tường lửa không?  
   3.2. Máy chủ NTP có được chỉ định với tùy chọn `offline` không?  
   3.3. Phân giải tên có hoạt động đúng không?  
   3.4. Chronyd có được phép thay đổi đồng hồ hệ thống không?  
   3.5. Có sử dụng NTS không?  
   3.6. Máy chủ NTP Windows có đang được sử dụng không?  
   3.7. Một nguồn không thể truy cập có được chọn không?  
   3.8. Nguồn đã chọn có bỏ qua các đo lường mới không?  
   3.9. Có sử dụng đồng hồ tham chiếu PPS không?  

4. **Các vấn đề với chronyc**  
   4.1. Lỗi "506 Cannot talk to daemon" liên tục xuất hiện.  
   4.2. Lỗi "501 Not authorised" xuất hiện liên tục.  
   4.3. ID tham chiếu được báo cáo bởi lệnh `tracking` là gì?  
   4.4. Giao thức giữa chronyc và chronyd có được tài liệu hóa ở đâu không?  

5. **Vấn đề với đồng hồ thời gian thực (RTC)**  
   5.1. Đồng hồ thời gian thực (RTC) là gì?  
   5.2. Có cần vô hiệu hóa `hwclock` không?  
   5.3. Lỗi "513 RTC driver not running" liên tục xuất hiện.  
   5.4. Lỗi "Could not open /dev/rtc, Device or resource busy" xuất hiện trong tệp nhật ký hệ thống.  
   5.5. Khi khởi động chronyd, nhật ký báo lỗi "Could not enable RTC interrupt: Invalid argument."  
   5.6. Nếu máy tính không có RTC hoặc pin dự phòng thì sao?  

6. **Vấn đề liên quan đến NTP**  
   6.1. Chronyd có thể nhận dữ liệu từ các máy chủ NTP qua broadcast/multicast không?  
   6.2. Chronyd có thể gửi gói NTP broadcast không?  
   6.3. Chronyd có thể giữ đồng hồ hệ thống lệch cố định so với thời gian thực không?  
   6.4. Điều gì xảy ra nếu kết nối mạng bị mất mà không dùng lệnh `offline` của chronyc trước?  
   6.5. Tại sao lại có độ lệch giữa hai máy tính đã đồng bộ hóa với nhau?  

7. **Hệ điều hành**  
   7.1. Chrony có hỗ trợ Windows không?  
   7.2. Có kế hoạch hỗ trợ Windows trong tương lai không?  

---  


### 1. chrony so với các chương trình khác
 
####   1.1. Chrony so với ntpd như thế nào?
chrony và ntpd là hai triển khai khác nhau của Giao thức thời gian mạng (NTP).

chrony là một triển khai mới hơn, được thiết kế để hoạt động tốt trong nhiều điều kiện hơn. Nó thường có thể đồng bộ hóa đồng hồ hệ thống nhanh hơn và với độ chính xác thời gian tốt hơn. Nó có nhiều tính năng, nhưng nó không triển khai một số chế độ NTP ít hữu ích hơn như máy khách phát sóng hoặc máy chủ/máy khách đa hướng.

Nếu máy tính của bạn chỉ được kết nối với Internet trong vài phút tại một thời điểm, kết nối mạng thường bị tắc nghẽn, bạn tắt máy tính hoặc tạm dừng thường xuyên, đồng hồ không ổn định (ví dụ: nhiệt độ thay đổi nhanh hoặc đó là máy ảo) hoặc bạn muốn sử dụng NTP trên một mạng bị cô lập không có đồng hồ tham chiếu phần cứng nào trong tầm mắt, chrony có thể sẽ hoạt động tốt hơn cho bạn.

Để so sánh chi tiết hơn về các tính năng và hiệu suất, hãy xem trang so sánh trên trang web chrony.

### 2. Các vấn đề về cấu hình

##### 2.1. Cấu hình tối thiểu được khuyến nghị cho máy khách NTP là gì?
Trước tiên, máy khách cần biết máy chủ NTP nào cần yêu cầu thời gian hiện tại. Chúng được chỉ định bởi chỉ thị máy chủ hoặc nhóm. Chỉ thị nhóm được sử dụng với các tên giải quyết cho nhiều địa chỉ của các máy chủ khác nhau. Để hoạt động đáng tin cậy, máy khách phải có ít nhất ba máy chủ.

Tùy chọn `iburst` cho phép một loạt yêu cầu để tăng tốc quá trình đồng bộ hóa ban đầu.

Để ổn định quá trình đồng bộ hóa ban đầu khi khởi động tiếp theo, độ trôi ước tính của đồng hồ hệ thống được lưu vào tệp do chỉ thị `driftfile` chỉ định.

Nếu đồng hồ hệ thống có thể khác xa thời gian thực sau khi khởi động vì bất kỳ lý do gì, chronyd nên được phép sửa lỗi nhanh chóng bằng cách bước thay vì xoay, điều này sẽ mất rất nhiều thời gian. Chỉ thị `makestep` thực hiện điều đó.

Để giữ đồng hồ thời gian thực (RTC) gần với thời gian thực, do đó thời gian hệ thống gần với thời gian thực khi được khởi tạo trong lần khởi động tiếp theo từ RTC, lệnh `rtcsync` sẽ kích hoạt chế độ mà thời gian hệ thống được sao chép định kỳ vào RTC. Lệnh này được hỗ trợ trên Linux và macOS.

Nếu bạn muốn sử dụng máy chủ NTP công khai từ dự án pool.ntp.org, tệp chrony.conf tối thiểu có thể là:
```
pool pool.ntp.org iburst
driftfile /var/lib/chrony/drift
makestep 1 3
rtcsync
```
### 2.2. Làm thế nào để tạo máy chủ NTP?

Theo mặc định, chronyd không hoạt động như máy chủ NTP. Bạn cần thêm lệnh allow vào tệp chrony.conf để chronyd mở cổng NTP của máy chủ và phản hồi yêu cầu của máy khách.
```
allow 192.168.1.0/24
```
Chỉ thị allow không chỉ định subnet cho phép truy cập từ tất cả các địa chỉ IPv4 và IPv6.

### 2.3. Tất cả máy tính trên mạng LAN có phải là máy khách của máy chủ bên ngoài không?
Tùy thuộc vào yêu cầu. Thông thường, cấu hình tốt nhất là biến một máy tính thành máy chủ, các máy tính khác là máy khách của máy chủ đó. Thêm chỉ thị cục bộ vào tệp chrony.conf của máy chủ. Cấu hình này sẽ tốt hơn vì tải trên kết nối bên ngoài ít hơn tải trên máy chủ NTP bên ngoài ít hơn, nếu kết nối bên ngoài của bạn bị hỏng, các máy tính trên mạng LAN sẽ duy trì thời gian chung với nhau.

### 2.4. Tôi có phải chỉ định máy chủ theo địa chỉ IP nếu DNS không khả dụng khi khởi động chronyd không?
Không, chronyd sẽ tiếp tục cố gắng giải quyết các tên được chỉ định bởi các chỉ thị máy chủ, nhóm và ngang hàng trong khoảng thời gian tăng dần cho đến khi thành công. Lệnh trực tuyến có thể được đưa ra từ chronyc để buộc chronyd cố gắng giải quyết các tên ngay lập tức.

### 2.5. Làm thế nào để tôi có thể khiến chronyd an toàn hơn?
Nếu bạn không cần sử dụng chronyc hoặc bạn chỉ muốn chạy chronyc dưới quyền người dùng root hoặc chrony (có thể truy cập chronyd thông qua ổ cắm miền Unix), bạn có thể vô hiệu hóa ổ cắm lệnh IPv4 và IPv6 (mặc định là lắng nghe trên máy chủ cục bộ) bằng cách thêm `cmdport 0` vào tệp cấu hình.

Bạn có thể chỉ định người dùng không có đặc quyền bằng tùy chọn `-u` hoặc chỉ thị người dùng trong tệp `chrony.conf`, mà `chronyd` sẽ chuyển sang sau khi bắt đầu để xóa đặc quyền gốc. Tập lệnh cấu hình có tùy chọn `--with-user`, tùy chọn này đặt người dùng mặc định. Trên Linux, chronyd cần được biên dịch với sự hỗ trợ cho thư viện libcap. Trên các hệ thống khác, chronyd phân nhánh thành hai quy trình. Quy trình con vẫn giữ đặc quyền gốc nhưng chỉ có thể thực hiện một phạm vi rất hạn chế các lệnh gọi hệ thống có đặc quyền thay mặt cho quy trình cha.

Ngoài ra, nếu chronyd được biên dịch với sự hỗ trợ cho tiện ích điện toán bảo mật Linux (seccomp), bạn có thể bật bộ lọc lệnh gọi hệ thống với tùy chọn -F. Nó sẽ làm giảm đáng kể bề mặt tấn công của hạt nhân và có thể ngăn chặn các khai thác hạt nhân từ quy trình chronyd nếu nó bị xâm phạm. Bạn chỉ nên bật bộ lọc khi biết rằng nó hoạt động trên phiên bản hệ thống nơi chrony được cài đặt vì bộ lọc cũng cần cho phép các lệnh gọi hệ thống được thực hiện từ các thư viện mà chronyd đang sử dụng (ví dụ: libc) và các phiên bản hoặc triển khai khác nhau của các thư viện có thể tạo ra các hệ thống khác nhau em gọi. Nếu bộ lọc thiếu một số lệnh gọi hệ thống, chronyd có thể bị tắt ngay cả khi hoạt động bình thường.

### 2.6. Làm thế nào để tôi có thể làm cho đồng hồ hệ thống an toàn hơn?
Một máy khách NTP đồng bộ hóa đồng hồ hệ thống với máy chủ NTP dễ bị tấn công bởi nhiều loại tấn công, có thể phá vỡ các ứng dụng và giao thức mạng dựa trên độ chính xác của đồng hồ (ví dụ: DNSSEC, Kerberos, TLS, WireGuard).

Nhìn chung, kẻ tấn công trung gian (MITM) giữa máy khách và máy chủ có thể

tạo phản hồi giả hoặc sửa đổi phản hồi thực từ máy chủ để tạo độ lệch thời gian và tần số lớn tùy ý, khiến máy chủ có vẻ chính xác hơn, chèn giây nhuận, v.v.

trì hoãn các yêu cầu và/hoặc phản hồi để tạo độ lệch thời gian giới hạn và tạm thời cũng là độ lệch tần số giới hạn hủy các yêu cầu hoặc phản hồi để ngăn chặn việc cập nhật đồng hồ bằng các phép đo mới chuyển hướng các yêu cầu đến một máy chủ khác. Các cuộc tấn công có thể được kết hợp để có hiệu quả lớn hơn. Kẻ tấn công có thể trì hoãn các gói tin để tạo ra độ lệch tần số đáng kể trước rồi loại bỏ tất cả các gói tin tiếp theo để đồng hồ nhanh chóng trôi đi khỏi thời gian thực. Kẻ tấn công cũng có thể kiểm soát đồng hồ của máy chủ.

Không thể ngăn chặn một số cuộc tấn công. Cần phải giám sát để phát hiện, ví dụ: sổ đăng ký khả năng tiếp cận trong báo cáo nguồn hiển thị các gói tin bị thiếu. Mức độ mà kẻ tấn công có thể kiểm soát đồng hồ của máy khách phụ thuộc vào cấu hình của nó.

Bật xác thực để ngăn chronyd chấp nhận các gói tin đã sửa đổi, giả mạo hoặc chuyển hướng. Có thể bật xác thực bằng khóa đối xứng do tùy chọn khóa chỉ định hoặc Bảo mật thời gian mạng (NTS) do tùy chọn nts (được hỗ trợ kể từ phiên bản chrony 4.0). Máy chủ cần hỗ trợ cơ chế xác thực đã chọn. Khóa đối xứng phải được cấu hình trên cả máy khách và máy chủ, và mỗi máy khách phải có khóa riêng (một khóa cho mỗi máy chủ).

Độ lệch tối đa mà kẻ tấn công có thể chèn vào phép đo NTP bằng cách trì hoãn các gói tin có thể bị giới hạn bởi tùy chọn maxdelay. Giá trị mặc định là 3 giây. Độ trễ được đo được báo cáo là độ trễ ngang hàng trong báo cáo ntpdata và nhật ký đo lường. Đặt tùy chọn maxdelay thành giá trị lớn hơn giá trị tối đa thường được quan sát. Lưu ý rằng độ trễ có thể tăng đáng kể ngay cả khi không bị tấn công, ví dụ: khi mạng bị tắc nghẽn hoặc định tuyến đã thay đổi.

Thay đổi tối đa được chấp nhận trong độ lệch thời gian giữa các lần cập nhật đồng hồ có thể bị giới hạn bởi chỉ thị maxchange. Những thay đổi lớn hơn trong độ lệch sẽ bị bỏ qua hoặc khiến chronyd thoát. Lưu ý rằng kẻ tấn công có thể vượt qua giới hạn này bằng cách chia độ lệch thành nhiều độ lệch nhỏ hơn và/hoặc tạo độ lệch tần số lớn. Khi chỉ thị này được sử dụng, chronyd sẽ phải được khởi động lại sau một cuộc tấn công thành công. Nó sẽ không thể tự phục hồi. Nó không được khởi động lại tự động (ví dụ: bởi người quản lý dịch vụ).

Tác động của độ lệch thời gian lớn được chấp nhận có thể được giảm bớt bằng cách vô hiệu hóa các bước đồng hồ, tức là không sử dụng các chỉ thị makestep và initstepslew. Độ lệch sẽ được hiệu chỉnh chậm bằng cách tăng tốc hoặc làm chậm đồng hồ ở tốc độ có thể giới hạn bằng lệnh maxslewrate. Việc vô hiệu hóa hoàn toàn các bước đồng hồ chỉ khả thi nếu đồng hồ không thể tự tạo ra lỗi lớn hơn, ví dụ: khi máy tính bị tắt hoặc tạm dừng và giới hạn maxslewrate đủ lớn để hiệu chỉnh lỗi dự kiến ​​trong thời gian chấp nhận được. Lệnh rtcfile với tùy chọn -s có thể được sử dụng để bù cho độ lệch RTC.

Một cách tiếp cận thực tế hơn là bật makestep cho một số lượng giới hạn các bản cập nhật đồng hồ (đối số thứ 2 của lệnh) và giới hạn thay đổi độ lệch trong tất cả các bản cập nhật bằng lệnh maxchange. Kẻ tấn công sẽ chỉ có thể thực hiện một bước giới hạn và chỉ khi cuộc tấn công bắt đầu trong một cửa sổ ngắn sau khi khởi động máy tính hoặc khi chronyd được khởi động lại mà không có tùy chọn -R.

Độ lệch tần số có thể bị giới hạn bằng lệnh maxdrift. Độ lệch tần số đã đo được được báo cáo trong tệp drift, báo cáo theo dõi và nhật ký theo dõi. Đặt maxdrift thành giá trị lớn hơn giá trị tuyệt đối tối đa thường được quan sát. Lưu ý rằng tần số của đồng hồ có thể thay đổi do tinh thể bị lão hóa, sự khác biệt trong hiệu chuẩn nguồn đồng hồ giữa các lần khởi động lại, máy ảo được di chuyển, v.v. Đồng hồ máy tính thông thường có độ trôi nhỏ hơn 100 phần triệu (ppm), nhưng có thể có độ trôi lớn hơn nhiều (ví dụ: trong một số máy ảo).

Chỉ sử dụng các máy chủ đáng tin cậy, mà bạn mong đợi được cấu hình và quản lý tốt, sử dụng xác thực cho máy chủ của riêng chúng, v.v. Sử dụng nhiều máy chủ, lý tưởng nhất là ở các vị trí khác nhau. Kẻ tấn công sẽ phải xử lý phần lớn các máy chủ để vượt qua lựa chọn nguồn và cập nhật đồng hồ với độ lệch lớn. Sử dụng chỉ thị minsources để tăng số lượng nguồn có thể lựa chọn cần thiết để làm cho lựa chọn mạnh mẽ hơn.

Không chỉ định máy chủ là đối tác. Chế độ đối xứng kém an toàn hơn chế độ máy khách/máy chủ. Nếu không được xác thực, nó
s dễ bị tấn công từ chối dịch vụ ngoài đường dẫn và ngay cả khi đã được xác thực, nó vẫn dễ bị tấn công phát lại.

Việc trộn lẫn các máy chủ đã xác thực và chưa xác thực thường nên tránh. Nếu cần trộn lẫn (ví dụ: để đồng bộ hóa chính xác và ổn định hơn với máy chủ gần hơn không hỗ trợ xác thực), các máy chủ đã xác thực nên được định cấu hình là đáng tin cậy và bắt buộc không cho phép các máy chủ chưa xác thực ghi đè lên các máy chủ đã xác thực trong lựa chọn nguồn. Kể từ phiên bản chrony 4.0, các tùy chọn lựa chọn được bật tự động trong trường hợp như vậy. Hành vi này có thể bị vô hiệu hóa hoặc sửa đổi bằng chỉ thị authselmode.

Một ví dụ về cấu hình máy khách hạn chế tác động của các cuộc tấn công có thể là

```
server foo.example.net iburst nts maxdelay 0.1
server bar.example.net iburst nts maxdelay 0.2
server baz.example.net iburst nts maxdelay 0.05
server qux.example.net iburst nts maxdelay 0.1
server quux.example.net iburst nts maxdelay 0.1
minsources 3
maxchange 100 0 0
makestep 0.001 1
maxdrift 100
maxslewrate 100
driftfile /var/lib/chrony/drift
ntsdumpdir /var/lib/chrony
rtcsync
```
---
### 2.7. Làm thế nào để cải thiện độ chính xác của đồng hồ hệ thống với các nguồn NTP?
Chọn các máy chủ NTP được đồng bộ hóa tốt, ổn định và gần với mạng của bạn. Tốt hơn là sử dụng nhiều hơn một máy chủ. Thông thường, nên sử dụng tối thiểu ba hoặc bốn máy chủ để chronyd có thể phát hiện các máy chủ phục vụ thời gian sai và kết hợp các phép đo từ nhiều nguồn.

Nếu bạn có card mạng có hỗ trợ đóng dấu thời gian phần cứng trên Linux, bạn có thể bật chức năng này bằng lệnh hwtimestamp. Lệnh này sẽ giúp các dấu thời gian nhận và truyền cục bộ của các gói NTP ổn định và chính xác hơn nhiều.

Lệnh máy chủ có một số tùy chọn hữu ích:``` minpoll, maxpoll, polltarget, maxdelay, maxdelayratio, maxdelaydevratio, xleave, filter.```

Ba tùy chọn đầu tiên đặt khoảng thời gian thăm dò tối thiểu và tối đa được phép và cách điều chỉnh khoảng thời gian thực tế trong phạm vi đã chỉ định. Các giá trị mặc định của chúng là 6 (64 giây) cho minpoll, 10 (1024 giây) cho maxpoll và 8 (mẫu) cho polltarget. Các giá trị mặc định nên được sử dụng cho các máy chủ chung trên Internet. Với máy chủ NTP của riêng bạn hoặc nếu bạn được phép thăm dò một số máy chủ thường xuyên hơn, việc thiết lập các tùy chọn này cho các khoảng thời gian thăm dò ngắn hơn có thể cải thiện đáng kể độ chính xác của đồng hồ hệ thống.

Khoảng thời gian thăm dò tối ưu chủ yếu phụ thuộc vào hai yếu tố, độ ổn định của độ trễ mạng và độ ổn định của đồng hồ hệ thống (chủ yếu phụ thuộc vào độ nhạy nhiệt độ của bộ dao động tinh thể và tốc độ thay đổi nhiệt độ tối đa).

Nhìn chung, nếu lệnh `sourcestats` thường báo cáo một số lượng nhỏ mẫu được giữ lại cho một nguồn (ví dụ: ít hơn 16), thì nên cân nhắc khoảng thời gian thăm dò ngắn hơn. Nếu số lượng mẫu thường ở mức tối đa là 64, thì khoảng thời gian thăm dò dài hơn có thể hoạt động tốt hơn.

Một ví dụ về chỉ thị cho máy chủ NTP trên Internet mà bạn được phép thăm dò thường xuyên có thể là

```server foo.example.net minpoll 4 maxpoll 6 polltarget 16```

Một ví dụ sử dụng các khoảng thời gian thăm dò ngắn hơn với máy chủ nằm trong cùng một mạng LAN có thể là

```server ntp.local minpoll 2 maxpoll 4 polltarget 30```

Các tùy chọn maxdelay hữu ích để bỏ qua các phép đo có độ trễ lớn bất thường (ví dụ do tắc nghẽn trong mạng) và cải thiện tính ổn định của quá trình đồng bộ hóa. Tùy chọn `maxdelaydevratio` có thể được thêm vào ví dụ với máy chủ NTP cục bộ

```server ntp.local minpoll 2 maxpoll 4 polltarget 30 maxdelaydevratio 2```

Nếu máy chủ của bạn hỗ trợ chế độ xen kẽ (ví dụ: đang chạy chronyd), tùy chọn xleave nên được thêm vào chỉ thị máy chủ để cho phép máy chủ cung cấp cho máy khách các dấu thời gian truyền chính xác hơn (hạt nhân hoặc tốt nhất là phần cứng). Ví dụ:

```server ntp.local minpoll 2 maxpoll 4 xleave```
Khi kết hợp với dấu thời gian phần cứng cục bộ, các công tắc mạng tốt và thậm chí là các khoảng thời gian thăm dò ngắn hơn, độ chính xác dưới micro giây và độ ổn định của vài chục nano giây có thể đạt được. Ví dụ:

```server ntp.local minpoll 0 maxpoll 0 xleave```

```hwtimestamp eth0```

Để có độ ổn định tốt nhất, CPU phải chạy ở tần số không đổi (tức là tắt chế độ tiết kiệm điện và tăng hiệu suất). Ethernet tiết kiệm năng lượng (EEE) phải bị tắt trong mạng. Các công tắc phải được cấu hình để ưu tiên các gói NTP, đặc biệt là nếu mạng được dự kiến ​​sẽ tải nặng. Có thể sử dụng chỉ thị dscp để đặt Điểm mã dịch vụ khác biệt trong các gói NTP được truyền nếu cần.

Nếu máy khách NTP trong mạng có thể gửi yêu cầu ở tốc độ cao, có thể chỉ định khoảng thời gian thăm dò dưới một giây. Có thể bật bộ lọc trung bình để cập nhật đồng hồ ở tốc độ giảm với các phép đo ổn định hơn. Ví dụ:
```
server ntp.local minpoll -6 maxpoll -6 filter 15 xleave
hwtimestamp eth0 minpoll -6
```

Là một tính năng thử nghiệm được thêm vào trong phiên bản 4.2, chronyd hỗ trợ trường mở rộng NTPv4 chứa dấu thời gian bổ sung để cho phép truyền tần suất và cải thiện đáng kể tính ổn định của quá trình đồng bộ hóa. Có thể bật tính năng này bằng tùy chọn extfield F323. Ví dụ:

```server ntp.local minpoll 0 maxpoll 0 xleave extfield F323```
### 2.8. Chronyd có chế độ ntpdate không?
Có. Với tùy chọn -q, chronyd sẽ đặt đồng hồ hệ thống một lần và thoát. Với tùy chọn -Q, nó sẽ in độ lệch đã đo mà không đặt đồng hồ. Nếu bạn không muốn sử dụng tệp cấu hình, có thể chỉ định máy chủ NTP trên dòng lệnh. Ví dụ:

``` chronyd -q 'pool pool.ntp.org iburst'```

Lệnh trên thường mất khoảng 5 giây nếu các máy chủ được đồng bộ hóa tốt và phản hồi tất cả các yêu cầu. Nếu không được đồng bộ hóa hoặc phản hồi, chronyd sẽ mất khoảng 10 giây để từ bỏ và thoát với trạng thái khác không. Có thể cấu hình nhanh hơn. Có thể sử dụng một máy chủ duy nhất thay vì bốn máy chủ, số lượng phép đo có thể giảm xuống còn một với tùy chọn maxsamples (được hỗ trợ kể từ phiên bản chrony 4.0) và có thể chỉ định thời gian chờ với tùy chọn -t. Lệnh sau chỉ mất khoảng một giây

.

``` chronyd -q -t 1 'server pool.ntp.org iburst maxsamples 1'```

Không nên chạy chronyd với tùy chọn -q theo định kỳ (ví dụ: từ một tác vụ cron) để thay thế cho chế độ daemon, vì nó hoạt động kém hơn đáng kể (ví dụ: đồng hồ được thay đổi và tần số không được hiệu chỉnh). Nếu bạn phải chạy theo cách này và bạn đang sử dụng máy chủ NTP công cộng, hãy đảm bảo chronyd không phải lúc nào cũng bắt đầu vào khoảng giây đầu tiên của phút, ví dụ: bằng cách thêm chế độ ngủ ngẫu nhiên trước lệnh chronyd. Máy chủ công cộng thường nhận được các đợt yêu cầu lớn vào khoảng giây đầu tiên vì có một số lượng lớn máy khách NTP được khởi động từ cron mà không có độ trễ.

### 2.9. Có thể định cấu hình chronyd để điều khiển đồng hồ như ntpd không?
Không thể mô phỏng hoàn hảo ntpd, nhưng có một số tùy chọn có thể định cấu hình chronyd để hoạt động giống ntpd hơn nếu có lý do để thích điều đó.

Trong ví dụ sau, lệnh minsamples làm chậm phản hồi đối với những thay đổi về tần số và độ lệch của xung nhịp. Lệnh maxslewrate và corrtimeratio làm giảm lỗi tần số tối đa do hiệu chỉnh độ lệch và lệnh maxdrift làm giảm lỗi tần số giả định tối đa của xung nhịp. Lệnh makestep cho phép ngưỡng bước và lệnh maxchange cho phép ngưỡng hoảng loạn. Lệnh maxclockerror làm tăng tỷ lệ phân tán tối thiểu.
```
minsamples 32
maxslewrate 500
corrtimeratio 100
maxdrift 500
makestep 0.128 -1
maxchange 1000 1 1
maxclockerror 15
```
Lưu ý rằng việc tăng minsamples có thể khiến độ lệch trong báo cáo/nhật ký theo dõi và sourcestats nhỏ hơn đáng kể so với độ lệch thực tế và không phù hợp để giám sát.

### 2.10. Máy chủ NTP có thể tách khỏi máy khách NTP không?
Có, có thể chạy nhiều phiên bản chronyd trên một máy tính cùng một lúc. Người ta có thể hoạt động chủ yếu như một máy khách NTP để đồng bộ hóa đồng hồ hệ thống và một máy khác như một máy chủ cho các máy tính khác. Nếu chúng sử dụng cùng một hệ thống tệp, chúng cần được định cấu hình với các tệp pid, ổ cắm lệnh miền Unix và bất kỳ tệp hoặc thư mục nào khác được chỉ định trong tệp cấu hình. Nếu chúng chạy trong cùng một không gian tên mạng, chúng cần sử dụng các cổng NTP và lệnh khác nhau hoặc liên kết các cổng với các địa chỉ hoặc giao diện khác nhau.

Phiên bản máy chủ nên được khởi động bằng tùy chọn -x để ngăn không cho nó điều chỉnh đồng hồ hệ thống và can thiệp vào phiên bản máy khách. Nó có thể được định cấu hình như một máy khách để đồng bộ hóa đồng hồ NTP của nó với các máy chủ khác hoặc phiên bản máy khách đang chạy trên cùng một máy tính. Trong trường hợp sau, tùy chọn sao chép (được thêm vào trong phiên bản chrony 4.1) có thể được sử dụng để giả định ID tham chiếu và tầng của phiên bản máy khách, cho phép phát hiện các vòng lặp đồng bộ hóa với các máy khách của riêng nó.

Trên Linux, bắt đầu từ phiên bản chrony 4.0, có thể chạy nhiều phiên bản máy chủ chia sẻ một cổng để sử dụng tốt hơn nhiều lõi của CPU. Lưu ý rằng để giới hạn tốc độ và chế độ xen kẽ máy khách/máy chủ hoạt động tốt thì tất cả các gói tin nhận được từ cùng một địa chỉ phải được xử lý bởi cùng một phiên bản máy chủ.

Một ví dụ về cấu hình của phiên bản máy khách có thể là
```
pool pool.ntp.org iburst
allow 127.0.0.1
port 11123
driftfile /var/lib/chrony/drift
makestep 1 3
rtcsync
```
và cấu hình của phiên bản máy chủ đầu tiên có thể là
```
server 127.0.0.1 port 11123 minpoll 0 maxpoll 0 copy
allow
cmdport 11323
bindcmdaddress /var/run/chrony/chronyd-server1.sock
pidfile /var/run/chronyd-server1.pid
driftfile /var/lib/chrony/drift-server1
```
### 2.11. Có nên bật leap smear trên máy chủ NTP không?
Với các chỉ thị ```smoothtime và leapsecmode```, có thể kích hoạt tính năng leap smear của máy chủ để ẩn giây nhuận khỏi máy khách và buộc chúng phải tuân theo sự điều chỉnh của máy chủ chậm.

Tính năng này chỉ nên được sử dụng trong các mạng cục bộ và chỉ khi cần thiết, ví dụ khi máy khách không thể được cấu hình để xử lý giây nhuận khi cần hoặc số lượng máy khách quá lớn khiến việc cấu hình tất cả chúng trở nên không thực tế. Máy khách chỉ nên sử dụng một máy chủ leap-smearing hoặc nhiều máy chủ leap-smearing được cấu hình giống hệt nhau. Lưu ý rằng một số máy khách có thể lấy giây nhuận từ các nguồn khác (ví dụ: với chỉ thị leapsectz trong chrony) và chúng sẽ không hoạt động chính xác với máy chủ leap-smearing.

### 2.12. Chrony có hỗ trợ PTP không?
Không, Giao thức thời gian chính xác (PTP) không được hỗ trợ làm giao thức đồng bộ hóa đồng hồ và không có kế hoạch hỗ trợ giao thức này. Đây là một giao thức phức tạp, có một số vấn đề chung với chế độ phát NTP. Một trong những điểm khác biệt chính giữa NTP và PTP là PTP được thiết kế để dễ dàng được hỗ trợ trong phần cứng (ví dụ: bộ chuyển mạch mạng và bộ định tuyến) nhằm thực hiện các phép đo ổn định và chính xác hơn. PTP dựa vào hỗ trợ phần cứng. NTP không dựa vào bất kỳ hỗ trợ nào trong phần cứng, nhưng nếu nó có cùng hỗ trợ như PTP, nó có thể hoạt động tốt như nhau.

Trên Linux, chrony hỗ trợ đồng hồ phần cứng mà một số NIC có cho PTP. Chúng được gọi là đồng hồ phần cứng PTP (PHC)

. Chúng có thể được sử dụng làm đồng hồ tham chiếu (được chỉ định bởi chỉ thị refclock) và để đóng dấu thời gian phần cứng của các gói NTP (được kích hoạt bởi chỉ thị hwtimestamp) nếu NIC có thể đóng dấu thời gian các gói khác ngoài PTP, thường là trường hợp ít nhất đối với các gói được truyền. Lệnh ethtool -T có thể được sử dụng để xác minh hỗ trợ đóng dấu thời gian.

Là một tính năng thử nghiệm được thêm vào trong phiên bản 4.2, chrony có thể sử dụng PTP làm phương tiện truyền tải cho các thông báo NTP (NTP qua PTP) để cho phép đóng dấu thời gian phần cứng trên phần cứng chỉ có thể đóng dấu thời gian các gói PTP. Tính năng này có thể được kích hoạt bởi chỉ thị ptpport.

### 2.13. Điều gì đã xảy ra với các chỉ thị commandkey và generatecommandkey?
Chúng đã bị xóa trong phiên bản 2.2. Xác thực không còn được hỗ trợ trong giao thức lệnh. Các lệnh yêu cầu xác thực hiện chỉ được phép thông qua ổ cắm miền Unix, chỉ có người dùng root và chrony mới có thể truy cập. Nếu bạn cần cấu hình chronyd từ xa hoặc cục bộ mà không cần mật khẩu gốc, vui lòng cân nhắc sử dụng ssh và/hoặc sudo để chạy chronyc dưới quyền người dùng gốc hoặc chrony trên máy chủ nơi chronyd đang chạy.

### 3. Máy tính không đồng bộ hóa
Đây là sự cố phổ biến nhất. Có một số lý do, hãy xem các câu hỏi sau.

#### 3.1. Đằng sau tường lửa?

Kiểm tra giá trị Reach được in bởi lệnh sources của chronyc. Nếu giá trị bằng không, điều đó có nghĩa là chronyd không nhận được bất kỳ phản hồi hợp lệ nào từ máy chủ NTP mà bạn đang cố gắng sử dụng. Nếu có tường lửa giữa bạn và máy chủ, các gói tin có thể bị chặn. Hãy thử sử dụng một công cụ như wireshark hoặc tcpdump để xem bạn có nhận được bất kỳ phản hồi nào từ máy chủ không.

Khi chronyd đang nhận phản hồi từ máy chủ, đầu ra của lệnh sources được phát hành vài phút sau khi chronyd start có thể trông như thế này:

MS Name/IP address Stratum Poll Reach LastRx Last sample
========================================================================================
^* foo.example.net 2 6 377 34 +484us[ -157us] +/- 30ms
^- bar.example.net 2 6 377 34 +33ms[ +32ms] +/- 47ms
^+ baz.example.net 3 6 377 35 -1397us[-2033us] +/- 60ms
###
3.2. Máy chủ NTP có được chỉ định với tùy chọn ngoại tuyến không?
Kiểm tra xem các lệnh trực tuyến và ngoại tuyến của chronyc có được sử dụng phù hợp không (ví dụ: trong các tập lệnh mạng hệ thống). Lệnh activity in số lượng nguồn hiện đang trực tuyến và ngoại tuyến. Ví dụ:

```200 OK
3 nguồn trực tuyến
0 nguồn ngoại tuyến
0 nguồn đang bùng nổ (trở lại trực tuyến)
0 nguồn đang bùng nổ (trở lại ngoại tuyến)
0 nguồn có địa chỉ không xác định
```
### 3.3. Giải quyết tên có hoạt động chính xác không?
Máy chủ NTP được chỉ định theo tên máy chủ của chúng (thay vì địa chỉ IP) phải giải quyết tên của chúng trước khi chronyd có thể gửi bất kỳ yêu cầu nào đến chúng. Nếu lệnh activity in ra số lượng nguồn không phải là 0 có địa chỉ không xác định, thì có sự cố với giải quyết. Thông thường, máy chủ DNS được chỉ định `trong /etc/resolv.conf`. Đảm bảo rằng nó hoạt động chính xác.

Kể từ phiên bản chrony 4.0, bạn có thể chạy lệnh chronyc -N sources -a để in tất cả các nguồn, ngay cả những nguồn chưa có địa chỉ đã biết, với tên của chúng như đã chỉ định trong cấu hình. Điều này có thể hữu ích để xác minh rằng các tên được chỉ định trong cấu hình được sử dụng như mong đợi.

### 3.4. chronyd có được phép thay đổi đồng hồ hệ thống không?
Theo mặc định, chronyd điều chỉnh đồng hồ dần dần bằng cách làm chậm hoặc tăng tốc. Nếu đồng hồ quá xa so với thời gian thực, sẽ mất nhiều thời gian để sửa lỗi. Giá trị thời gian hệ thống được lệnh theo dõi của chronyc in ra là giá trị hiệu chỉnh còn lại cần áp dụng cho đồng hồ hệ thống.

Có thể sử dụng lệnh makestep để cho phép chronyd thay đổi đồng hồ. Ví dụ: nếu `chrony.conf` có

`makestep 1 3`
thì đồng hồ sẽ được thay đổi trong ba lần cập nhật đầu tiên nếu độ lệch của nó lớn hơn một giây. Thông thường, bạn chỉ nên cho phép bước này trong một vài bản cập nhật đầu tiên, nhưng trong một số trường hợp (ví dụ: máy tính không có RTC hoặc máy ảo có thể bị tạm dừng và tiếp tục với thời gian không chính xác), bạn có thể cần cho phép bước này trong bất kỳ bản cập nhật đồng hồ nào. Ví dụ trên sẽ thay đổi thành

`makestep 1 -1`
### 3.5. Sử dụng NTS?
Cơ chế Bảo mật thời gian mạng (NTS) sử dụng Bảo mật lớp truyền tải (TLS) để thiết lập các khóa cần thiết để xác thực các gói NTP.

Chạy lệnh authdata để kiểm tra xem thiết lập khóa có thành công không:

` chronyc -N authdata`

Tên/Địa chỉ IP Chế độ KeyID Kiểu KLen Atmp Cuối cùng NAK Cook CLen
=========================================================================
foo.example.net NTS 1 15 256 33m 0 0 8 100
bar.example.net NTS 1 15 256 33m 0 0 8 100
baz.example.net NTS 1 15 256 33m 0 0 8 100
Các cột KeyID, Type và KLen phải có giá trị khác không. Nếu chúng bằng không, hãy kiểm tra nhật ký hệ thống để tìm thông báo lỗi từ chronyd. Một nguyên nhân có thể gây ra lỗi là tường lửa chặn máy khách.

 kết nối đến cổng TCP 4460 của máy chủ.

Một nguyên nhân có thể khác gây ra lỗi là chứng chỉ không xác minh được vì đồng hồ của máy khách không đúng. Đây là vấn đề con gà và quả trứng với NTS. Bạn có thể cần phải sửa ngày theo cách thủ công hoặc tạm thời tắt NTS để NTS hoạt động. Nếu máy tính của bạn có RTC và được sao lưu bằng pin tốt, thao tác này chỉ cần thực hiện một lần, giả sử RTC sẽ được đặt định kỳ bằng lệnh rtcsync hoặc được bù bằng lệnh rtcfile và tùy chọn -s.

Nếu máy tính không có RTC hoặc pin, bạn có thể sử dụng tùy chọn -s mà không cần lệnh rtcfile để khôi phục thời gian tắt máy hoặc khởi động lại gần nhất từ ​​tệp trôi. Đồng hồ sẽ bắt đầu chậm hơn thời gian thực, nhưng nếu máy tính không tắt quá lâu và chứng chỉ của máy chủ không được gia hạn quá gần ngày hết hạn, thì điều này sẽ đủ để kiểm tra thời gian thành công.

Như một biện pháp cuối cùng, bạn có thể vô hiệu hóa kiểm tra thời gian bằng lệnh nocerttimecheck. Điều này có một số tác động quan trọng đến bảo mật. Để giảm rủi ro bảo mật, bạn có thể sử dụng lệnh nosystemcert và ntstrustedcerts để vô hiệu hóa các cơ quan cấp chứng chỉ đáng tin cậy mặc định của hệ thống và chỉ tin cậy một tập hợp tối thiểu các cơ quan được chọn cần thiết để xác thực chứng chỉ của các máy chủ NTP đã sử dụng.

### 3.6. Sử dụng máy chủ Windows NTP?
Một vấn đề phổ biến với máy chủ Windows NTP là chúng báo cáo độ phân tán gốc rất lớn (ví dụ: ba giây trở lên), khiến chronyd bỏ qua máy chủ vì quá không chính xác. Lệnh sources có thể hiển thị phép đo hợp lệ, nhưng máy chủ không được chọn để đồng bộ hóa. Bạn có thể kiểm tra độ phân tán gốc của máy chủ bằng lệnh ntpdata của chronyc.

Giá trị maxdistance cần được tăng lên trong chrony.conf để cho phép đồng bộ hóa với máy chủ như vậy. Ví dụ:

maxdistance 16.0
### 3.7. Nguồn không thể truy cập được đã được chọn?
Khi chronyd được cấu hình với nhiều nguồn thời gian, nó sẽ cố gắng chọn các nguồn chính xác và ổn định nhất để đồng bộ hóa đồng hồ hệ thống. Chúng được đánh dấu bằng ký hiệu * hoặc + trong báo cáo được in bằng lệnh sources.

Khi nguồn tốt nhất (được đánh dấu bằng ký hiệu *) không thể truy cập được (ví dụ: máy chủ NTP ngừng phản hồi), chronyd sẽ không ngay lập tức chuyển sang nguồn tốt thứ hai để cố gắng giảm thiểu lỗi của đồng hồ. Nó sẽ để đồng hồ chạy miễn phí miễn là lỗi ước tính của nó (theo khoảng cách gốc) dựa trên các phép đo trước đó nhỏ hơn lỗi ước tính của nguồn thứ hai và vẫn còn một khoảng thời gian chứa một số phép đo từ cả hai nguồn.

Nếu nguồn đầu tiên tốt hơn đáng kể so với nguồn thứ hai, có thể mất nhiều giờ trước khi nguồn thứ hai được chọn, tùy thuộc vào khoảng thời gian thăm dò của nó. Bạn có thể buộc chọn lại nhanh hơn bằng cách tăng tỷ lệ lỗi đồng hồ (chỉ thị maxclockerror), rút ​​ngắn khoảng thời gian thăm dò (tùy chọn maxpoll) hoặc giảm số lượng mẫu (tùy chọn maxsamples).

### 3.8. Nguồn được chọn có loại bỏ các phép đo mới không?

chronyd có thể loại bỏ một số lượng lớn các phép đo NTP liên tiếp nếu chúng không vượt qua một số thử nghiệm NTP. Lệnh sources có thể báo cáo cho một nguồn đã chọn giá trị có thể đạt được hoàn toàn là 377 trong cột Reach và đồng thời là giá trị LastRx lớn hơn nhiều so với khoảng thời gian thăm dò hiện tại. Nếu nguồn đang trực tuyến, điều này cho biết rằng một số phép đo đã bị loại bỏ. Bạn có thể sử dụng lệnh ntpdata để kiểm tra các thử nghiệm NTP cho phép đo cuối cùng. Thông thường, thử nghiệm C sẽ không thành công.

Đây có thể là vấn đề khi có sự gia tăng kéo dài trong độ trễ được đo, ví dụ do thay đổi định tuyến trong mạng. Thật không may, chronyd không biết phải đợi bao lâu để độ trễ trở lại giá trị ban đầu hoặc liệu đó có phải là sự gia tăng vĩnh viễn hay không và phải bắt đầu lại từ đầu.

Thử nghiệm C là một bộ lọc thích ứng. Có thể mất nhiều giờ trước khi chấp nhận phép đo có độ trễ lớn hơn và thậm chí lâu hơn nữa trước khi loại bỏ tất cả các phép đo có độ trễ nhỏ hơn, xác định độ trễ dự kiến ​​mà thử nghiệm sử dụng. Bạn có thể sử dụng lệnh reset sources để hủy bỏ tất cả các phép đo ngay lập tức (có trong chrony 4.0 trở lên). Nếu sự cố này xảy ra thường xuyên, bạn có thể vô hiệu hóa hiệu quả thử nghiệm bằng cách đặt tùy chọn maxdelaydevratio thành một giá trị rất lớn (ví dụ: 1000000) hoặc tăng tốc độ khôi phục bằng cách tăng tỷ lệ lỗi xung nhịp với chỉ thị maxclockerror.

### 3.9. Sử dụng đồng hồ tham chiếu PPS?
Đồng hồ tham chiếu xung trên giây (PPS) yêu cầu nguồn thời gian không phải PPS để xác định giây nào của UTC tương ứng với mỗi xung. Nếu đó là đồng hồ tham chiếu khác được chỉ định bằng tùy chọn khóa trong chỉ thị refclock, thì độ lệch giữa hai đồng hồ tham chiếu phải nhỏ hơn 0,2 giây để đồng hồ tham chiếu PPS hoạt động. Với đồng hồ tham chiếu NMEA, độ lệch thường lớn hơn. Cần phải hiệu chỉnh bằng tùy chọn offset.

Một cách tiếp cận để tìm ra g
Giá trị tốt nhất của tùy chọn offset là cấu hình đồng hồ tham chiếu với tùy chọn noselect và so sánh chúng với máy chủ NTP. Ví dụ, nếu lệnh sourcestats hiển thị

Name/IP Address NP NR Span Frequency Freq Skew Offset Std Dev
===================================================================================
PPS0 0 0 0 +0.000 2000.000 +0ns 4000ms
NMEA 58 30 231 -96.494 38.406 +504ms 6080us
foo.example.net 7 3 200 -2.991 16.141 -107us 492us
độ lệch của nguồn NMEA sẽ cần phải tăng thêm khoảng 0.504 giây. Không cần phải quá chính xác. Miễn là độ lệch của đồng hồ tham chiếu NMEA vẫn dưới 0,2 giây, đồng hồ tham chiếu PPS sẽ có thể xác định được giây tương ứng với các xung và cho phép sử dụng các mẫu để đồng bộ hóa.

### 4. Các vấn đề với chronyc
#### 4.1. Tôi liên tục nhận được lỗi 506 Không thể giao tiếp với daemon
Khi truy cập chronyd từ xa, hãy đảm bảo rằng tệp chrony.conf (trên máy tính đang chạy chronyd) có mục nhập cmdallow cho máy tính bạn đang chạy chronyc và chỉ thị bindcmdaddress phù hợp. Điều này không cần thiết đối với máy chủ cục bộ.

Có lẽ chronyd không chạy. Hãy thử sử dụng lệnh ps (ví dụ: trên Linux, ps -auxw) để xem nó có đang chạy không. Hoặc thử netstat -a và xem cổng UDP 323 có đang lắng nghe không. Nếu chronyd không chạy, bạn có thể gặp sự cố với cách bạn đang cố gắng khởi động nó (ví dụ: khi khởi động).

Có lẽ bạn đã thiết lập tường lửa theo cách chặn các gói tin trên cổng UDP 323. Bạn cần sửa đổi cấu hình tường lửa trong trường hợp này.

#### 4.2. Tôi liên tục nhận được lỗi 501 Không được ủy quyền
Lỗi này cho biết chronyc đã gửi lệnh đến chronyd bằng socket UDP thay vì socket miền Unix (ví dụ: /var/run/chrony/chronyd.sock), đây là yêu cầu đối với một số lệnh. Vì lý do bảo mật, chỉ người dùng root và chrony mới được phép truy cập socket.

Cũng có thể socket không tồn tại. chronyd sẽ không tạo socket nếu thư mục có chủ sở hữu hoặc quyền không đúng. Trong trường hợp này, sẽ có thông báo lỗi từ chronyd trong nhật ký hệ thống.

#### 4.3. ID tham chiếu được lệnh theo dõi báo cáo là gì?
ID tham chiếu là giá trị 32 bit được sử dụng trong NTP để ngăn chặn vòng lặp đồng bộ hóa.

Trong các phiên bản chrony trước 3.0, nó được in theo ký hiệu bốn chấm, ngay cả khi nguồn tham chiếu thực sự không có địa chỉ IPv4. Đối với địa chỉ IPv4, ID tham chiếu bằng với địa chỉ, nhưng đối với địa chỉ IPv6, nó là 32 bit đầu tiên của tổng MD5 của địa chỉ. Đối với đồng hồ tham chiếu, ID tham chiếu là giá trị được chỉ định bằng tùy chọn refid trong chỉ thị refclock.

Kể từ phiên bản 3.0, ID tham chiếu được in dưới dạng số thập lục phân để tránh nhầm lẫn với địa chỉ IPv4.

Nếu bạn cần lấy địa chỉ IP của nguồn tham chiếu hiện tại, hãy sử dụng tùy chọn -n để tắt chức năng phân giải địa chỉ IP và đọc trường thứ hai (được in trong dấu ngoặc đơn) trên dòng ID tham chiếu.

#### 4.4. Giao thức chronyc / chronyd có được ghi chép ở đâu không?
Chỉ theo mã nguồn. Xem cmdmon.c (phía chronyd) và client.c (phía chronyc).

### 5. Các vấn đề về đồng hồ thời gian thực
#### 5.1. Đồng hồ thời gian thực (RTC) là gì?
Đây là đồng hồ giữ thời gian ngay cả khi máy tính của bạn đã tắt. Nó được sử dụng để khởi tạo đồng hồ hệ thống khi khởi động. Thông thường, nó không trôi quá vài giây mỗi ngày.

Có hai cách để chronyd có thể làm việc với nó. Một là sử dụng lệnh rtcsync, lệnh này yêu cầu chronyd bật chế độ hạt nhân để đặt RTC từ đồng hồ hệ thống sau mỗi 11 phút. Bản thân chronyd sẽ không chạm vào RTC. Nếu máy tính không tắt trong thời gian dài, RTC vẫn phải gần với thời gian thực khi đồng hồ hệ thống sẽ được khởi tạo từ máy tính đó trong lần khởi động tiếp theo.

Tùy chọn khác là sử dụng lệnh rtcfile, lệnh này yêu cầu chronyd theo dõi tốc độ RTC tăng hoặc giảm thời gian. Khi chronyd được khởi động bằng tùy chọn -s trong lần khởi động tiếp theo, nó sẽ đặt thời gian hệ thống từ RTC và cũng bù cho độ trôi mà nó đã đo trước đó. Chỉ thị rtcautotrim có thể được sử dụng để giữ RTC gần với thời gian thực, nhưng không nhất thiết phải sử dụng nếu mục đích duy nhất của nó là đặt đồng hồ hệ thống khi chronyd được khởi động khi khởi động. Xem tài liệu để biết chi tiết.

### 5.2. Có phải tắt hwclock không?
Chương trình hwclock được chạy theo mặc định trong các tập lệnh khởi động và/hoặc tắt máy trong một số cài đặt Linux. Với đồng bộ hóa RTC của hạt nhân (chỉ thị rtcsync), RTC cũng sẽ được đặt sau mỗi 11 phút miễn là đồng hồ hệ thống được đồng bộ hóa. Nếu bạn muốn sử dụng chức năng giám sát RTC của chronyd (chỉ thị rtcfile), điều quan trọng là phải tắt hwclock trong quy trình tắt máy. Nếu bạn không làm như vậy, nó sẽ ghi đè RTC bằng một giá trị mới mà chronyd không biết. Ở lần khởi động lại tiếp theo, chronyd được khởi động bằng tùy chọn -s sẽ bù thời gian (sai) này bằng ước tính của nó

RTC đã trôi đi bao xa trong khi tắt nguồn, tạo ra thời gian hệ thống ban đầu vô nghĩa.

Không cần phải xóa hwclock khỏi quy trình khởi động, miễn là chronyd được khởi động sau khi chạy.

5.3. Tôi chỉ liên tục nhận được thông báo 513 Trình điều khiển RTC không chạy
Để hỗ trợ đồng hồ thời gian thực hoạt động, bạn cần ba thứ sau

một RTC trong máy tính của bạn

một hạt nhân Linux có hỗ trợ RTC được bật

một lệnh rtcfile trong tệp chrony.conf của bạn

5.4. Tôi nhận được thông báo Không thể mở /dev/rtc, Thiết bị hoặc tài nguyên đang bận trong tệp syslog của tôi
Một số chương trình khác đang chạy trên hệ thống có thể đang sử dụng thiết bị.

5.5. Khi tôi khởi động chronyd, nhật ký ghi Không thể bật ngắt RTC: Đối số không hợp lệ (hoặc có thể ghi là vô hiệu hóa)
Phần cứng đồng hồ thời gian thực của bạn có thể không hỗ trợ các yêu cầu ioctl bắt buộc:

RTC_UIE_ON

RTC_UIE_OFF

Một giải pháp khả thi là xây dựng hạt nhân Linux có hỗ trợ mô phỏng phần mềm thay thế; hãy thử bật tùy chọn cấu hình sau khi xây dựng hạt nhân Linux:

CONFIG_RTC_INTF_DEV_UIE_EMUL

5.6. Nếu máy tính của tôi không có RTC hoặc pin dự phòng thì sao?
Trong trường hợp này, bạn vẫn có thể sử dụng tùy chọn -s để đặt đồng hồ hệ thống thành thời gian sửa đổi cuối cùng của tệp drift, tương ứng với thời gian hệ thống khi chronyd đã dừng trước đó. Thời gian hệ thống ban đầu sẽ tăng lên sau mỗi lần khởi động lại và các ứng dụng được khởi động sau khi chronyd sẽ không quan sát các bước lùi.

6. Các vấn đề cụ thể của NTP
6.1. Có thể điều khiển chronyd từ máy chủ NTP phát/phát đa hướng không?

Không, chế độ máy khách phát/phát đa hướng không được hỗ trợ và hiện tại không có kế hoạch triển khai chế độ này. Mặc dù chế độ này có thể đơn giản hóa cấu hình máy khách trong các mạng lớn, nhưng về bản chất, chế độ này kém chính xác và kém an toàn hơn (kể cả khi có xác thực) so với chế độ máy khách/máy chủ thông thường.

Khi cấu hình số lượng lớn máy khách trong mạng, bạn nên sử dụng chỉ thị nhóm với tên DNS phân giải thành địa chỉ của nhiều máy chủ NTP. Máy khách sẽ tự động thay thế máy chủ khi chúng không thể truy cập được hoặc không phù hợp để đồng bộ hóa bằng máy chủ mới từ nhóm.

Ngay cả với phần cứng rất khiêm tốn, máy chủ NTP vẫn có thể phục vụ thời gian cho hàng trăm nghìn máy khách bằng chế độ máy khách/máy chủ thông thường.

6.2. Chronyd có thể truyền các gói NTP phát không?
Có, chỉ thị phát có thể được sử dụng để cho phép chế độ máy chủ phát phục vụ thời gian cho các máy khách trong mạng hỗ trợ chế độ máy khách phát (chế độ này không được hỗ trợ trong chronyd). Lưu ý rằng chế độ này thường nên tránh. Xem câu hỏi trước.

6.3. chronyd có thể giữ cho đồng hồ hệ thống có độ lệch cố định so với thời gian thực không?
Có. Bắt đầu từ phiên bản 3.0, độ lệch có thể được chỉ định bằng tùy chọn độ lệch cho tất cả các nguồn thời gian trong tệp chrony.conf.

6.4. Điều gì xảy ra nếu kết nối mạng bị ngắt mà không sử dụng lệnh ngoại tuyến của chronyc trước?
chronyd sẽ tiếp tục cố gắng truy cập các nguồn mà nó cho là trực tuyến và sẽ mất nhiều thời gian hơn trước khi thực sự thực hiện các phép đo mới và đồng hồ được hiệu chỉnh khi mạng được kết nối lại. Nếu các nguồn được đặt thành ngoại tuyến, chronyd sẽ thực hiện các phép đo mới ngay sau khi phát lệnh trực tuyến.

Trừ khi kết nối mạng chỉ kéo dài vài phút (ít hơn khoảng thời gian thăm dò tối đa), độ trễ thường không phải là vấn đề và có thể chấp nhận được khi giữ tất cả các nguồn trực tuyến mọi lúc.

6.5. Tại sao độ lệch được đo giữa hai máy tính được đồng bộ hóa với nhau?

Khi hai máy tính được đồng bộ hóa với nhau bằng chế độ máy khách/máy chủ hoặc chế độ NTP đối xứng, kỳ vọng là các phép đo NTP giữa hai máy tính được thực hiện ở cả hai đầu sẽ cho thấy độ lệch trung bình gần bằng không.

Với chronyd, điều đó chỉ có thể xảy ra khi chế độ xen kẽ được bật bằng tùy chọn xleave. Nếu không, chronyd sẽ sử dụng các dấu thời gian truyền khác nhau (ví dụ: dấu thời gian daemon so với dấu thời gian kernel) để phục vụ thời gian và đồng bộ hóa đồng hồ của riêng nó, điều này sẽ khiến máy tính kia đo được độ lệch đáng kể.

7. Hệ điều hành
7.1. Chrony có hỗ trợ Windows không?
Không. Chương trình chronyc (máy khách dòng lệnh được sử dụng để định cấu hình chronyd trong khi đang chạy) đã được xây dựng và chạy thành công trên Cygwin trong quá khứ. chronyd không phải là chương trình di động, vì một phần của chương trình phụ thuộc rất nhiều vào hệ thống. Chương trình cần được điều chỉnh để hoạt động với lệnh gọi adjtimex() tương đương của Windows và cần được thiết lập để hoạt động như một dịch vụ.

7.2. Có kế hoạch nào hỗ trợ Windows không?
Chúng tôi không có kế hoạch nào để làm điều này. Bất kỳ ai cũng có thể tiếp nhận tác phẩm này và đóng góp trở lại cho dự án.
### **1. Chrony so sánh với các chương trình khác**  
**1.1. Chrony khác gì so với ntpd?**  
Chrony và ntpd là hai triển khai khác nhau của Giao thức Thời gian Mạng (NTP).  

- **Chrony**:  
  - Là phiên bản mới hơn, được thiết kế để hoạt động hiệu quả trong nhiều điều kiện khác nhau.  
  - Đồng bộ hóa đồng hồ hệ thống nhanh hơn và chính xác hơn.  
  - Không hỗ trợ các chế độ ít hữu ích như máy khách broadcast hay máy chủ multicast.  

- **ntpd**: Phù hợp với các hệ thống ổn định và kết nối mạng liên tục.  

Nếu máy tính chỉ kết nối Internet trong thời gian ngắn, mạng thường xuyên bị tắc nghẽn, hoặc là máy ảo, Chrony sẽ hoạt động tốt hơn.  

Để so sánh chi tiết hơn, bạn có thể tham khảo trang so sánh trên website của Chrony.  

---

### **2. Các vấn đề cấu hình**  
**2.1. Cấu hình tối thiểu cho một máy khách NTP là gì?**  
Máy khách cần biết các máy chủ NTP để đồng bộ thời gian. Ví dụ:  

```bash
pool pool.ntp.org iburst
driftfile /var/lib/chrony/drift
makestep 1 3
rtcsync
```  
- **`iburst`**: Tăng tốc quá trình đồng bộ ban đầu.  
- **`makestep`**: Cho phép điều chỉnh đồng hồ nhanh khi thời gian sai lệch lớn.  
- **`rtcsync`**: Đồng bộ thời gian với đồng hồ thời gian thực.  

Nếu cần thêm thông tin cụ thể hoặc các mục khác, bạn có thể yêu cầu tiếp nhé!

### Hướng dẫn cài đặt NTP Server

**Cài đặt và cấu hình NTP Server** giúp đồng bộ hóa thời gian giữa các thiết bị trong mạng. NTP sử dụng **port 123/UDP**.

---

#### **1. Cài đặt NTP Server (NTPd)**

**Bước 1:** Thiết lập lại múi giờ
```bash
timedatectl set-timezone Asia/Ho_Chi_Minh
```

**Bước 2:** Cài đặt NTPd
```bash
apt -y install ntp
```

**Bước 3:** Cấu hình NTPd
Mở file cấu hình:
```bash
vi /etc/ntp.conf
```

- **Dòng 21:** Bỏ cài đặt mặc định và thêm máy chủ NTP phù hợp với múi giờ của bạn.
```bash
#pool 0.ubuntu.pool.ntp.org iburst
#pool 1.ubuntu.pool.ntp.org iburst
#pool 2.ubuntu.pool.ntp.org iburst
#pool 3.ubuntu.pool.ntp.org iburst

pool vn.pool.ntp.org iburst
```

- **Dòng 51:** Thêm phạm vi mạng được phép đồng bộ thời gian.
```bash
restrict 172.16.200.0 mask 255.255.255.0 nomodify notrap
```

**Bước 4:** Khởi động lại NTPd
```bash
systemctl restart ntp
```

**Bước 5:** Kiểm tra trạng thái
```bash
ntpq -p
```

---

#### **2. Cài đặt NTP Server (Chrony)**

**Bước 1:** Thiết lập lại múi giờ
```bash
timedatectl set-timezone Asia/Ho_Chi_Minh
```

**Bước 2:** Cài đặt Chrony
```bash
apt -y install chrony
```

**Bước 3:** Cấu hình Chrony
Mở file cấu hình:
```bash
vi /etc/chrony/chrony.conf
```

- **Dòng 20:** Bỏ các dòng cài đặt mặc định và thêm máy chủ NTP phù hợp với múi giờ của bạn.
```bash
#pool ntp.ubuntu.com iburst maxsources 4
#pool 0.ubuntu.pool.ntp.org iburst maxsources 1
#pool 1.ubuntu.pool.ntp.org iburst maxsources 1
#pool 2.ubuntu.pool.ntp.org iburst maxsources 2

pool vn.pool.ntp.org iburst
```

- **Cuối file:** Thêm phạm vi mạng được phép đồng bộ thời gian.
```bash
allow 172.16.200.0/24
```

**Bước 4:** Khởi động lại Chrony
```bash
systemctl restart chrony
```

**Bước 5:** Kiểm tra trạng thái
```bash
chronyc sources
```

**Bước 6:** Kiểm tra các client đang kết nối
```bash
chronyc clients
```

---

#### **3. Cấu hình NTP Client**

- **Ubuntu** hỗ trợ sẵn **systemd-timesyncd.service** để làm NTP Client.
- Ngoài ra, bạn có thể sử dụng NTPd hoặc Chrony làm NTP Client.

**Bước 1:** Kiểm tra trạng thái dịch vụ
```bash
systemctl status systemd-timesyncd
```

**Bước 2:** Cấu hình Client
Mở file cấu hình:
```bash
vi /etc/systemd/timesyncd.conf
```

Thêm dòng:
```bash
NTP=172.16.200.2
```

**Bước 3:** Khởi động lại dịch vụ
```bash
systemctl restart systemd-timesyncd
```

**Bước 4:** Kiểm tra trạng thái đồng bộ
```bash
timedatectl timesync-status
```

---

### **Ghi chú**
- Đảm bảo các thiết bị trong mạng được cấu hình cùng múi giờ để tránh sai lệch thời gian.
- Sử dụng máy chủ NTP địa phương (vd: `vn.pool.ntp.org`) để giảm độ trễ mạng.
