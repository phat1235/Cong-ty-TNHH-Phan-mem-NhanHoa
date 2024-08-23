
<a name = “gioithieu”> </a>
# 1. GIỚI THIỆU
**Định tuyến** là chức năng của router giúp xác định đường đi cho các gói tin từ nguồn tới đích thông qua hệ thống mạng.
![](https://img001.prntscr.com/file/img001/uBjpdD2rQNyVUNqXXdckcQ.png)
**Router** dựa vào địa chỉ IP đích (destination IP) trong các gói tin và sử dụng bảng định tuyến (routing table) để xác định đường đi cho chúng.

![]( https://img001.prntscr.com/file/img001/yWDFL5RMSNm7LKargxsiPg.png)


Trong bảng định tuyến, mỗi mạng mà router có thể chuyển đi (mạng đích) thể hiện bằng một dòng. Mỗi mạng này có được có thể do chúng đang kết nối trực tiếp với router đang xét hay router học được thông qua việc cấu hình định tuyến.

<a name = “phanloai”> </a>
# 2. PHÂN LOẠI ĐỊNH TUYẾN

Có hai loại định tuyến: định tuyến tĩnh và định tuyến động.
• Định tuyến tĩnh
Định tuyến tĩnh là loại định tuyến mà trong đó router sử dụng các tuyến đường đi tĩnh để vận chuyển dữ liệu đi. Các tuyến đường đi tĩnh này có được do người quản trị cấu hình thủ công vào các router.
• Định tuyến động
Định tuyến động là loại định tuyến mà trong đó router sử dụng các tuyến đường đi động để vận chuyển dữ liệu đi. Các tuyến đường đi động này có được do các router sử dụng các giao thức định tuyến động trao đổi thông tin định tuyến với nhau tạo ra.
Một số giao thức định tuyến động phổ biến: RIP, OSPF, BGP,...

*Trong định tuyến động, người ta chia ra thành 2 loại: distance- vector và link-state*

![]( https://img001.prntscr.com/file/img001/OKcCBliLQfacAn60JlQ7ZQ.png)


Các router định tuyến loại “distance vector” thực hiện gửi định kỳ toàn bộ bảng định tuyến của mình và chỉ gửi cho các router láng giềng kết nối trực tiếp với mình.

Các router định tuyến theo dạng này không biết được đường đi đến đích một cách cụ thể, không biết về các router trung gian trên đường đi và cấu trúc kết nối giữa chúng.

Bảng định tuyến là nơi lưu kết quả chọn đường tốt nhất của mỗi router. Do đó, khi chúng trao đổi bảng định tuyến với nhau, các router chọn đường dựa trên kết quả đã chọn của router láng giềng. Mỗi router nhìn hệ thống mạng theo sự chi phối của các router láng giềng.
Các router định tuyến theo “distance vector” thực hiện cập nhật thông tin định tuyến theo định kỳ nên tốn nhiều băng thông đường truyền. Khi có sự thay đổi xảy ra, router nào nhận biết sự thay đổi đầu tiên sẽ cập nhật bảng định tuyến của mình trước rồi chuyển bảng định tuyến cập nhật cho các router láng giềng.

Giao thức định tuyến thuộc loại này: **RIP**
![]( https://img001.prntscr.com/file/img001/B_0WR2JyS9Wt5M_SDhBEbA.png)

Trong giao thức định loại link-state, các router sẽ trao đổi các LSA(link state advertisement) với nhau để duy trì  cơ sở dữ liệu về trạng thái các đường liên kết hay còn gọi là cơ sở dữ liệu về cấu trúc mạng (topology database). Các thông tin được trao đổi dưới dạng **multicast**

Do đó mỗi router đều có một cái nhìn đầy đủ và cụ thể về cấu trúc mạng của hệ thống. Từ đó sẽ áp dụng thuật toán SPF.

Khi đã hội tụ xong, nó sẽ không cập nhật định kỳ mà chỉ cập nhật khi nào có sự thay đổi xảy ra. **Do đó, thời gian hội tụ nhanh và ít tốn băng thông.**


Ngoài cách phân loại như trên, người ta còn chia giao thức định tuyến động theo 2 dạng:** “classful routing protocol” và “classless routing protocol"**


**Giao thức định tuyến dạng Classfull**

Các giao thức định tuyến nhóm classfull không quảng bá subnet- mask cùng với địa chỉ mạng quảng bá trong các gói tin cập nhật định tuyến. Do đó, khi router nhận được các cập nhật này, router phải lấy giá trị network-mask mặc định có cùng với địa chỉ lớp mạng của địa chỉ đích. Nếu địa chỉ mạng đó được kết nối trực tiếp với router, network-mask được lấy cùng với network-mask được cấu hình trên cổng kết nối đến mạng đó. Nếu địa chỉ mạng đích không nối trực tiếp, router sẽ lấy địa chỉ subnet-mask mặc định của địa chỉ mạng đích.

 
Các giao thức thuộc loại này không hỗ trợ mạng VLSM, tóm tắt các tuyến tự động.
Giao thức định tuyến thuộc dạng này: **RIPv1**.

**Giao thức định tuyến dạng Classless**

Các giao thức định tuyến thuộc nhóm classless sẽ quảng bá thông tin ‘subnet mask” cùng với địa chỉ mạng quảng bá trong các gói tin cập nhật định tuyến, hỗ trợ VLSM, cho phép tóm tắt các tuyến một cách thủ công. 

Các giao thức định tuyến thuộc dạng này: **RIPv2, OSPF, EIGRP**

 ### Hai tham số dùng trong định tuyến: `Metric và AD`

**Metric**

Là tham số được sử dụng để chọn đường tốt nhất cho việc định tuyến. Đây là giá trị mà bất kỳ giao thức định tuyến nào cũng phải dùng để tính toán đường đi đến mạng đích.

Trong trường hợp có nhiều đường đi đến một mạng đích thì đường đi nào có metric thấp nhất sẽ được lựa chọn để đưa vào bảng định tuyến. Mỗi giao thức định tuyến có một kiểu metric khác nhau.

**AD**

(Administrative Distance) là giá trị quy ước dùng để chỉ độ tin cậy của các giao thức định tuyến, giao thức nào có AD **nhỏ hơn** sẽ được xem là đáng tin cậy hơn. Trong trường hợp router học được một mạng đích thông qua nhiều giao thức định tuyến khác nhau, thì tuyến của giao thức định tuyến nào có AD nhỏ nhất thì sẽ được lựa chọn và đưa vào bảng định tuyến.

<a name = “staticroute”> </a>
# 3. ĐỊNH TUYẾN TĨNH
Trong cấu hình định tuyến tĩnh, người quản trị phải cấu hình thủ công chỉ ra đường đi đến tất cả các mạng đích trên các router trong hệ thống. Định tuyến tĩnh không có hoạt động gửi thông tin cập nhật như các giao thức định tuyến động.

**Lưu ý:** mặc định router sẽ biết được đường đi đến các mạng đích đang kết nối trực tiếp với nó.

Để cấu hình định tuyến tĩnh, chúng ta sử dụng cú pháp sau:

```Router (config) #ip route <destination-network> <subnet-mask> {next-hop-address | out-bound-interface>} [distance]```

**Trong đó:**

`Destination-network:` là địa chỉ mạng đích cần đi tới

`Subnet-mask:` Subnet mask của destination-network

`Next-hop-address:` địa chỉ IP của cổng trên router kế tiếp có kết nối trực tiếp với router đang xét.

`Out-bound-interface:` cổng của router sẽ gửi dữ liệu ra

`Distance:` thay đổi giá trị AD cho tuyến này. Mặc định các tuyến tĩnh có AD=1.

![]( https://img001.prntscr.com/file/img001/8op6c7IkRlipNzfnIcVUfA.png)


Nhận xét: Trong mô hình mạng đã cho có 3 mạng: 

`172.16.10.0/24, 192.168.12.0/24 và 172.16.20.0/24.`

Để hệ thống mạng liên thông với nhau thì trong bảng định tuyến của các router R1 và R2 phải có đường đi đến tất cả các mạng này.

Do mặc định các router biết được đường đi đến các mạng đang kết nối trực tiếp với nó nên:

Router R1: đã biết được đường đi đến 2 mạng đang kết nối trực tiếp là 172.16.10.0/24 và 192.168.12.0/24. Đối với mạng 172.16.20.0/24, chúng ta cấu hình định tuyến tĩnh như sau:

    
    R1 (config) #ip route  fa0/0 172.16.20.0 255.255.255.0
    Hoặc
    R1 (config)# ip route 192.168.12.2 172.16.20.0 255.255.255.0

Router R2: tương tự router R1, mặc định R2 biết được đường đi đến 2 mạng đang kết nối trực tiếp với nó là 192.168.12.0/24 và 172.16.20.0/24. Chúng ta cần chỉ ra đường đi đến mạng 172.16.10.0/24 bằng định tuyến tĩnh như sau:


    R2 (config) #ip route 172.16.10.0 255.255.255.0 fa0/0
    Hoặc
    R2 (config)#ip route 172.16.10.0 255.255.255.0 192.168.12.1


<a name = “defaultroute”> </a>
## 4. Default route

![]( https://img001.prntscr.com/file/img001/NOniG-RKQJ-0mw0wl_n46g.png)
Default route nằm ở cuối bảng định tuyến và được sử dụng để gửi các gói tin đi trong trường hợp mạng đích không tìm thấy trong bảng định tuyến. Nó rất hữu dụng trong các mạng dạng “stub network” như kết nối từ mạng nội bộ ra ngoài Internet.

