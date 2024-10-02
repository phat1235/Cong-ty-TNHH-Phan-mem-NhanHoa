### Sử Dụng Snapshot Để Quản Lý Máy Ảo

Snapshots lưu giữ trạng thái và dữ liệu của một máy ảo tại thời điểm bạn chụp snapshot. Khi bạn tạo snapshot của một máy ảo, một ảnh của máy ảo ở trạng thái cụ thể sẽ được sao chép và lưu trữ. Snapshots rất hữu ích khi bạn muốn khôi phục máy ảo về trạng thái cũ nhiều lần mà không cần tạo ra nhiều máy ảo.

Bạn có thể chụp nhiều snapshot của một máy ảo để tạo các điểm khôi phục trong một quá trình tuyến tính. Với nhiều snapshot, bạn có thể lưu nhiều vị trí để phù hợp với nhiều quy trình làm việc khác nhau. Snapshots chỉ hoạt động trên từng máy ảo riêng lẻ. Để chụp snapshot của nhiều máy ảo, ví dụ như chụp snapshot của mỗi thành viên trong một nhóm, bạn phải chụp từng snapshot riêng cho từng máy ảo của mỗi thành viên.

Snapshots rất hữu ích như một giải pháp ngắn hạn để thử nghiệm phần mềm có thể gây hại hoặc có các tác động chưa biết. Ví dụ, bạn có thể sử dụng snapshot như một điểm khôi phục trong một quy trình tuần tự hoặc lặp lại, chẳng hạn như cài đặt các gói cập nhật, hoặc trong một quy trình phân nhánh như cài đặt các phiên bản khác nhau của một chương trình. Việc sử dụng snapshot đảm bảo rằng mỗi lần cài đặt đều bắt đầu từ một cấu hình ban đầu giống nhau.

Với snapshots, bạn có thể bảo toàn cấu hình ban đầu trước khi thực hiện các thay đổi đối với máy ảo. Nhiều thao tác tạo và quản lý snapshots cùng cây snapshot có sẵn trong vSphere Client. Các thao tác này cho phép bạn tạo snapshots, khôi phục bất kỳ snapshot nào trong cây phân cấp snapshots, xóa snapshots, và nhiều hơn nữa. Bạn có thể tạo các cây snapshot, nơi bạn lưu trạng thái máy ảo tại bất kỳ thời điểm nào để có thể khôi phục trạng thái đó sau này. Mỗi nhánh trong cây snapshot có thể chứa tối đa 32 snapshots.

Một snapshot lưu giữ các thông tin sau:
- **Cài đặt máy ảo:** Thư mục máy ảo, bao gồm các đĩa được thêm vào hoặc thay đổi sau khi bạn tạo snapshot.
- **Trạng thái nguồn điện:** Máy ảo có thể được bật, tắt, hoặc tạm ngưng.
- **Trạng thái ổ đĩa:** Trạng thái của tất cả các ổ đĩa ảo của máy ảo.
- **(Tùy chọn) Trạng thái bộ nhớ:** Nội dung của bộ nhớ máy ảo.

### Cấu Trúc Phân Cấp Snapshot
vSphere Client hiển thị cấu trúc phân cấp snapshot dưới dạng cây với một hoặc nhiều nhánh. Các snapshot trong phân cấp có mối quan hệ cha con. Trong các quy trình tuyến tính, mỗi snapshot có một snapshot cha và một snapshot con, trừ snapshot cuối cùng không có snapshot con. Mỗi snapshot cha có thể có nhiều snapshot con. Bạn có thể khôi phục snapshot cha hiện tại hoặc khôi phục bất kỳ snapshot cha hoặc con nào trong cây snapshot và tạo thêm snapshots từ snapshot đó. Mỗi lần bạn khôi phục snapshot và chụp một snapshot mới, một nhánh (snapshot con) sẽ được tạo ra.

### Snapshots Cha
Snapshot đầu tiên của máy ảo mà bạn tạo ra là snapshot cha cơ sở. Snapshot cha là phiên bản được lưu gần đây nhất của trạng thái hiện tại của máy ảo.

Khi chụp snapshot, một tệp đĩa delta được tạo cho mỗi đĩa được gắn với máy ảo và tùy chọn, một tệp bộ nhớ. Các tệp đĩa delta và tệp bộ nhớ được lưu cùng với tệp .vmdk cơ sở. Snapshot cha luôn là snapshot xuất hiện ngay phía trên biểu tượng "Bạn đang ở đây" (You are here) trong Snapshot Manager. Nếu bạn khôi phục hoặc phục hồi một snapshot, snapshot đó trở thành snapshot cha của trạng thái "Bạn đang ở đây" hiện tại.

**Lưu ý:** Snapshot cha không phải lúc nào cũng là snapshot bạn chụp gần đây nhất.

### Snapshots Con
Snapshot của một máy ảo được chụp sau snapshot cha. Mỗi snapshot con chứa các tệp delta cho mỗi ổ đĩa ảo được gắn, và tùy chọn một tệp bộ nhớ liên kết từ trạng thái hiện tại của ổ đĩa ảo (Bạn đang ở đây). Các tệp delta của snapshot con sẽ hợp nhất với mỗi snapshot con trước đó cho đến khi đến được các ổ đĩa cha. Một đĩa con sau đó có thể trở thành đĩa cha cho các đĩa con trong tương lai.

Quan hệ cha con của các snapshots có thể thay đổi nếu bạn có nhiều nhánh trong cây snapshot. Một snapshot cha có thể có nhiều snapshot con. Nhiều snapshots không có con.

**Cảnh báo:** Không được phép can thiệp thủ công vào các đĩa con riêng lẻ hoặc bất kỳ tệp cấu hình snapshot nào vì việc này có thể làm hỏng cây snapshot và gây mất dữ liệu. Điều này bao gồm việc thay đổi kích thước đĩa và chỉnh sửa đĩa cha cơ sở bằng cách sử dụng vmkfstools.


### Hành Vi Của Snapshot

Việc tạo snapshot bảo toàn trạng thái của đĩa tại một thời điểm cụ thể bằng cách tạo một loạt các đĩa delta cho mỗi đĩa ảo được gắn hoặc RDM ảo và tùy chọn bảo toàn trạng thái bộ nhớ và nguồn điện bằng cách tạo một tệp bộ nhớ. Việc tạo snapshot tạo ra một đối tượng snapshot trong **Snapshot Manager** đại diện cho trạng thái và cài đặt của máy ảo.

Mỗi snapshot tạo ra một tệp đĩa delta .vmdk bổ sung. Khi bạn tạo snapshot, cơ chế snapshot ngăn hệ điều hành khách ghi vào tệp .vmdk cơ sở và thay vào đó, chuyển tất cả các lệnh ghi vào tệp đĩa delta. Đĩa delta đại diện cho sự khác biệt giữa trạng thái hiện tại của đĩa ảo và trạng thái tại thời điểm bạn đã tạo snapshot trước đó. Nếu có nhiều snapshot, đĩa delta có thể đại diện cho sự khác biệt giữa mỗi snapshot. Các tệp đĩa delta có thể mở rộng nhanh chóng và trở nên lớn như toàn bộ đĩa ảo nếu hệ điều hành khách ghi vào mọi khối của đĩa ảo.

### Các Tệp Snapshot

Khi bạn tạo snapshot, bạn lưu trạng thái của cài đặt máy ảo và đĩa ảo. Nếu bạn đang chụp snapshot bộ nhớ, bạn cũng lưu trạng thái bộ nhớ của máy ảo. Các trạng thái này được lưu vào các tệp nằm cùng với các tệp cơ sở của máy ảo.

Một snapshot bao gồm các tệp được lưu trữ trên một thiết bị lưu trữ được hỗ trợ. Thao tác **Take Snapshot** tạo các tệp .vmdk, -delta.vmdk, .vmsd, và .vmsn. Theo mặc định, đĩa delta đầu tiên và tất cả các đĩa delta tiếp theo được lưu cùng với tệp .vmdk cơ sở. Các tệp .vmsd và .vmsn được lưu trong thư mục máy ảo.

- **Tệp đĩa delta:** Là tệp .vmdk mà hệ điều hành khách có thể ghi vào. Đĩa delta đại diện cho sự khác biệt giữa trạng thái hiện tại của đĩa ảo và trạng thái tại thời điểm snapshot trước đó được tạo. Khi bạn tạo snapshot, trạng thái của đĩa ảo được bảo toàn, hệ điều hành khách ngừng ghi vào nó và một đĩa delta hoặc đĩa con được tạo. Một đĩa delta có hai tệp: tệp mô tả nhỏ chứa thông tin về đĩa ảo, chẳng hạn như cấu trúc và thông tin mối quan hệ cha-con, và một tệp tương ứng chứa dữ liệu thô. Các tệp này được gọi là đĩa con hoặc nhật ký ghi lại.

- **Tệp phẳng (flat file):** Tệp -flat.vmdk là một trong hai tệp tạo thành đĩa cơ sở. Đĩa phẳng chứa dữ liệu thô của đĩa cơ sở. Tệp này không xuất hiện dưới dạng tệp riêng trong **Datastore Browser**.

- **Tệp cơ sở dữ liệu:** Tệp .vmsd chứa thông tin snapshot của máy ảo và là nguồn thông tin chính cho **Snapshot Manager**. Tệp này chứa các dòng thông tin, định nghĩa mối quan hệ giữa các snapshots và giữa các đĩa con cho mỗi snapshot.

- **Tệp bộ nhớ:** Tệp .vmsn chứa trạng thái bộ nhớ của máy ảo. Việc lưu trạng thái bộ nhớ của máy ảo cho phép bạn khôi phục lại máy ảo đang bật. Với snapshot không có bộ nhớ, bạn chỉ có thể khôi phục về trạng thái máy ảo đã tắt. Snapshot bộ nhớ mất nhiều thời gian hơn để tạo so với snapshot không có bộ nhớ. Thời gian mà máy chủ ESXi cần để ghi bộ nhớ vào đĩa phụ thuộc vào lượng bộ nhớ mà máy ảo được cấu hình sử dụng.

### Mô tả các tệp:

- **vmname-number.vmdk và vmname-number-delta.vmdk:** Tệp snapshot đại diện cho sự khác biệt giữa trạng thái hiện tại của đĩa ảo và trạng thái tại thời điểm snapshot trước đó được chụp. Tên tệp sử dụng cú pháp sau: `S1vm-000001.vmdk`, trong đó `S1vm` là tên máy ảo và số sáu chữ số `000001` dựa trên các tệp đã tồn tại trong thư mục. Con số này không tính đến số lượng đĩa được gắn với máy ảo.

- **vmname.vmsd:** Cơ sở dữ liệu thông tin snapshot của máy ảo và là nguồn thông tin chính cho **Snapshot Manager**.

- **vmname.Snapshotnumber.vmsn:** Trạng thái bộ nhớ của máy ảo tại thời điểm bạn chụp snapshot. Tên tệp sử dụng cú pháp sau: `S1vm.snapshot1.vmsn`, trong đó `S1vm` là tên máy ảo và `snapshot1` là snapshot đầu tiên.

**Lưu ý:** Một tệp .vmsn được tạo mỗi khi bạn chụp snapshot, bất kể lựa chọn bộ nhớ. Một tệp .vmsn không có bộ nhớ nhỏ hơn nhiều so với một tệp có bộ nhớ.

### Giới Hạn Của Snapshot

Snapshots có thể ảnh hưởng đến hiệu suất của máy ảo và không hỗ trợ một số loại đĩa hoặc các máy ảo được cấu hình với chia sẻ bus. Snapshots hữu ích cho các giải pháp ngắn hạn nhằm ghi lại trạng thái của máy ảo tại một thời điểm nhất định, nhưng không phù hợp cho việc sao lưu máy ảo dài hạn.

- VMware không hỗ trợ snapshots cho các đĩa thô, đĩa **RDM** ở chế độ vật lý hoặc các hệ điều hành khách sử dụng **iSCSI initiator**.
- Máy ảo có đĩa độc lập phải được tắt nguồn trước khi tạo snapshot. Snapshots của máy ảo đang bật hoặc bị tạm dừng với đĩa độc lập không được hỗ trợ.
- Snapshots đòi hỏi phải cài đặt **VMware Tools** và hệ điều hành khách phải hỗ trợ.
- Snapshots không được hỗ trợ với các thiết bị **PCI vSphere DirectPath I/O**.
- VMware không hỗ trợ snapshots của các máy ảo được cấu hình cho chia sẻ bus. Nếu cần chia sẻ bus, bạn nên chạy phần mềm sao lưu trong hệ điều hành khách như một giải pháp thay thế. Nếu máy ảo hiện tại có snapshots cản trở việc cấu hình chia sẻ bus, hãy xóa (hợp nhất) các snapshots.
- Snapshots cung cấp hình ảnh tại một thời điểm của đĩa mà các giải pháp sao lưu có thể sử dụng, nhưng snapshots không được thiết kế để trở thành phương pháp sao lưu và khôi phục mạnh mẽ. Nếu các tệp chứa máy ảo bị mất, các tệp snapshot cũng sẽ bị mất. Ngoài ra, nhiều snapshots rất khó quản lý, tiêu thụ nhiều không gian đĩa và không được bảo vệ trong trường hợp hỏng hóc phần cứng.
- Snapshots có thể ảnh hưởng tiêu cực đến hiệu suất của máy ảo. Mức độ suy giảm hiệu suất phụ thuộc vào thời gian snapshot hoặc cây snapshot tồn tại, độ sâu của cây, và mức độ thay đổi của máy ảo và hệ điều hành khách kể từ thời điểm snapshot được tạo. Bạn cũng có thể thấy độ trễ trong thời gian máy ảo khởi động. Không nên chạy các máy ảo sản xuất từ snapshots một cách lâu dài.
- Nếu máy ảo có đĩa cứng ảo lớn hơn 2 TB, các thao tác snapshot có thể mất nhiều thời gian hơn để hoàn thành.

### Quản Lý Snapshots

Bạn có thể xem tất cả các snapshots của máy ảo đang hoạt động và thao tác với chúng bằng cách sử dụng **Snapshot Manager**. 

Sau khi tạo snapshot, bạn có thể sử dụng lệnh **Revert to Latest Snapshot** từ menu chuột phải của máy ảo để khôi phục snapshot đó bất kỳ lúc nào. Nếu bạn có một chuỗi snapshots, bạn có thể sử dụng lệnh **Revert to** trong hộp thoại **Manage Snapshots** để khôi phục bất kỳ snapshot cha hoặc con nào. Các snapshot con tiếp theo mà bạn tạo từ snapshot được khôi phục sẽ tạo ra một nhánh trong cây snapshot. Bạn có thể xóa một snapshot khỏi cây trong **Snapshot Manager**.

Hộp thoại **Manage Snapshots** chứa một cây snapshot, vùng chi tiết, các nút lệnh và biểu tượng **You are here**.

- **Cây snapshot:** Hiển thị tất cả snapshots của máy ảo.
- **Biểu tượng You are here:** Đại diện cho trạng thái hiện tại và đang hoạt động của máy ảo. Biểu tượng **You are here** luôn được chọn và hiển thị khi bạn mở hộp thoại **Manage Snapshots**. Bạn có thể chọn trạng thái **You are here** để xem dung lượng mà nút này đang sử dụng. Các lệnh **Revert to** và **Delete** sẽ bị vô hiệu hóa cho trạng thái **You are here**.
- **Revert to, Delete, và Delete All:** Các tùy chọn thao tác với snapshot.
- **Chi tiết:** Hiển thị tên và mô tả của snapshot, ngày bạn tạo snapshot, và dung lượng đĩa. **Console** hiển thị trạng thái nguồn của máy ảo khi snapshot được tạo.
