## Giới thiệu Windows Server 2012 Hyper-V

Windows Server 2012 Hyper-V phản ánh sự thay đổi trong ngành công nghệ thông tin từ mô hình tập trung sang mô hình ảo hóa. Chương này giới thiệu về các yêu cầu, khả năng mở rộng, và các hệ điều hành khách hỗ trợ của Hyper-V. 

Cấp phép cho ảo hóa là một vấn đề quan trọng, giúp công ty giữ tính hợp pháp và tiết kiệm chi phí. Chương này cũng so sánh Hyper-V với VMware và cung cấp cái nhìn tổng quan cho những người đã quen thuộc với VMware. 

Cuối cùng, việc đánh giá chính xác là bước quan trọng nhất trong dự án. Microsoft cung cấp bộ công cụ miễn phí Microsoft Assessment and Planning Toolkit. Một trong những tính năng mới quan trọng của Windows Server 2012 là PowerShell, sẽ được giới thiệu và hướng dẫn cách bắt đầu sử dụng.
## Nội dung 

Trong chương này, bạn sẽ học về:

- Ảo hóa và điện toán đám mây
- Kiến trúc Hyper-V, yêu cầu và các hệ điều hành khách được hỗ trợ
- Kích thước dự án Hyper-V và sử dụng PowerShell
## Ảo hóa và Điện toán Đám mây

Bạn cần hiểu nguồn gốc để biết bạn đang đi đâu. Phần này sẽ xem xét cách mà thế giới IT bắt đầu từ thời kỳ máy chủ lớn và hiện nay đang chuyển hướng sang điện toán đám mây, cũng như lý do điều này có liên quan đến Windows Server 2012 Hyper-V.

### Lịch sử Điện toán: Client/Server

Cách thức thực hiện điện toán đã thay đổi, và ở một số khía cạnh, gần như quay trở lại vòng tròn trong vài thập kỷ qua. Các máy chủ lớn và đắt tiền chiếm ưu thế trong những ngày đầu, cung cấp tài nguyên tính toán được sử dụng bởi một số ít người từ các trạm đầu cuối đơn giản. Những máy chủ này là điểm thất bại duy nhất và rất đắt đỏ. Sự thiếu linh hoạt và chi phí cao của chúng đã trở thành điểm yếu khi thời kỳ điện toán client/server bắt đầu.

Các máy tính cá nhân giá rẻ, chủ yếu sử dụng hệ điều hành Windows, đã thay thế các trạm đầu cuối màn hình xanh. Điều này cho phép người dùng có một thiết bị mạnh mẽ hơn để thực hiện nhiều tác vụ tại chỗ. Chi phí thấp và sức mạnh tính toán phân tán cho phép mỗi nhân viên văn phòng sử dụng máy tính cá nhân, xuất hiện ở nhiều nơi bất ngờ như thiết bị cảm ứng trong nhà máy hay thiết bị cầm tay trong bệnh viện.

Chi phí thấp của các máy chủ đã dẫn đến một số thay đổi. Các máy chủ lớn yêu cầu quản lý thay đổi nhiều và thiếu linh hoạt do rủi ro sai sót ảnh hưởng đến tất cả hoạt động kinh doanh. Một máy chủ, hoặc nhóm máy chủ, thường chạy một ứng dụng duy nhất, cho phép doanh nghiệp linh hoạt hơn. Các máy chủ bắt đầu xuất hiện với số lượng lớn và không chỉ trong phòng máy tính trung tâm hay trung tâm dữ liệu.

Vào giữa những năm 1990, công ty Citrix Systems đã nổi tiếng với công nghệ máy tính dựa trên máy chủ. Nhiều doanh nghiệp gặp khó khăn trong việc quản lý máy tính phân tán qua WAN/Internet. Citrix đã giới thiệu máy tính dựa trên máy chủ, cho phép người dùng sử dụng một ứng dụng phần mềm trên PC hoặc trạm đầu cuối để đăng nhập vào một máy chủ chung để lấy desktop của riêng họ. Máy chủ Citrix nằm trong một trung tâm dữ liệu bên cạnh các máy chủ ứng dụng.

Máy tính dựa trên máy chủ trở thành xu hướng vào cuối những năm 1990. Nhiều dự đoán cuối năm cho rằng kỷ nguyên máy tính cá nhân đã chết và mọi người sẽ đăng nhập vào các máy chủ từ xa vào năm 2000. Tuy nhiên, thế giới đã tiếp tục sử dụng PC vì sức mạnh tính toán tại chỗ kinh tế hơn, sẵn có hơn và linh hoạt hơn.

Trong thế giới máy chủ, chúng ta cũng thấy nhiều phản ứng đối với sự phát triển không kiểm soát của máy chủ. Các nhà cung cấp thiết bị mạng đã tạo ra công nghệ để đưa các máy chủ trở lại trung tâm dữ liệu, đồng thời duy trì hiệu suất phần mềm khách và đáp ứng mong đợi của người dùng cuối. Điện toán client/server là phản ứng đối với sự tập trung cực độ của máy chủ lớn, nhưng ngành công nghiệp đang cố gắng quay trở lại những ngày đó.

Hai vấn đề lớn đã xuất hiện:

- Nhiều máy chủ gần giống nhau được nhân đôi tại mỗi văn phòng chi nhánh, tăng chi phí và công sức quản lý.
- Không có nhiều quản trị viên máy chủ giỏi, và các máy chủ từ xa thường bị quản lý kém.

Mỗi ứng dụng yêu cầu ít nhất một cài đặt hệ điều hành (OS). Mỗi OS cần một máy chủ. Các máy chủ thường chậm trong việc mua và cài đặt, tiêu thụ không gian rack và năng lượng, tạo ra nhiệt (cần thêm năng lượng để làm mát) và thiếu linh hoạt (một sự cố phần cứng có thể làm vô hiệu hóa ứng dụng). Các quản trị viên có đủ khả năng theo dõi thấy rằng các máy chủ của họ được sử dụng rất ít, gần như không sử dụng CPU, RAM, tốc độ đĩa và băng thông mạng. Điều này là một cách tốn kém để tiếp tục cung cấp dịch vụ IT, đặc biệt khi IT không phải là trung tâm lợi nhuận trong hầu hết các doanh nghiệp.

## Điện toán Gần Đây: Ảo hóa

Sân khấu đã được thiết lập cho sự trở lại của một khái niệm cũ. Một số máy chủ lớn và máy chủ cao cấp có khả năng chạy nhiều hệ điều hành đồng thời bằng cách chia sẻ sức mạnh xử lý. Ảo hóa là công nghệ mà phần mềm sẽ mô phỏng phần cứng của từng máy tính trên một máy tính duy nhất (máy chủ). Mỗi máy tính mô phỏng này được gọi là máy ảo (còn được gọi là VM hoặc khách). 

Mỗi máy ảo có thông số phần cứng mô phỏng với sự phân bổ tài nguyên như bộ xử lý, lưu trữ, bộ nhớ và mạng từ máy chủ. Máy chủ có thể chạy một hoặc nhiều máy ảo, và mỗi máy ảo sẽ tiêu thụ một phần tài nguyên.

Một máy ảo được tạo ra thay vì triển khai một máy chủ vật lý. Máy ảo có hệ điều hành khách riêng, hoàn toàn tách biệt với máy chủ. Máy ảo có địa chỉ MAC riêng trên mạng, cùng với địa chỉ IPv4 và/hoặc IPv6 riêng. Máy ảo được cách ly khỏi máy chủ, với ranh giới bảo mật riêng. Điều duy nhất khiến nó khác biệt so với máy chủ vật lý là nó là một máy được mô phỏng không thể chạm vào và chia sẻ tài nguyên của máy chủ với các máy ảo khác.

## Tài nguyên Máy chủ Là Hữu Hạn

Mặc dù ảo hóa đã tồn tại hơn một thập kỷ và trở thành công nghệ chính thống cần có trong CV, nhiều người vẫn không hiểu rằng máy chủ có tài nguyên hữu hạn. Một hiểu lầm đáng tiếc là niềm tin rằng các máy ảo sẽ rút ra sức mạnh xử lý, bộ nhớ, băng thông mạng và dung lượng/lưu lượng lưu trữ từ một vũ trụ song song chưa được khai thác.

Trên thực tế, mỗi máy ảo đều tiêu thụ tài nguyên từ máy chủ của nó. Nếu một máy ảo đang sử dụng 500 GB dung lượng lưu trữ, nó đang lấy 500 GB từ máy chủ. Nếu một máy ảo sử dụng 75% của một bộ xử lý sáu nhân, máy đó sẽ chiếm dụng tài nguyên bộ xử lý từ máy chủ. Mỗi máy ảo đang cạnh tranh với tất cả các máy ảo khác để giành tài nguyên máy chủ. 

Điều này rất quan trọng để hiểu nhằm kích thước máy chủ một cách thích hợp cho các máy ảo và triển khai các hệ thống quản lý nhằm cân bằng tải cho các máy ảo trên các máy chủ.

## Hai loại phần mềm ảo hóa cho ảo hóa máy

Có hai loại phần mềm ảo hóa cho ảo hóa máy, được mô tả như sau:

- **Loại 1**: Còn được gọi là hypervisor, giải pháp ảo hóa loại 1 chạy trực tiếp trên phần cứng.

- **Loại 2**: Giải pháp ảo hóa loại 2 được cài đặt trên một hệ điều hành và phụ thuộc vào hệ điều hành đó để hoạt động.

Sản phẩm ảo hóa loại 1 của VMware là ESX (sau này là ESXi, một thành phần của vSphere). Giải pháp ảo hóa máy chủ của Microsoft, Virtual Server, là một sản phẩm loại 2 và được cài đặt trên Windows Server 2003 và Windows Server 2003 R2. Ảo hóa loại 2 đã có một số triển khai hạn chế nhưng bị giới hạn về quy mô và hiệu suất, và phụ thuộc vào hệ điều hành máy chủ của nó. Các hypervisor loại 1 đã được triển khai rộng rãi nhờ khả năng mở rộng, hiệu suất và độ ổn định vượt trội. Microsoft đã phát hành Hyper-V cùng với Windows Server 2008. Hyper-V là một sản phẩm loại 1 thực sự, mặc dù bạn cần cài đặt Windows Server trước để kích hoạt nó.

![](https://img001.prntscr.com/file/img001/0Onl2nqMTFm_c1nzzhowGQ.png)

## Mục tiêu ban đầu của ảo hóa

Mục tiêu ban đầu của ảo hóa là chuyển tất cả các máy chủ chưa được sử dụng hết công suất thành các máy ảo chạy trên ít máy chủ hơn. Điều này giúp giảm chi phí mua sắm, không gian rack, điện năng, giấy phép và làm mát. Vào năm 2007, một mục tiêu lý tưởng là có 10 máy ảo trên mỗi máy chủ. Ít ai dám xem xét việc chạy máy chủ cơ sở dữ liệu hoặc các khối tải nặng, quan trọng trên các máy ảo. Ảo hóa chỉ được sử dụng cho các ứng dụng nhẹ hoặc không quan trọng.

Thế giới CNTT bắt đầu hiểu rõ hơn về ảo hóa và khai thác một số đặc tính của nó. Một máy ảo thường chỉ là một tập hợp các tệp. Các ổ đĩa ảo là các tệp chứa hệ thống tệp, hệ điều hành, cài đặt ứng dụng và dữ liệu. Cấu hình máy cũng chỉ là vài tệp nhỏ. Các tệp dễ dàng sao lưu, sao chép và di chuyển. Máy ảo thường chỉ là vài tệp, và điều này khiến chúng tương đối dễ dàng chuyển từ máy chủ này sang máy chủ khác mà không có thời gian ngừng hoạt động hoặc như một phản ứng tự động đối với sự cố của máy chủ.

Ảo hóa không chỉ mang lại giảm chi phí mà còn tăng tính linh hoạt. Doanh nghiệp cần chú ý đến tài sản tiềm năng này:

- Máy ảo có thể được triển khai nhanh chóng theo yêu cầu của doanh nghiệp.
- Các dịch vụ có thể đạt được mức độ khả dụng mà trước đây không thể đạt được.
- Sao lưu máy ảo trở nên dễ dàng hơn vì chúng chủ yếu chỉ là các tệp.
- Liên tục kinh doanh hoặc phục hồi thảm họa nên là một vấn đề của doanh nghiệp chứ không chỉ của CNTT; ảo hóa có thể giúp sao chép dịch vụ và dữ liệu dễ dàng hơn so với máy chủ truyền thống.

Intel và AMD đã cải thiện sức mạnh bộ xử lý và mật độ lõi. Các nhà sản xuất bộ nhớ đã sản xuất DIMM lớn hơn. Các nhà sản xuất máy chủ nhận ra rằng ảo hóa đã trở thành chuẩn mực, và máy chủ nên được thiết kế để hoạt động như các máy chủ chủ thay vì theo mô hình truyền thống là một máy chủ tương ứng với một hệ điều hành. Máy chủ có thể có nhiều sức mạnh tính toán và bộ nhớ hơn. Mạng bắt đầu chuyển từ 1 GbE sang 10 GbE. Điều này có nghĩa là các máy chủ có thể chạy nhiều hơn 10 máy ảo nhẹ.

Doanh nghiệp muốn tất cả các lợi ích của ảo hóa, đặc biệt là tính linh hoạt, cho tất cả các dịch vụ của họ. Họ muốn loại bỏ các cài đặt máy chủ vật lý và chạy càng nhiều máy ảo càng tốt trên ít máy chủ hơn. Điều này có nghĩa là các máy chủ lớn hơn, ảo hóa có khả năng hơn, tỷ lệ 10:1 đã trở nên lỗi thời, và các khối tải lớn và quan trọng đang chạy như các máy ảo khi phần cứng máy chủ và ảo hóa đáp ứng được yêu cầu của dịch vụ.

Ảo hóa không chỉ dành cho máy chủ. Các công nghệ như Remote Desktop Services đã chứng minh rằng người dùng từ xa có thể có trải nghiệm tốt khi đăng nhập vào một máy tính để bàn trên máy chủ. Một trong những thách thức với loại hình máy chủ này là người dùng đăng nhập vào một máy chủ chia sẻ, nơi họ chạy các ứng dụng do bộ phận CNTT cung cấp. Một sự cố trên một máy chủ đơn có thể ảnh hưởng đến hàng chục người dùng. Các quy trình kiểm soát thay đổi có thể làm chậm phản ứng với các yêu cầu hỗ trợ. Một số doanh nghiệp muốn có sự cô lập và linh hoạt của PC kết hợp với sự tập trung của Remote Desktop Services. Điều này được thực hiện thông qua hạ tầng máy tính để bàn ảo (VDI). 

Khách hàng từ xa, được cài đặt trên terminal hoặc PC, sẽ kết nối với một broker khi người dùng bắt đầu làm việc. Broker sẽ chuyển tiếp kết nối của người dùng đến một máy ảo đang chờ (trên một máy chủ trong trung tâm dữ liệu) nơi họ sẽ đăng nhập. Máy ảo này không chạy hệ điều hành máy chủ; nó chạy hệ điều hành máy tính để bàn như Windows Vista hoặc Windows 7, và hệ điều hành đó đã có tất cả các ứng dụng cần thiết cho người dùng. Mỗi người dùng có máy ảo riêng và môi trường làm việc độc lập của mình.

Dự đoán vào cuối năm từ các nhà phân tích đã tuyên bố đó là năm của VDI, trong khoảng năm năm liên tiếp. Mỗi năm đều được coi là năm cuối cùng của PC khi chúng ta chuyển sang VDI. Một số doanh nghiệp đã thực hiện chuyển đổi, nhưng chủ yếu là những doanh nghiệp nhỏ. Thực tế, PC vẫn chiếm ưu thế, với Remote Desktop Services (hiện nay thường chạy như máy ảo) và VDI đóng vai trò giải quyết các vấn đề cụ thể cho một số người dùng hoặc văn phòng.

## Điện toán hiện tại: Điện toán đám mây

Chúng ta có thể lập luận rằng smartphone và máy tính bảng đã thay đổi cách nhìn của doanh nghiệp về CNTT. Người dùng, quản lý và giám đốc đã tự mua thiết bị cho bản thân và nhận ra rằng họ có thể cài đặt ứng dụng mà không cần sự can thiệp của bộ phận CNTT, thường bận rộn với những nhiệm vụ quan trọng hơn và thường bị coi là làm chậm khả năng phản ứng của doanh nghiệp trước các mối đe dọa và cơ hội. Dù vậy, CNTT vẫn có vai trò quan trọng; ai đó vẫn phải xây dựng dịch vụ, tích hợp chúng, quản lý mạng lưới, đảm bảo mức độ dịch vụ, bảo mật môi trường và thực hiện tuân thủ quy định.

Nếu doanh nghiệp có thể triển khai dịch vụ tương tự như cách cài đặt ứng dụng trên smartphone thì sao? Khi nói về doanh nghiệp, chúng ta ám chỉ đến các nhà phát triển ứng dụng, người thử nghiệm và quản lý; không ai mong đợi một kế toán viên vật lộn với tên đăng nhập của họ mỗi thứ Hai lại triển khai một dịch vụ CNTT phức tạp. Với dịch vụ tự phục vụ, doanh nghiệp có thể triển khai dịch vụ khi họ cần. Đây là nơi điện toán đám mây trở nên quan trọng.

Điện toán đám mây là một thuật ngữ bắt đầu trở nên phổ biến từ năm 2007. Đám mây có thể gây nhầm lẫn và thậm chí làm sợ hãi những ai chưa quen thuộc với nó. Hầu hết mọi người coi điện toán đám mây có nghĩa là thuê ngoài, một thuật ngữ khiến bất kỳ nhân viên nào cũng cảm thấy rùng mình. Đây chỉ là một cách mà đám mây có thể được sử dụng. Viện Tiêu chuẩn và Công nghệ Quốc gia (NIST), một cơ quan của Bộ Thương mại Hoa Kỳ, đã công bố "Định nghĩa về điện toán đám mây của NIST" (http://csrc.nist.gov/publications/nistpubs/800-145/SP800-145.pdf) mà đã trở thành một tài liệu được chấp nhận chung và được khuyến nghị đọc.

### Các đặc điểm của điện toán đám mây:
- **Tự phục vụ:** Người dùng có thể triển khai dịch vụ khi cần mà không cần sự can thiệp của CNTT.
- **Truy cập mạng rộng:** Có nhiều kết nối mạng cho dịch vụ.
- **Tập trung tài nguyên:** Có một tập hợp tài nguyên và sức mạnh tính toán trung tâm và có thể tái sử dụng.
- **Tính linh hoạt nhanh chóng:** Có nhiều sức mạnh tính toán và tài nguyên sẵn có nếu cần, cho phép người dùng tiêu thụ tài nguyên theo yêu cầu mà không có cam kết lâu dài.
- **Dịch vụ được đo lường:** Việc sử dụng tài nguyên có thể được đo lường, và thông tin có thể được sử dụng cho báo cáo hoặc tính phí chéo.

Không có đặc điểm nào trong điện toán đám mây nói rằng điện toán đám mây là thuê ngoài. Thực tế, thuê ngoài chỉ là một mô hình triển khai trong số nhiều mô hình có thể của đám mây, mỗi mô hình đều phải có tất cả các đặc điểm của đám mây:

- **Đám mây công cộng:** Là đám mây do nhà cung cấp dịch vụ vận hành trong cơ sở của riêng họ. Tài nguyên được chia sẻ giữa các khách hàng.
- **Đám mây riêng:** Có hai hình thức. Một là đám mây do nhà cung cấp dịch vụ vận hành nhưng dành riêng cho một khách hàng. Hoặc có thể là đám mây do tổ chức tự vận hành mà không có bất kỳ thuê ngoài nào. Đám mây riêng là hình thức tập trung máy chủ tối ưu.
- **Đám mây lai:** Kết nối giữa đám mây riêng và đám mây công cộng, người dùng có thể chọn địa điểm tốt nhất cho dịch vụ mới, có thể trải dài qua cả hai đám mây.
- **Đám mây cộng đồng:** Nơi nhiều tổ chức hợp tác để kết hợp tài nguyên tính toán của họ. Mô hình triển khai này sẽ hiếm gặp trong doanh nghiệp tư nhân, nhưng có thể hữu ích trong môi trường nghiên cứu hợp tác.
- 
Các dịch vụ đám mây công cộng như Microsoft’s Windows Azure và Office 365, Amazon Elastic Compute Cloud (EC2), Google Docs, Salesforce, và thậm chí Facebook đều là những biến thể của đám mây công cộng. Microsoft cũng cung cấp một giải pháp đám mây riêng dựa trên ảo hóa máy chủ (xem Microsoft Private Cloud Computing, Sybex 2012). Tất cả những dịch vụ này đều thuộc một trong ba loại mô hình dịch vụ sau:

- **Phần mềm như một dịch vụ (SaaS):** Khách hàng có thể đăng ký sản phẩm SaaS thay vì triển khai dịch vụ tại trung tâm dữ liệu của họ. Điều này giúp họ có quyền truy cập nhanh vào ứng dụng mới. Office 365 và Salesforce là những ví dụ về SaaS.

- **Nền tảng như một dịch vụ (PaaS):** Nhà phát triển có thể triển khai cơ sở dữ liệu và/hoặc ứng dụng trên PaaS thay vì trên một máy chủ hoặc hệ điều hành khách của máy ảo. Điều này loại bỏ nhu cầu quản lý hệ điều hành khách. Facebook là một PaaS dành cho các nhà phát triển trò chơi, và Windows Azure cũng cung cấp PaaS.

- **Hạ tầng như một dịch vụ (IaaS):** IaaS cung cấp ảo hóa máy tính thông qua một trong các mô hình triển khai và tuân thủ các đặc điểm của đám mây. Điều này cung cấp một môi trường làm việc quen thuộc với sự linh hoạt và di động tối đa giữa các đám mây. Windows Server 2012 Hyper-V có thể được sử dụng để tạo ra các tài nguyên tính toán của một đám mây IaaS theo bất kỳ loại triển khai nào tuân thủ các đặc điểm của đám mây. Để hoàn thiện giải pháp, bạn sẽ cần sử dụng System Center 2012 với Service Pack 1, mà cũng có thể bao gồm VMware vSphere và Citrix XenServer như các tài nguyên tính toán trong đám mây.

Điện toán đám mây đã trở thành phương pháp ưa thích để triển khai dịch vụ trong một hạ tầng, đặc biệt đối với các doanh nghiệp vừa và lớn. Điều này là do những tổ chức này thường có các nhóm hoặc bộ phận khác nhau để quản lý hạ tầng và ứng dụng, và tính tự phục vụ của đám mây giúp các nhà phát triển ứng dụng hoặc quản lý triển khai các dịch vụ mới theo yêu cầu, trong khi đội ngũ CNTT quản lý, cải tiến và bảo mật hạ tầng.

Tuy nhiên, đám mây có thể không phù hợp với mọi doanh nghiệp. Nếu cùng một nhóm chịu trách nhiệm cho cả hạ tầng và ứng dụng, thì tính tự phục vụ sẽ không hợp lý! Những gì họ cần là tự động hóa. Các doanh nghiệp nhỏ và vừa có thể thích một số khía cạnh của điện toán đám mây như tự phục vụ hoặc đo lường tài nguyên, nhưng toàn bộ giải pháp có thể hơi phức tạp đối với quy mô hạ tầng của họ.
### Windows Server 2012: Vượt Ra Khỏi Ảo Hóa

Microsoft đã đến muộn trong cuộc cạnh tranh ảo hóa máy tính khi phát hành Hyper-V cùng với Windows Server 2008. Các phiên bản tiếp theo của Hyper-V được phát hành với Windows Server 2008 R2 và Service Pack 1 cho Windows Server 2008 R2. Sau đó, Microsoft đã dành một năm để trò chuyện với khách hàng (các công ty hosting, tập đoàn, chuyên gia trong ngành, v.v.) và lên kế hoạch cho phiên bản tiếp theo của Windows. Microsoft không chỉ hài lòng với việc có một sản phẩm ảo hóa cạnh tranh hay thậm chí tốt nhất. Họ muốn đưa Hyper-V vượt ra khỏi ảo hóa—và để sử dụng câu slogan tiếp thị của họ, họ đã xây dựng Windows Server 2012 “từ đám mây trở lên”.

Microsoft có thể nói rằng họ có nhiều kinh nghiệm hơn trong việc vận hành các đám mây quan trọng và quy mô lớn hơn bất kỳ tổ chức nào. Hotmail (từ giữa những năm 1990) và Office 365 là những đám mây công cộng SaaS. Azure bắt đầu như một đám mây công cộng PaaS nhưng đã bắt đầu bao gồm IaaS. Microsoft đã làm điện toán đám mây lâu hơn, lớn hơn và qua nhiều dịch vụ hơn bất kỳ ai khác. Họ đã hiểu về điện toán đám mây một thập kỷ trước khi thuật ngữ này được tạo ra. Điều này đã mang lại cho Microsoft một lợi thế độc đáo khi thiết kế lại Hyper-V để trở thành nền tảng chiến lược của đám mây Microsoft (công cộng, riêng tư và lai).
### Windows Server 2012: Các Lĩnh Vực Chiến Lược

Nhiều lĩnh vực chiến lược đã được nhắm đến với việc phát hành Windows Server 2012 và phiên bản mới nhất của Hyper-V:

1. **Tự Động Hóa**  
   Một đám mây cần tự động hóa. Microsoft đã tích hợp ngôn ngữ kịch bản và quản trị PowerShell vào Windows Server 2012. Hệ điều hành có hơn 2.500 cmdlet (phát âm là command-lets) để quản lý chức năng của Windows Server. Có hơn 160 cmdlet PowerShell cho Hyper-V.  
   Sử dụng PowerShell, quản trị viên có thể nhanh chóng cấu hình nhiều máy ảo. Kỹ sư có thể viết một kịch bản để triển khai mạng phức tạp trên một máy chủ. Tư vấn viên có thể viết một kịch bản để xây dựng một cụm. Đám mây có thể sử dụng PowerShell để tự động hóa các tác vụ phức tạp cho phép triển khai hoặc cấu hình tự phục vụ.

2. **Mạng**  
   Một trong những đặc điểm của một đám mây là khả năng truy cập mạng rộng rãi. Microsoft đã bắt đầu với một trang giấy trắng với Windows Server 2012 và phát triển lại mạng cho đám mây. Hiệu suất đã được cải thiện, khả năng sẵn sàng được nâng cao với tính năng teaming NIC tích hợp, giới hạn khả năng mở rộng VLAN trong trung tâm dữ liệu đã được loại bỏ thông qua ảo hóa mạng và mạng định nghĩa bằng phần mềm, và tính mở rộng cho các đối tác đã được thêm vào trung tâm của mạng Hyper-V.

3. **Lưu Trữ**  
   Microsoft nhận ra rằng khách hàng và nhà cung cấp dịch vụ đang gặp khó khăn với lưu trữ. Quản lý lưu trữ khó khăn (một vấn đề cho việc tự phục vụ), chi phí cao (một vấn đề lớn cho các nhà cung cấp dịch vụ), và khách hàng muốn tối đa hóa các khoản đầu tư hiện tại của họ.  
   Một số cải tiến trong mạng đã cho phép Microsoft giới thiệu máy chủ tệp như một nền tảng mới, hỗ trợ, kinh tế, có thể mở rộng và liên tục có sẵn để lưu trữ máy ảo.

4. **Di Động của Người Dùng**  
   Có một điều là có dịch vụ tuyệt vời, nhưng chúng gần như vô ích nếu người dùng không thể truy cập chúng theo cách mà họ muốn. Các phiên bản trước đã giới thiệu một số tính năng mới cho Windows Server, nhưng Microsoft không dừng lại.  
   Direct Access là một giải pháp VPN liền mạch của Microsoft, không được sử dụng nhiều. Trong Windows Server 2012, việc triển khai Direct Access đã được đơn giản hóa (chỉ còn vài cú nhấp chuột trong Server Manager), yêu cầu đã được giảm (không còn cần IPv6 trong trung tâm dữ liệu hoặc Forefront User Access Gateway), và hiệu suất đã được cải thiện ở đầu máy khách trong Windows 8 Enterprise.  
   Giải pháp VDI của Microsoft trong Windows Server 2008 R2 đã rất phức tạp, với nhiều thành phần. Microsoft đã đơn giản hóa kiến trúc của VDI thành một trình hướng dẫn kịch bản trong Server Manager. Giao thức Remote Desktop Protocol (RDP), được sử dụng để kết nối người dùng với các máy tính để bàn từ xa như máy ảo VDI, đã được cải tiến đáng kể đến mức Microsoft đã phải đổi tên thành RemoteFX.

5. **Đám Mây**  
   Hầu hết mọi cải tiến được thực hiện trong Windows Server 2012 Hyper-V đều đóng vai trò trong một đám mây công cộng, riêng tư hoặc lai. Nhiều công nghệ đặc thù cho đám mây đã được đưa vào áp dụng đặc biệt cho các triển khai đám mây, chẳng hạn như Resource Metering. Tính năng mới này ghi lại việc sử dụng tài nguyên của từng máy ảo, cung cấp cho bạn một trong những đặc điểm của NIST về đám mây.
### Hyper-V So với VMware ESXi: Một Cuộc Thi Khác

Chúng ta có thể lập luận rằng trong quá khứ, Hyper-V của Microsoft đã cạnh tranh với ESXi của VMware dựa trên giá cả so với chức năng cần thiết. Nếu bạn cấp phép cho các máy ảo của mình đúng cách (và điều đó có nghĩa là hợp pháp và theo cách tiết kiệm nhất), Hyper-V là miễn phí. Gói quản lý doanh nghiệp, tự động hóa và đám mây của Microsoft, System Center, đã tạo ra sự khác biệt cho Microsoft, cung cấp một gói triển khai, quản lý và cung cấp dịch vụ hoàn chỉnh và tích hợp sâu.

Tuy nhiên, việc phát hành Windows Server 2012 Hyper-V đã đánh dấu một bước chuyển mình khác biệt. Phiên bản này của Hyper-V có khả năng mở rộng hơn so với các đối thủ, linh hoạt hơn và có khả năng thực hiện những điều mà các đối thủ không thể làm (tại thời điểm viết cuốn sách này). 

Việc có thể cạnh tranh cả về giá cả và chức năng, đồng thời được thiết kế để trở thành một tài nguyên tính toán đám mây, khiến Hyper-V trở nên rất hấp dẫn cho các doanh nghiệp nhỏ và vừa (SME), doanh nghiệp lớn và các nhà cung cấp dịch vụ.
### Windows Server 2012 Hyper-V

#### Các yêu cầu kỹ thuật của Hyper-V

Yêu cầu kỹ thuật của Windows Server 2012 Hyper-V khá đơn giản:

1. **Logo Windows Server 2012**: Để nhận được hỗ trợ từ Microsoft, bạn nên đảm bảo rằng phần cứng của mình (bao gồm các thành phần tùy chọn) đã được kiểm tra và đạt chứng nhận logo Windows Server 2012. Bạn có thể kiểm tra với nhà sản xuất và trên danh sách tương thích phần cứng của Microsoft (HCL) cho Windows Server (www.windowsservercatalog.com). Nếu bạn chỉ thực hiện kiểm tra, chứng nhận này không phải là yêu cầu bắt buộc nhưng sẽ hữu ích. Có khả năng rất cao rằng nếu máy của bạn có thể chạy Windows Server 2008 x64 hoặc Windows Vista (bao gồm cả máy tính và laptop), thì nó cũng sẽ chạy được Windows Server 2012. Bạn nên kiểm tra với nhà sản xuất phần cứng để biết thêm thông tin hỗ trợ.

2. **Bộ xử lý 64-bit**: Microsoft chỉ phát hành các phiên bản 64-bit của Windows Server, và Hyper-V yêu cầu một bộ xử lý x64.


3. **Ảo hóa hỗ trợ CPU**: Bộ xử lý phải hỗ trợ ảo hóa hỗ trợ CPU, và tính năng này phải được bật trong cài đặt của máy chủ. Intel gọi tính năng này là VT-x, trong khi AMD gọi là AMD-V.

4. **Bảo vệ thực thi dữ liệu (DEP)**: Trong một cuộc tấn công tràn bộ đệm, một hacker có thể ghi một lệnh vào bộ nhớ dữ liệu với ý định khiến bộ xử lý thực thi mã độc hại. Khi Bảo vệ Thực thi Dữ liệu (DEP) được bật, bộ nhớ chứa dữ liệu sẽ được đánh dấu để không thể được bộ xử lý thực thi. Điều này ngăn chặn cuộc tấn công thành công. DEP phải có sẵn trong BIOS của máy chủ và phải được bật trong cài đặt của máy chủ để Hyper-V có thể cài đặt hoặc khởi động. Tính năng này bảo vệ các hoạt động bên trong của Hyper-V khỏi các cuộc tấn công độc hại từ những người đã đăng nhập vào một máy ảo trên máy chủ. Intel gọi DEP là bit XD (Execute Disable bit), trong khi AMD gọi là bit NX (No Execute bit). Bạn nên tham khảo tài liệu của nhà sản xuất phần cứng để biết thêm thông tin. Mỗi máy chủ từ các nhà sản xuất lớn đều nên hỗ trợ tính năng này. Thường thì chỉ có những vấn đề xảy ra trên các máy tính và laptop cấp tiêu dùng.
5. 
---
### Chuyển đổi địa chỉ cấp hai (SLAT)

Khi Microsoft công bố rằng phiên bản desktop của Windows, Windows 8 (các phiên bản Pro và Enterprise), sẽ hỗ trợ Client Hyper-V, đã có một số nhầm lẫn. Client Hyper-V là phiên bản Hyper-V giống như trên Windows Server 2012, nhưng không có các chức năng của máy chủ như clustering, Live Migration, NIC teaming, và các tính năng khác.

Client Hyper-V rất tuyệt vời cho các quản trị viên muốn sử dụng máy ảo cho các chức năng quản trị với tài khoản người dùng khác, các tư vấn viên muốn có một môi trường demo di động, hoặc các kiểm thử/nhà phát triển muốn có một phòng thí nghiệm địa phương hoặc di động.

Client Hyper-V có tất cả các yêu cầu giống như Windows Server 2012—thêm vào đó là một yêu cầu khác, và đó chính là điều đã gây ra sự nhầm lẫn đã đề cập ở trên. **Chuyển đổi địa chỉ cấp hai (SLAT)** là yêu cầu trên máy tính Windows 8 để kích hoạt Hyper-V. SLAT là một tính năng của bộ xử lý cho phép Hyper-V giảm tải việc ánh xạ bộ nhớ máy ảo vào bộ nhớ vật lý của máy chủ. Điều này làm giảm áp lực lên bộ xử lý của máy chủ và cải thiện hiệu suất bộ nhớ của máy ảo.

Intel gọi SLAT là **Bảng trang mở rộng (EPT)**, trong khi AMD gọi là **Chỉ số ảo hóa nhanh (RVI)**, trước đây được biết đến là **Bảng trang lồng nhau (NPT)**. Bên ngoài không gian máy chủ, SLAT là một tính năng tương đối mới. Ví dụ, các bộ xử lý Intel Core Duo không có EPT, nhưng các bộ xử lý Core i (như i5 và các phiên bản sau) thì có hỗ trợ.

Windows Server 2012 Hyper-V không yêu cầu SLAT, mặc dù một số blogger không chính xác có thể đã tuyên bố như vậy. Tuy nhiên, việc có các bộ xử lý máy chủ với SLAT sẽ cải thiện hiệu suất của các tác vụ nặng về bộ nhớ, như SQL Server hoặc các máy chủ phiên Remote Desktop Services. Lưu ý rằng SLAT đã có trên các bộ xử lý máy chủ từ khá lâu—ví dụ, trên Intel Xeon X5500 và các phiên bản sau.

---
