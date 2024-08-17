
# Dịch vụ DNS

## Giới thiệu về dịch vụ DNS

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

### Ví dụ tổng hợp

- **Tên miền đầy đủ**: `mail.support.example.com.`
  - **Root Domain**: `.`
  - **TLD**: `.com`
  - **SLD**: `example`
  - **Subdomains**: `support`, `mail`





