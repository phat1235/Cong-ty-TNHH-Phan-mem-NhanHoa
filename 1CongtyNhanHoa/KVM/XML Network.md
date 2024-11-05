Để tạo một mạng ảo (virtual network) trên KVM bằng `libvirt` với file XML, bạn có thể làm theo hướng dẫn sau:

### Bước 1: Tạo File XML Mạng Ảo

Dưới đây là một ví dụ về file XML để tạo một mạng ảo tên là `hotonly` với subnet `192.168.19.0/24`. Tạo một file `hotonly.xml` với nội dung sau:

![](https://img001.prntscr.com/file/img001/XMnFm7ffRi-mR8osQcuz9g.png)
```xml
<network>
  <name>hotonly</name>
  <uuid>08bcf54a-26ea-4cf0-941e-5543adc55286</uuid>
  <bridge name='virbr1' stp='on' delay='0'/>
  <mac address='52:54:00:ec:ad:17'/>
  <domain name='hotonly'/>
  <ip address='192.168.19.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.19.128' end='192.168.19.254'/>
    </dhcp>
  </ip>
</network>

```

Trong đó:
- `<name>my-network</name>`: Đặt tên cho mạng ảo.
- `<bridge name='virbr1' ... />`: Tạo bridge `virbr1` cho mạng này.
- `<ip address='192.168.19.1' netmask='255.255.255.0'>`: Đặt địa chỉ IP và subnet cho bridge.
- `<dhcp><range start='192.168.19.10' end='192.168.19.100'/></dhcp>`: Cấu hình DHCP

### Bước 2: Tạo Mạng Ảo Qua `virsh`

Sử dụng `virsh` để tạo và kích hoạt mạng ảo từ file XML vừa tạo:

1. **Tạo mạng**:
   ```bash
   sudo virsh net-define hotonly.xml
   ```

2. **Kích hoạt mạng**:
   ```bash
   sudo virsh net-start hotonly
   ```

3. **Thiết lập mạng tự động bật khi khởi động lại hệ thống**:
   ```bash
   sudo virsh net-autostart hotonly
   ```

### Bước 3: Kiểm tra Mạng Ảo

Bạn có thể kiểm tra mạng vừa tạo bằng lệnh:

```bash
sudo virsh net-list --all
```

Mạng `hotonly` sẽ hiển thị trong danh sách các mạng ảo đã được cấu hình. Bây giờ, bạn có thể cấu hình các máy ảo của mình để sử dụng mạng này thông qua bridge `virbr1`.

2. **Kiểm tra các bridge hiện có**:
   Kiểm tra các bridge trên hệ thống bằng lệnh:
   ```bash
   brctl show
   ```
   Hoặc:
   ```bash
   ip link show
   ```


### Bước 3: Xóa Mạng Cũ (Nếu Cần)

Nếu bạn đã định nghĩa một mạng nhưng không sử dụng nó, bạn có thể xóa nó:

```bash
sudo virsh net-destroy <name>
sudo virsh net-undefine <name>
```

Thay `<name>` bằng tên của mạng mà bạn muốn xóa.

### Bước 4: Tạo Lại Mạng Nếu Cần

Nếu bạn đã chỉnh sửa file XML hoặc muốn tạo lại một mạng mới, hãy làm theo các bước sau:

1. **Định nghĩa mạng**:
   ```bash
   sudo virsh net-define /etc/libvirt/qemu/networks/hotonly.xml
   ```

2. **Kích hoạt mạng**:
   ```bash
   sudo virsh net-start hotonly
   ```

3. **Thiết lập tự động khởi động**:
   ```bash
   sudo virsh net-autostart hotonly
   ```

### Lưu ý:
- Đảm bảo rằng bạn có quyền truy cập đầy đủ để thực hiện các lệnh này.
- Nếu bridge `br0` đã tồn tại nhưng bạn không cần nó nữa, bạn có thể xóa nó bằng cách sử dụng `brctl delbr br0` (cẩn thận với điều này vì nó sẽ làm mất kết nối mạng cho bất kỳ dịch vụ nào đang sử dụng bridge đó).
