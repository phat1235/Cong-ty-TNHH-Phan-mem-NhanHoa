
Như ta đã biết, tại tầng **network** của mô hình OSI, chúng ta thường sử dụng các loại địa chỉ mang tính chất quy ước như **IP**, **IPX**... Các địa chỉ này là các địa chỉ có hướng, nghĩa là chúng được phân thành hai phần riêng biệt là phần địa chỉ **network** và phần địa chỉ **host**. Cách đánh số địa chỉ như vậy nhằm giúp cho việc tìm ra các đường kết nối từ hệ thống mạng này sang hệ thống mạng khác được dễ dàng hơn. Các địa chỉ này có thể được thay đổi theo tùy ý người sử dụng. 

Tuy nhiên, trên thực tế, các **card mạng** chỉ có thể kết nối với nhau theo địa chỉ **MAC** – địa chỉ cố định và duy nhất của phần cứng. 

Do vậy, ta cần có một phương pháp để chuyển đổi các dạng địa chỉ này qua lại với nhau. Từ đó, ta có giao thức phân giải địa chỉ: **Address Resolution Protocol (ARP)**.

### ARP là gì?

**ARP** là một protocol dựa trên nguyên tắc: Khi một thiết bị mạng **muốn biết địa chỉ MAC** của một thiết bị mạng nào đó mà nó đã biết địa chỉ ở tầng **network** (IP, IPX...), nó sẽ gửi một **ARP request** bao gồm địa chỉ **MAC address** của nó và địa chỉ **IP** của thiết bị mà nó cần biết **MAC address** trên toàn bộ một miền **broadcast**. Mỗi một thiết bị nhận được request này sẽ so sánh địa chỉ **IP** trong request với địa chỉ tầng **network** của mình. Nếu trùng địa chỉ thì thiết bị đó phải gửi ngược lại cho thiết bị gửi ARP request một packet (trong đó có chứa địa chỉ **MAC** của mình).

### Ví dụ về ARP trong mạng đơn giản

![](https://img001.prntscr.com/file/img001/F29DY8QcRFOW_IEaOITMPQ.png)

Trong một hệ thống mạng đơn giản như **hình 1.1**, 

Ví dụ như máy A muốn gửi packet đến máy B và nó chỉ biết được địa chỉ **IP** của máy B. 

Khi đó, máy A sẽ phải gửi một **ARP broadcast** cho toàn mạng để hỏi xem "địa chỉ MAC của máy có địa chỉ IP này là gì?"

Khi máy B nhận được broadcast này, nó sẽ so sánh địa chỉ **IP** trong packet này với địa chỉ **IP** của nó. Nhận thấy địa chỉ đó là địa chỉ của mình, máy B sẽ gửi lại một packet cho máy A trong đó có chứa địa chỉ **MAC** của B. Sau đó, máy A mới bắt đầu truyền packet cho B.


### ARP trong môi trường mạng phức tạp

Trong một môi trường phức tạp hơn, khi hai hệ thống mạng gắn với nhau thông qua một router C, máy A thuộc mạng A muốn gửi packet đến máy B thuộc mạng B. Do các **broadcast** không thể truyền qua router, nên khi đó máy A sẽ xem router C như một cầu nối để truyền dữ liệu. Trước đó, máy A sẽ biết được địa chỉ **IP** của router C (port X) và biết rằng để truyền packet tới B phải đi qua C. Tất cả các thông tin như vậy sẽ được chứa trong một bảng gọi là **bảng routing** (**routing table**). Bảng **routing table** theo cơ chế này được lưu giữ trong mỗi máy. **Routing table** chứa thông tin về các **gateway** để truy cập vào một hệ thống mạng nào đó. Ví dụ, trong trường hợp trên, trong bảng sẽ chỉ ra rằng để đi tới LAN B phải qua port X của router C. **Routing table** sẽ có chứa địa chỉ **IP** của port X.

Quá trình truyền dữ liệu theo từng bước sau:

- Máy A gửi một **ARP request** (broadcast) để tìm địa chỉ **MAC** của port X.
- Router C trả lời, cung cấp cho máy A địa chỉ **MAC** của port X.
- Máy A truyền packet đến port X của router.
- Router nhận được packet từ máy A, chuyển packet ra port Y của router. Trong packet có chứa địa chỉ **IP** của máy B.
- Router sẽ gửi **ARP request** để tìm địa chỉ **MAC** của máy B.
- Máy B sẽ trả lời cho router biết địa chỉ **MAC** của mình.
- Sau khi nhận được địa chỉ **MAC** của máy B, router C gửi packet của A đến B.

![](https://img001.prntscr.com/file/img001/sfMjqwROQ3eS6Fvl7MGaGA.png)


### Proxy ARP

Trên thực tế, ngoài dạng **routing table** này, người ta còn dùng phương pháp **proxy ARP**, trong đó có một thiết bị đảm nhận nhiệm vụ phân giải địa chỉ cho tất cả các thiết bị khác. Quá trình này được trình bày trong hình 1.3.

![](https://img001.prntscr.com/file/img001/oQz7Isr_RuuP_Ix6ZsKPNw.png)


Theo đó, các máy trạm không cần giữ bảng **routing table** nữa. **Router C** sẽ có nhiệm vụ thực hiện, trả lời tất cả các **ARP request** của tất cả các máy trong các mạng kết nối với nó. Router sẽ có một bảng **routing table** riêng biệt chứa tất cả các thông tin cần thiết để chuyển dữ liệu.

**Ví dụ bảng routing**
![](https://img001.prntscr.com/file/img001/u7CVRKcMSSGlVQOCyZfMVQ.png)

Trong bảng 1.2, dòng đầu tiên có nghĩa là tất cả các packet gửi cho một máy bất kỳ thuộc mạng **10.1.2.0 subnet mask 255.255.255.0** sẽ thông qua port **ethernet 0 (eth0)** có địa chỉ **IP** là **10.1.2.1**. **Flag = U** có nghĩa là port trong trạng thái hoạt động ("up").

![](https://img001.prntscr.com/file/img001/w8EmuO3nSZCkg2qG5T8L2Q.png)
