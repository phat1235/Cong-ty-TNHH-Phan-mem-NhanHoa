### Ta chuyển file iso lên máy , thì ta sẽ chuyển vào temp sau đo sẽ chuyển vào đường dẫn mog muốn

![](https://img001.prntscr.com/file/img001/3b2GzduwR9SCsDx4p2d6wA.png)

![](https://img001.prntscr.com/file/img001/qZZF6BNMQEOk0QRU7sH_9A.png)

---
![](https://img001.prntscr.com/file/img001/JhWHGUYtTEK9ZLYMEn-6qg.png)


### 3. Tạo Disk Image (Nếu Chưa Tạo)

Nếu bạn chưa tạo file hình ảnh đĩa (vd: `ubuntu18.04-10.qcow2`), bạn có thể tạo nó như sau:
![](https://img001.prntscr.com/file/img001/OLt50slnRJGkF8nilL68xA.png)
---
Chuyển định dạng raw sang qcow2 vì ở ảnh trên tạo nhầm
![](https://img001.prntscr.com/file/img001/M-1DCeFQRhubLV_naVRlfQ.png)

---
Dưới đây là nội dung file xml
![](https://img001.prntscr.com/file/img001/WFpJlAMwRhyIalGmaLbSew.png)

### 1. `<domain type='kvm'>`
- **`<domain>`**: Thẻ này định nghĩa một máy ảo (domain).
- **`type='kvm'`**: Chỉ định loại ảo hóa đang sử dụng. Ở đây là KVM (Kernel-based Virtual Machine).

### 2. `<name>ubuntu18.04-10</name>`
- **`<name>`**: Tên của máy ảo. Tên này được sử dụng để quản lý và truy cập máy ảo trong `virsh` hoặc `virt-manager`.

### 3. `<memory unit='KiB'>2097152</memory>` 
- **`<memory>`**: Dung lượng RAM mà máy ảo sử dụng, tính bằng kilobytes (KiB). 
- **`2097152`**: Tương đương với 2GB (2 * 1024 * 1024 KiB).

### 4. `<vcpu placement='static'>2</vcpu>`
- **`<vcpu>`**: Số lượng CPU ảo mà máy ảo sử dụng.
- **`placement='static'`**: Chỉ định rằng CPU sẽ được phân bổ tĩnh, không thay đổi trong suốt thời gian hoạt động của máy ảo.
- **`2`**: Máy ảo này sử dụng 2 CPU ảo.

### 5. `<os>`
- **`<os>`**: Thẻ chứa thông tin về hệ điều hành mà máy ảo sẽ chạy.

#### a. `<type arch='x86_64' machine='pc-i440fx-2.9'>hvm</type>`
- **`<type>`**: Chỉ định kiểu máy ảo. 
- **`arch='x86_64'`**: Kiến trúc CPU mà máy ảo sẽ chạy (64-bit).
- **`machine='pc-i440fx-2.9'`**: Chỉ định loại máy ảo. `pc-i440fx` là một loại phần cứng máy ảo.
- **`hvm`**: Chỉ định rằng máy ảo sẽ sử dụng ảo hóa phần cứng (Hardware Virtual Machine).

#### b. `<boot dev='hd'/>`
- **`<boot>`**: Chỉ định thứ tự khởi động của máy ảo.
- **`dev='hd'`**: Máy ảo sẽ khởi động từ ổ đĩa cứng.

#### c. `<boot dev='cdrom'/>`
- Cũng chỉ định rằng máy ảo có thể khởi động từ ổ đĩa CD-ROM, điều này hữu ích khi bạn muốn cài đặt hệ điều hành từ file ISO.

### 6. `<devices>`
- **`<devices>`**: Thẻ chứa các thiết bị được gán cho máy ảo.

#### a. `<disk type='file' device='disk'>`
- **`<disk>`**: Định nghĩa một ổ đĩa cho máy ảo.
- **`type='file'`**: Định nghĩa ổ đĩa là một file trên hệ thống.
- **`device='disk'`**: Chỉ định đây là một ổ đĩa (disk).

##### i. `<driver name='qemu' type='qcow2'/>`
- **`<driver>`**: Thông tin về driver đĩa.
- **`name='qemu'`**: Driver được sử dụng là QEMU.
- **`type='qcow2'`**: Định dạng của file hình ảnh ổ đĩa (ở đây là QCOW2).

##### ii. `<source file='/var/lib/libvirt/images/ubuntu18.04-10.qcow2'/>`
- **`<source>`**: Chỉ định đường dẫn đến file hình ảnh ổ đĩa.
- **`file='/var/lib/libvirt/images/ubuntu18.04-10.qcow2'`**: Đường dẫn đến file hình ảnh của ổ đĩa.

##### iii. `<target dev='vda' bus='virtio'/>`
- **`<target>`**: Định nghĩa cách mà ổ đĩa sẽ được gán cho máy ảo.
- **`dev='vda'`**: Tên thiết bị cho ổ đĩa.
- **`bus='virtio'`**: Sử dụng bus VirtIO để cải thiện hiệu suất.

##### iv. `<address type='pci' domain='0x0000' bus='0x00' slot='0x04' function='0x0'/>`
- **`<address>`**: Địa chỉ PCI cho ổ đĩa.
- **`type='pci'`**: Loại địa chỉ.
- Các thuộc tính `domain`, `bus`, `slot`, `function` xác định địa chỉ PCI cụ thể cho thiết bị.

#### b. Disk CD-ROM
- Tương tự như ổ đĩa chính, nhưng định nghĩa một ổ đĩa CD-ROM cho việc cài đặt hệ điều hành từ ISO.

```xml
<disk type='file' device='cdrom'>
  <driver name='qemu' type='raw'/>
  <source file='/var/lib/libvirt/images/ubuntu-18.04.2-live-server-amd64.iso'/>
  <target dev='hdc' bus='ide'/>
</disk>
```
- **`<driver name='qemu' type='raw'/>`**: Định dạng của file ISO là RAW.
- **`<target dev='hdc' bus='ide'/>`**: Gán cho bus IDE.

#### c. `<interface type='network'>`
- **`<interface>`**: Định nghĩa kết nối mạng cho máy ảo.
- **`type='network'`**: Kết nối mạng kiểu mạng ảo.

##### i. `<mac address='52:54:00:12:34:56'/>`
- **`<mac>`**: Địa chỉ MAC cho máy ảo.

##### ii. `<source network='default'/>`
- **`<source>`**: Chỉ định mạng ảo mà máy ảo sẽ kết nối tới. Ở đây là mạng mặc định.

##### iii. `<model type='virtio'/>`
- **`<model>`**: Chỉ định loại model mạng (VirtIO) để cải thiện hiệu suất.

### 7. `<graphics type='spice' autoport='yes'>`
- **`<graphics>`**: Định nghĩa cấu hình đồ họa cho máy ảo.
- **`type='spice'`**: Sử dụng giao thức SPICE để truy cập đồ họa máy ảo.
- **`autoport='yes'`**: Cho phép tự động gán cổng cho giao thức SPICE.

#### a. `<listen type='none'/>`
- **`<listen>`**: Cấu hình cổng lắng nghe cho giao thức SPICE. Ở đây không có cổng nào được lắng nghe.

---

Định nghĩa file xml 

![](https://img001.prntscr.com/file/img001/8aLI3KI6Sh6b30q_KFRTVA.png)

---
## Sau đó start
![](https://img001.prntscr.com/file/img001/ASkijdCYTFWhMiyNbIaEPg.png)

