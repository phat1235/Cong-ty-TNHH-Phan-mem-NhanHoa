



# 1. RIP

RIP là một giao thức định tuyến theo kiểu **“distance-vector”**. **“Hop count”** được sử dụng làm **metric** cho việc chọn đường. Nếu có nhiều đường đến cùng một đích thì RIP sẽ chọn đường nào có số `hop-count` (số router đi qua) ít nhất. 

RIP hỗ trợ tính năng chia tải (load balancing) mặc định là 4 đường, tối đa 16 đường.

Nếu hop-count lớn hơn 15 thì các gói tin sẽ bị loại bỏ. Mặc định thời gian cập nhật định tuyến là 30 giây. Giá trị AD mặc định của RIP là 120. RIP có hai phiên bản là RIPv1 và RIPv2.



| Đặc điểm  | RIPv1 | RIPv2 |
|:-|:-|:-|
| Loại định tuyến | Classfull   |Classless       |
| Hỗ trợ VLSM và mạng không liên tục  | Không   | Có    |
| Gửi kèm Sbmask trong bản tin cập nhật định tuyến    | Không   | Có|
|Quảng bán thông tin định tuyến|Broadcast| Multicast|
|Hỗ trợ chứng thực|Không| Có|
|Hỗ trợ tóm tắt các tuyến thủ công|Không |Có|

### Mạng không liên tục (discontiguous network)

Mạng không liên tục là mạng mà trong đó các mạng con (subnet) của cùng một mạng lớn (major network: là mạng theo đúng lớp) bị ngăn cách bởi “major network” khác.

![Mạng không liên tục](https://img001.prntscr.com/file/img001/u6m-fjCfTYC647yTZGCFCA.png)

Hai mạng con của cùng một “major network” là 172.16.0.0 bị ngăn cách bởi một “major network” khác là 192.168.12.0 tạo nên mạng không liên tục.

### Cấu hình đinh tuyến định tuyến RIPv2

- **Khởi tạo tiến trình định tuyến RIP**  
  `Router(config)#router rip`
- **Bật chế độ RIPv2**  
  `Router(config-router)#version 2` *(sử dụng cho RIPv2)*
- **Chọn cổng tham gia vào quá trình trao đổi thông tin định tuyến**  
  `Router(config-router)#network <major-classful-network>`
- **Tắt tính năng tự động tóm tắt các tuyến**  
  `Router(config-router)#no auto-summary` *(sử dụng cho RIPv2)*

![Cấu hình RIP](https://img001.prntscr.com/file/img001/vIGtHz2eRESDVQamZ6rfkg.png)

### Chứng thực trong RIPv2

Chứng thực trong định tuyến là cách thức bảo mật trong việc trao đổi thông tin định tuyến giữa các router. Nếu có cấu hình chứng thực thì các router phải vượt qua quá trình này trước khi các thông tin trao đổi định tuyến được thực hiện. RIPv2 hỗ trợ hai kiểu chứng thực là: **“Plain text” và “MD5”**.

- **Chứng thực dạng “Plain Text”**: còn gọi là “Clear text”  
  Quá trình chứng thực chỉ đơn giản là các router được cấu hình một khóa (password) và trao đổi chúng để so khớp. Các khóa này được gửi dưới dạng không mã hóa trên đường truyền.

#### Các bước cấu hình:

1. **Tạo bộ khóa**  
   `Router(config)#key chain <name>`

2. **Tạo các khóa**  
   `Router(config-keychain)#key <key-id>`  
   `Router(config-keychain-key)#key-string <password>`

3. **Áp đặt vào cổng gửi chứng thực**  
   `Router(config)#interface <interface>`  
   `Router(config-if)#ip rip authentication key-chain <name>`

Ví dụ: cấu hình định tuyến RIPv2 chứng thực Cleartext

![Cấu hình chứng thực](https://img001.prntscr.com/file/img001/n8pf0BVZRIm8BN8PbFjaxw.png)

Ví dụ cấu hình trên router:

```
R1(config)#key chain newstar  
R1(config-keychain)#key 1  
R1(config-keychain-key)#key-string ccna  
R1(config)#interface S0/0/0  
R1(config-if)#ip rip authentication key-chain newstar

R2(config)#key chain newstar2  
R2(config-keychain)#key 1  
R2(config-keychain-key)#key-string ccna  
R2(config)#interface S0/0/0  
R2(config-if)#ip rip authentication key-chain newstar2
```


•**Chứng thực dạng MD5**

Dạng chứng thực này sẽ gửi thông tin về khóa đã được mã hóa giúp các thông tin trao đổi được an toàn hơn. Các bước cấu hình tương tự như dạng “Plain Text”, chỉ có khác ở bước 3 phải thêm 1 lệnh sau:

    Router (config-if)#ip rip authentication mode md5
Ví dụ: Sử dụng lại mô hình mạng trong ví dụ chứng thực dạng “Plain Text”, chúng ta sẽ cấu hình chứng thực định tuyến RIPv2 bằng MD5 với tên bộ khóa là “spkt” và mật khẩu là “123456” trên R1 và tên bộ khóa là “cntt” và mật khẩu là “123456” trên R2

    R1 (config) # key chain spkt
    R1 (config-keychain) #key 1
    R1 (config-keychain-key) #key-string 123456
    R1 (config)#interface S0/0/0
    R1 (config-if)#ip rip authentication mode md5
    R1 (config-if)#ip rip authentication key-chain spkt
`

    R2 (config) #key chain cntt
    R2 (config-keychain) #key
    R2 (config-keychain-key) #key-string 123456 R2 (config)#interface S0/0/0
    R2 (config-if)#ip rip authentication mode md5
    R2 (config-if)#ip rip authentication key-chain cntt
 Các lệnh kiểm tra cấu hình

    R#debug ip rip
    R#show ip route

