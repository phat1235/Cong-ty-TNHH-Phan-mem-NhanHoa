### Phân Tích Đường Đi Gói Tin Khi Sử Dụng NAT trong KVM
![](https://img001.prntscr.com/file/img001/TG1tSz7bTSyURhYcmFQCpA.png)
Khi máy ảo (VM) sử dụng chế độ NAT (Network Address Translation) trong KVM, đường đi của gói tin từ máy ảo ra ngoài sẽ như sau:

1. **VM** gửi gói tin tới địa chỉ IP đích bên ngoài, thường là một địa chỉ trên Internet (ví dụ, `8.8.8.8`).
  
2. **Bridge NAT** (mặc định là `virbr0` do `libvirt` tạo ra) nhận gói tin từ máy ảo. `virbr0` đóng vai trò như một switch ảo trong KVM, kết nối VM với mạng của máy chủ.

3. **Máy Chủ Vật Lý**: Gói tin từ `virbr0` sau đó được gửi tới giao diện mạng của máy chủ vật lý, thường qua quy tắc NAT trong `iptables`. Tại đây, địa chỉ IP của VM sẽ được chuyển thành địa chỉ IP của máy chủ vật lý (giao diện ngoài).

4. **Internet**: Gói tin đã được NAT sẽ đi từ máy chủ vật lý tới router mạng và cuối cùng ra Internet.

### Layout Mô Tả Đường Đi Gói Tin trong Môi Trường NAT

Một layout đơn giản có thể mô tả như sau:

```
[VM: 192.168.122.10] --> [virbr0 (NAT Bridge)] --> [Host (External Interface: eth0)] --> [Internet Router] --> [Internet]
```
![](https://img001.prntscr.com/file/img001/E9OgcKMkQYqumDWFL0Cz2A.png)
### Làm Rõ Đường Đi Khi Sử Dụng NAT

- **NAT Bridge** (`virbr0`) cung cấp một lớp trung gian giữa VM và máy chủ vật lý.
- Địa chỉ IP của VM (trong mạng nội bộ `192.168.122.0/24`) được dịch thành địa chỉ IP của máy chủ trước khi gói tin ra ngoài.
- `iptables` với quy tắc NAT trên máy chủ giúp chuyển đổi và định tuyến các gói tin từ mạng nội bộ của VM ra ngoài.

![](https://img001.prntscr.com/file/img001/_JXqSID2SOOJg8UJ3QRMwQ.png)

## Quy tắc MASQUERADE trong POSTROUTING:

- Các quy tắc MASQUERADE được thiết lập để cho phép các gói tin từ mạng con 192.168.5.0/24 và 192.168.122.0/24 đi ra ngoài với địa chỉ IP nguồn được thay đổi (NAT).
- Quy tắc MASQUERADE cho phép các gói từ hai mạng nội bộ này có thể truy cập internet bằng cách thay đổi IP nguồn thành IP của cổng (gateway) đi ra ngoài.
- Phạm vi masq ports: 1024-65535 là các cổng nguồn tạm thời, dùng cho các kết nối TCP và UDP.
### Không Tạo `Bridge` Thì VM Có Đi Ra Ngoài Được Không?

Không, nếu không có bridge như `virbr0`, máy ảo sẽ không tự động có kết nối ra ngoài Internet vì:

- **Chế độ NAT yêu cầu bridge** để có thể thực hiện dịch địa chỉ và kết nối mạng giữa VM và máy chủ.
- **Không có bridge** cũng không có dịch vụ NAT, dẫn đến việc VM chỉ có thể giao tiếp với các thiết bị trong mạng nội bộ của nó (nếu có).

#### Thành Phần Cấp DHCP Cho VM

Trong chế độ NAT của `libvirt`, dịch vụ `dnsmasq` tích hợp sẵn sẽ cấp phát địa chỉ IP động (DHCP) cho VM, giúp VM nhận IP tự động trong dải `192.168.122.0/24` (hoặc dải khác nếu tùy chỉnh).

### Mối Quan Hệ giữa Switch Ảo và Card Mạng Thật

- **Switch Ảo** (như `virbr0`) trong KVM có chức năng như một cầu nối ảo giúp VM kết nối vào mạng vật lý.
- **Card Mạng Thật**: Khi có kết nối từ VM ra ngoài Internet, switch ảo này sử dụng card mạng thật của máy chủ để gửi dữ liệu ra bên ngoài.

### =>>>

- **Switch ảo** như `virbr0` là thành phần quan trọng trong chế độ NAT để kết nối VM và dịch địa chỉ IP.
- **Không có bridge** thì không có kết nối NAT và do đó không ra ngoài được.
- **Card mạng thật** là điểm cuối giúp gói tin ra ngoài sau khi qua bridge và NAT.

