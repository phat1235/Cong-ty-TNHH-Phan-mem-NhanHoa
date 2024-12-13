
# Dịch vụ DNS

## Giới thiệu về dịch vụ DNS
– Domain Name System (DNS): phân giải tên miền thành địa chỉ IP và ngược lại- DNS sử dụng UDP/53 va TCP/53
+ UDP/53: port dùng để phục vụ các client để phân giải tên miền
+ TCP/53: port dùng để thực DNS zone transfer file giữa các DNS Server
– Các record cơ bản của DNS Server
+ Record A: phân giải tên miền sang IPv4
+ Record AAAA: phân giải tên miền sang IPv6
+ Record PTR: phân giải IP sang tên miền
+ Record NS: xác định DNS Server ở trong domain
+ Record MX: xác định Mail Server ở trong domain
+ Record CNAME: định nghĩa “bí danh” ứng với tên miền
+ Record SOA (Start of Authority): máy chủ có trách nhiệm với tên miền.

DNS (Domain Name System) là dịch vụ giúp chuyển đổi tên miền thành địa chỉ IP mà máy tính có thể hiểu, và ngược lại. Điều này giúp người dùng truy cập vào các dịch vụ và trang web qua các tên miền dễ nhớ.

### Phân loại máy chủ DNS

1. **Máy chủ DNS Chính (Primary DNS Server)**:
   - Chứa bản sao chính của dữ liệu DNS cho một khu vực (zone) cụ thể.
   - Ví dụ cấu hình máy chủ DNS chính (BIND):
     ```bash
     zone "example.com" {
         type master;
         file "/etc/bind/db.example.com";
     };
     ```

2. **Máy chủ DNS Phụ (Secondary DNS Server)**:
   - Cung cấp bản sao dự phòng của dữ liệu DNS từ máy chủ chính.
   - Ví dụ cấu hình máy chủ DNS phụ (BIND):
     ```bash
     zone "example.com" {
         type slave;
         file "/etc/bind/db.example.com";
         masters { 192.168.1.1; };  # Địa chỉ của máy chủ chính
     };
     ```





## Cấu trúc của một tên miền

Tên miền được phân cấp và đọc từ phải sang trái. Ví dụ: `www.example.com`:
- `com` (TLD - Top-Level Domain)
- `example` (Tên miền cấp 2)
- `www` (Tên miền cấp 3)

## Quá trình phân giải tên miền

Quá trình phân giải tên miền diễn ra qua các bước sau:

1. **Truy vấn từ Client**:
   - Ví dụ truy vấn DNS bằng `nslookup`:
     ```bash
     nslookup www.example.com
     ```

2. **Yêu cầu đến Recursive DNS Server**:
   - Recursive DNS server thực hiện việc giải quyết yêu cầu.

3. **Truy vấn đến Root DNS Server**:
   - Root DNS server trả về địa chỉ của TLD DNS server.

4. **Truy vấn đến TLD DNS Server**:
   - TLD DNS server trả về địa chỉ của Authoritative DNS server cho tên miền.

5. **Truy vấn đến Authoritative DNS Server**:
   - Authoritative DNS server trả về địa chỉ IP của tên miền.

6. **Lấy kết quả từ Authoritative DNS Server**:
   - Ví dụ cấu hình bản ghi DNS (BIND):
     ```bash
     zone "example.com" {
         type master;
         file "/etc/bind/db.example.com";
     };
     ```

7. **Trả kết quả về Client**:
   - Recursive DNS server trả địa chỉ IP cho client.

## Các bản ghi thường thấy trong DNS
### Ví dụ Bản Ghi SOA:

```bash
ns1.example.com. admin.example.com. (
    2024082301 ; Serial
    3600       ; Refresh
    1800       ; Retry
    1209600    ; Expire
    86400 )    ; Minimum TTL
```

#### Giải thích các thông số:

1. **`ns1.example.com.`**:
   - **Mô tả**: Đây là tên miền của máy chủ DNS chính (master DNS server) cho vùng DNS. Nó xác định máy chủ DNS chịu trách nhiệm chính cho việc quản lý các bản ghi trong vùng này.

2. **`admin.example.com.`**:
   - **Mô tả**: Đây là địa chỉ email của người quản trị vùng. Trong bản ghi SOA, ký tự `.` được thay thế bằng dấu `@` trong địa chỉ email. Do đó, `admin.example.com.` tương đương với `admin@example.com`. Đây là người liên hệ hoặc người quản lý hệ thống DNS cho vùng này.

3. **`2024082301` (Serial)**:
   - **Mô tả**: Đây là số sê-ri (serial number) của vùng DNS. Số sê-ri là một giá trị số nguyên tăng dần, dùng để thông báo cho các máy chủ DNS phụ (slave servers) rằng có sự thay đổi trong dữ liệu của vùng. Khi bạn cập nhật dữ liệu trong vùng, bạn phải tăng số sê-ri để các máy chủ phụ biết rằng cần phải tải lại dữ liệu. `YYYYMMDDNN`

4. **`3600` (Refresh)**:
   - **Mô tả**: Đây là thời gian (tính bằng giây) mà các máy chủ DNS phụ sẽ chờ trước khi kiểm tra lại với máy chủ chính để xem có cập nhật nào mới không. Trong ví dụ này, giá trị `3600` giây tương đương với 1 giờ.

5. **`1800` (Retry)**:
   - **Mô tả**: Đây là thời gian (tính bằng giây) mà các máy chủ DNS phụ sẽ chờ trước khi thử lại nếu lần kiểm tra lại với máy chủ chính không thành công. Trong ví dụ này, giá trị `1800` giây tương đương với 30 phút.

6. **`1209600` (Expire)**:
   - **Mô tả**: Đây là thời gian (tính bằng giây) mà các máy chủ DNS phụ sẽ giữ lại bản ghi của vùng nếu không thể liên lạc với máy chủ chính trong thời gian này. Nếu không có cập nhật từ máy chủ chính trong khoảng thời gian này, các máy chủ phụ sẽ xem như dữ liệu là hết hạn và không còn cung cấp dịch vụ phân giải cho vùng đó. Trong ví dụ này, giá trị `1209600` giây tương đương với 2 tuần.

7. **`86400` (Minimum TTL)**:
   - **Mô tả**: Đây là thời gian (tính bằng giây) mà các bản ghi trong vùng này có thể được lưu vào bộ nhớ `cache` của máy khách và máy chủ DNS khác. Thời gian này cũng được sử dụng khi không có TTL khác được chỉ định cho bản ghi cụ thể. Trong ví dụ này, giá trị `86400` giây tương đương với 1 ngày.
  

- **A Record**:
  ```bash
  www.example.com. IN A 192.168.1.1
  ```

- **AAAA Record**:
  ```bash
  ipv6.example.com. IN AAAA 2001:db8::1
  ```

- **CNAME Record**:
  ```bash
  mail.example.com. IN CNAME mailserver.example.com.
  ```

- **MX Record**:
  ```bash
  example.com. IN MX 10 mail.example.com.
  ```

- **TXT Record**:
  ```bash
  example.com. IN TXT "v=spf1 include:_spf.example.com ~all"
  ```

- **NS Record**:
  ```bash
  example.com. IN NS ns1.example.com.
  ```

- **SOA Record**:
  ```bash
  example.com. IN SOA ns1.example.com. admin.example.com. (
      2023081701 ; Serial
      3600       ; Refresh
      1800       ; Retry
      1209600    ; Expire
      86400      ; Minimum TTL
  )
  ```

## Các Zone trong DNS

- **Forward Zone**:
  - Lưu trữ bản ghi giúp chuyển đổi tên miền thành địa chỉ IP.
  - Ví dụ zone file (BIND):
    ```bash
    $TTL 86400
    @   IN  SOA  ns1.example.com. admin.example.com. (
        2023081701 ; Serial
        3600       ; Refresh
        1800       ; Retry
        1209600    ; Expire
        86400      ; Minimum TTL
    )
    @   IN  NS   ns1.example.com.
    @   IN  A    192.168.1.1
    www IN  A    192.168.1.1
    ```

- **Reverse Zone**:
  - Chuyển đổi địa chỉ IP thành tên miền.
  - Ví dụ zone file (BIND):
    ```bash
    $TTL 86400
    @   IN  SOA  ns1.example.com. admin.example.com. (
        2023081701 ; Serial
        3600       ; Refresh
        1800       ; Retry
        1209600    ; Expire
        86400      ; Minimum TTL
    )
    @   IN  NS   ns1.example.com.
    1   IN  PTR  www.example.com.
    ```

- **Primary Zone**:
  - Chứa bản sao chính của các bản ghi.

- **Secondary Zone**:
  - Chứa bản sao phụ của các bản ghi từ máy chủ chính.
  - 
  

Dưới đây là phần chi tiết về cấu trúc của một tên miền:

---

## Cấu trúc của một tên miền

Tên miền được chia thành các cấp độ khác nhau, mỗi cấp độ được phân cách bằng dấu chấm (.). Dưới đây là các cấp độ chính của một tên miền:

### Hình ảnh cấu trúc

![](https://img001.prntscr.com/file/img001/0hLufjGYRiehlfA0NiBfrA.png)

### 1. Root Domain (Tên miền gốc)

- **Mô tả**: Là cấp cao nhất trong cấu trúc tên miền. Trong hệ thống DNS, Root Domain không có tên cụ thể và thường được biểu diễn bằng một dấu chấm đơn lẻ ở cuối tên miền.
- **Ví dụ**: Trong tên miền `www.example.com.`, dấu chấm cuối cùng đại diện cho Root Domain.

### 2. Top-Level Domain (TLD - Tên miền cấp cao)

- **Mô tả**: Là phần ngay dưới Root Domain và bao gồm các tên miền cấp cao như `.com`, `.org`, `.net`, hoặc các tên miền quốc gia như `.vn`, `.jp`.
- **Ví dụ**: Trong `www.example.com.`, phần `.com` là TLD.

### 3. Second-Level Domain (SLD - Tên miền cấp hai)

- **Mô tả**: Là phần nằm ngay dưới TLD và thường được dùng để xác định tên của tổ chức hoặc dịch vụ cụ thể.
- **Ví dụ**: Trong `www.example.com.`, phần `.example` là SLD.

### 4. Subdomain (Tên miền phụ)

- **Mô tả**: Là phần bổ sung nằm trước Second-Level Domain và thường được dùng để phân loại các dịch vụ hoặc phần của tổ chức. Tên miền phụ có thể tiếp tục phân cấp.
- **Ví dụ**: Trong `www.example.com.`, phần `www` là một Subdomain. Các subdomains khác có thể là `mail.example.com` hoặc `shop.example.com`.

- ![](https://img001.prntscr.com/file/img001/ewrROjyxSWe8RDJzOqnphQ.png)

### Ví dụ tổng hợp

- **Tên miền đầy đủ**: `mail.support.example.com.`
  - **Root Domain**: `.`
  - **TLD**: `.com`
  - **SLD**: `example`
  - **Subdomains**: `support`, `mail`




