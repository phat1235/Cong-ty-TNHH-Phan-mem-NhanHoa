# Giới Thiệu

ACL (Access Control List) là một danh sách các điều kiện được áp đặt vào các cổng của router để lọc các gói tin đi qua nó. Danh sách này chỉ ra cho router biết loại dữ liệu nào được cho phép (allow) và loại dữ liệu nào bị hủy bỏ (deny). Sự cho phép và huỷ bỏ này có thể được kiểm tra dựa vào địa chỉ nguồn, địa chỉ đích, giao thức hoặc chỉ số cổng.

Sử dụng ACL để quản lý các lưu lượng mạng, hỗ trợ ở mức độ **cơ bản** về bảo mật cho các truy cập mạng, thể hiện ở tính năng lọc các gói tin qua router.

# Phân Loại Và Hoạt Động Của ACL

## Phân Loại

ACL được chia thành 2 loại:

- **Standard ACL**
- **Extended ACL**

## Hoạt Động Của ACL

- ACL thực hiện việc kiểm tra theo trình tự của các điều kiện trong danh sách cấu hình. Nếu có một điều kiện được so khớp trong danh sách, nó sẽ thực hiện hành động tương ứng trong điều kiện đó, và các điều kiện còn lại sẽ không được kiểm tra nữa.
- Nếu tất cả các điều kiện trong danh sách đều không khớp, một câu lệnh mặc định `deny any` sẽ được thực hiện, nghĩa là điều kiện cuối cùng ngầm định trong một ACL là cấm tất cả. Do đó, trong cấu hình ACL cần phải có ít nhất một câu lệnh có hành động là `permit`.
- Khi gói tin đi vào một cổng, router sẽ kiểm tra xem có ACL nào được đặt trên cổng để kiểm tra hay không. Nếu có, các gói tin sẽ được kiểm tra với những điều kiện trong danh sách. Nếu gói tin đó được cho phép bởi ACL, nó sẽ tiếp tục được kiểm tra trong bảng định tuyến để quyết định chọn cổng ra để đi đến đích.
- Router sẽ kiểm tra xem trên cổng dữ liệu chuyển ra có đặt ACL hay không. Nếu không, gói tin đó có thể sẽ được gửi tới mạng đích. Nếu có ACL, nó sẽ kiểm tra với những điều kiện trong danh sách ACL đó.

# Cấu Hình ACL

Có 2 phương pháp cấu hình ACL:

- Dựa vào số (numbered ACL)
- Dựa vào tên (named ACL)

## Tổng Quan

Để cài đặt một ACL, thực hiện các bước sau:

1. **Tạo ACL**:
   - Xác định loại ACL dựa vào số hiệu ACL (numbered ACL) hoặc tên (named ACL).
   - Lựa chọn hành động cho từng điều kiện `permit` hay `deny` theo yêu cầu cụ thể.

2. **Gán ACL vào cổng của router**:
   - Các ACL được gán vào một hoặc nhiều cổng và có thể được lọc theo chiều các gói tin đi vào hay đi ra.
   - Một router với một ACL được đặt ở cổng dữ liệu vào phải kiểm tra mỗi gói tin để tìm xem nó có khớp các điều kiện trong danh sách ACL trước khi chuyển gói tin đó đến một cổng ra.

### Một Số Thuật Ngữ

- **Wildcard mask**: 
   - Có 32 bit, chia thành 4 phần, mỗi phần có 8 bit, là tham số dùng để xác định các bit nào sẽ được bỏ qua hay buộc phải so trùng trong việc kiểm tra điều kiện. 
   - Bit `1` trong “wildcard mask” có nghĩa là bỏ qua vị trí bit đó khi so sánh, và bit `0` xác định vị trí bit đó phải giống nhau.
   - Với Standard ACL, nếu không thêm `wildcard-mask` trong câu lệnh tạo ACL, mặc định `wildcard-mask` sẽ là `0.0.0.0`.
   - Mặc dù “Wildcard mask” có cấu trúc 32 bit giống với “Subnet mask” nhưng chúng hoạt động khác nhau. Các bit `0` và `1` trong một “Subnet mask” xác định phần “Network” và phần “Host” trong một địa chỉ IP. Các bit `0` và `1` trong một “wildcard-mask” xác định bit nào sẽ được kiểm tra hay bỏ qua cho mục đích điều khiển truy cập.

- **Wildcard "host"**: 
   - “Wildcard mask” dùng cho một thiết bị hay còn gọi là “wildcard-host” có dạng: `0.0.0.0` (kiểm tra tất cả các bit).
   - **Ví dụ**: `172.30.16.29 0.0.0.0`
   - **Ý nghĩa**: khi kiểm tra ACL, nó sẽ kiểm tra tất cả các bit trong địa chỉ dùng để so khớp.
   - “Wildcard mask” cho một thiết bị có thể được đại diện bằng từ khóa “host”.
   - **Ví dụ**:
     ```plaintext
     R(config) #access-list 1 permit host 172.30.16.29
     ```

- **Wildcard "any"**:
   - Wildcard mask cho tất cả các thiết bị được gọi là wildcard “any” có dạng: `255.255.255.255` (không kiểm tra tất cả các bit).
   - **Ý nghĩa**: chấp nhận tất cả các địa chỉ.
   - **Ví dụ**:
     ```plaintext
     R(config) #access-list 1 permit any
     ```

- **Inbound và Outbound**:
   - Khi áp dụng ACL trên một cổng, phải xác định ACL đó được dùng cho luồng dữ liệu vào (inbound) hay ra (outbound). Chiều của luồng dữ liệu được xác định trên cổng của router.

# Standard ACL

![](https://img001.prntscr.com/file/img001/R2bu_ab5RsqG0gzK8jxH7A.png)

Sử dụng “Standard ACL” khi ta muốn cấm hay cho phép tất cả các luồng dữ liệu từ một thiết bị hay một mạng xác định trên toàn bộ giao thức. “Standard ACL” kiểm tra điều kiện dựa vào địa chỉ nguồn trong các gói tin và thực hiện hành động cấm hoặc cho phép tất cả các lưu lượng từ một thiết bị hay một mạng xác định nào đó.

## Cấu Hình Standard ACL

```plaintext
Router(config)# access-list <ACL-number> {permit|deny} source [wildcard-mask]
```

- **ACL-number**: có giá trị từ `1 đến 99`, hoặc `1300-1999`.
- **Wildcard-mask**: nếu không được cấu hình sẽ lấy giá trị mặc định là `0.0.0.0`.

```plaintext
Router(config-if)# ip access-group <ACL-number> {in|out}
```

- Câu lệnh này có tác dụng gán ACL vào một cổng và đặt chế độ kiểm tra cho luồng dữ liệu đi vào hay đi ra khỏi cổng của router.
- Dùng lệnh `no ip access-group <ACL-number>` để không áp đặt ACL vào cổng (huỷ bỏ câu lệnh trên).

**Ví dụ 1**: Cấm các máy tính thuộc mạng `172.16.10.0/24` truy cập tới mạng `172.16.20.0/24`.

![](https://img001.prntscr.com/file/img001/wfRgvCvFQx-hS92nD3YIVw.png)

```plaintext
R2(config)# access-list 1 deny 172.16.10.0 0.0.0.255
R2(config)# access-list 1 permit any
R2(config)# interface fa0/0
R2(config-if)# ip access-group 1 out
```

**Ví dụ 2**: Cấm PC-X có địa chỉ `172.16.30.33/24` truy cập vào mạng `192.168.1.0/24`.

![](https://img001.prntscr.com/file/img001/in9i74Z6To6JKxrLHtJSLw.png)

```plaintext
R1(config)# access-list 10 deny host 172.16.30.33
R1(config)# access-list 10 permit any
R1(config)# interface fa0/1
R1(config-if)# ip access-group 10 out
```

**Ví dụ 3**: Sử dụng lại mô hình trong ví dụ 2, viết ACL chỉ cho phép máy Admin có IP `172.16.20.20` telnet vào các router R1, R2.

```plaintext
R(config)# access-list 20 permit host 172.16.20.20
R(config)# line vty 0 4
R(config-line)# access-class 20 in
```

## Dùng “Standard ACL” Để Điều Khiển Telnet

Trên router có các “virtual terminal port” được dùng để cấu hình cho mục đích cho phép telnet vào router. Telnet cũng là một cách thức cho phép người quản trị cấu hình hay theo dõi thiết bị từ xa. Ta có thể lọc các địa chỉ truy xuất vào các cổng này bằng “Standard ACL”.

### Cấu Hình

Thực hiện hai bước chính sau:

1. Chọn các thiết bị hoặc mạng được phép telnet vào các thiết bị dùng Standard ACL.
2. Gán ACL đã được cài đặt ở trên vào cổng telnet.

### Các Câu Lệnh Cấu Hình

```plaintext
Router(config)# line vty <vty-number|vty-range>
Router(config-line)# access-class <access-list-number> {in|out}
```

- **vty-number**: có giá trị `0 đến 4` (mặc định trên Router), hoặc `0 đến 15` (mặc định trên Switch).
- **vty-range**: là một dãy liên tiếp các port vty được sử dụng. Trong cấu hình ta sẽ cấu hình như sau

: `line vty 0 4` có nghĩa là các port vty từ `0 đến 4`.
- **in**: áp dụng cho các gói dữ liệu đi vào thiết bị.
- **out**: áp dụng cho các gói dữ liệu đi ra từ thiết bị.

```plaintext
Router(config)# access-list <access-list-number> permit <source>[wildcard-mask]
Router(config)# access-class <access-list-number> in
Router(config-line)# exit
Router(config)# line vty 0 4
Router(config-line)# login
Router(config-line)# password cisco
```

- Lệnh `access-list-number permit` để tạo ra các điều kiện cho phép các host có địa chỉ IP nguồn truy xuất telnet vào router, wildcard-mask có thể được bỏ qua.
- Lệnh `access-class` để chọn ACL nào sẽ được áp dụng trên port vty. Lưu ý là chỉ Standard ACL mới được cấu hình điều khiển truy cập telnet vào thiết bị.

# Extended ACL

![](https://img001.prntscr.com/file/img001/9ffuPzwqQSqkF86LroL5Ew.png)

Sử dụng Extended ACL để lọc các gói tin dựa trên nhiều tiêu chí hơn như:

- Giao thức (Protocol)
- Địa chỉ nguồn (Source Address)
- Địa chỉ đích (Destination Address)
- Cổng dịch vụ nguồn (Source port)
- Cổng dịch vụ đích (Destination port)

Extended ACL cho phép kiểm soát tốt hơn luồng dữ liệu vào/ra, do đó vị trí đặt Extended ACL nên gần nguồn của traffic muốn cấm. Ví dụ, khi áp dụng Extended ACL vào cổng, router có thể lọc tất cả các lưu lượng từ `192.168.10.0/24` gửi đến một web server `172.16.30.2/24`.

## Cấu Hình Extended ACL

```plaintext
Router(config)# access-list <ACL-number> {permit|deny} protocol source source-wildcard destination destination-wildcard [operator operand]
```

- **ACL-number**: có giá trị từ `100 đến 199`, hoặc `2000 đến 2699`.
- **Protocol**: giao thức sử dụng như IP, TCP, UDP, ICMP, GRE, v.v...
- **Source**: địa chỉ IP nguồn của thiết bị.
- **Source-wildcard**: wildcard mask cho địa chỉ IP nguồn.
- **Destination**: địa chỉ IP đích của thiết bị.
- **Destination-wildcard**: wildcard mask cho địa chỉ IP đích.
- **Operator**: so sánh với operand.
- **Operand**: một con số hoặc tên của cổng dịch vụ.

## Ví Dụ

![](https://img001.prntscr.com/file/img001/Zdpl2KYfSVCC-pfNvQqn3w.png)
**Ví dụ 1**: Cho phép host `192.168.1.10` truy cập vào server Web (HTTP) `172.16.20.2`.

```plaintext
R1(config)# access-list 101 permit tcp host 192.168.1.10 host 172.16.20.2 eq 80
R1(config)# interface fa0/0
R1(config-if)# ip access-group 101 in
```

![](https://img001.prntscr.com/file/img001/F7mZ0_nMSF-bwExULOJcRg.png)
**Ví dụ 2**: Cấm tất cả các máy tính thuộc mạng `192.168.10.0/24` truy cập vào mạng `172.16.30.0/24`, nhưng cho phép truy cập vào máy chủ `172.16.30.10` với dịch vụ web.

```plaintext
R1(config)# access-list 110 deny ip 192.168.10.0 0.0.0.255 172.16.30.0 0.0.0.255
R1(config)# access-list 110 permit tcp 192.168.10.0 0.0.0.255 host 172.16.30.10 eq 80
R1(config)# interface fa0/1
R1(config-if)# ip access-group 110 in
```

# Named ACL

Named ACL cho phép định danh ACL bằng tên thay vì số, giúp quản lý dễ dàng hơn. Được hỗ trợ trên các phiên bản Cisco IOS từ 11.2 trở lên.

## Cấu Hình

### Cấu Hình Named Standard ACL

```plaintext
Router(config)# ip access-list standard <name>
Router(config-std-nacl)# {permit|deny} source source-wildcard
```

- **name**: tên của ACL, tối đa 30 ký tự.
- **source**: địa chỉ IP nguồn.
- **source-wildcard**: wildcard mask cho địa chỉ IP nguồn.

**Ví dụ**:

```plaintext
R1(config)# ip access-list standard MY-STANDARD-ACL
R1(config-std-nacl)# permit 192.168.1.0 0.0.0.255
R1(config-std-nacl)# deny any
R1(config)# interface fa0/0
R1(config-if)# ip access-group MY-STANDARD-ACL in
```

### Cấu Hình Named Extended ACL

```plaintext
Router(config)# ip access-list extended <name>
Router(config-ext-nacl)# {permit|deny} protocol source source-wildcard destination destination-wildcard [operator operand]
```

- **name**: tên của ACL, tối đa 30 ký tự.
- **protocol**: giao thức sử dụng.
- **source**: địa chỉ IP nguồn.
- **source-wildcard**: wildcard mask cho địa chỉ IP nguồn.
- **destination**: địa chỉ IP đích.
- **destination-wildcard**: wildcard mask cho địa chỉ IP đích.
- **operator**: so sánh với operand.
- **operand**: một con số hoặc tên của cổng dịch vụ.

**Ví dụ**:

```plaintext
R1(config)# ip access-list extended MY-EXTENDED-ACL
R1(config-ext-nacl)# permit tcp 192.168.1.0 0.0.0.255 172.16.1.0 0.0.0.255 eq 80
R1(config-ext-nacl)# deny ip any any
R1(config)# interface fa0/1
R1(config-if)# ip access-group MY-EXTENDED-ACL in
```

# Kết Luận

ACL là một công cụ mạnh mẽ trong việc quản lý và kiểm soát lưu lượng mạng. Việc hiểu và cấu hình đúng ACL có thể giúp bảo mật hệ thống mạng, đảm bảo hiệu suất, và đáp ứng các yêu cầu cụ thể của tổ chức.

