

### KẾT NỐI WebVirtCloud ĐẾN KVM
WebVirtCloud chạy ubuntu24 KVM chạy ubuntu 18.
- **Mở WebVirtCloud:** Truy cập `http://<server_IP>` bằng trình duyệt.
- **Cấu hình trên máy chủ KVM (Ubuntu):**  
Sau khi cấu hình máy chủ hypervisor, thực hiện các bước sau:

Với máy chủ Ubuntu18-24, chạy script có sẵn để cài đặt thêm supervisorctl 
```bash
LINK=https://raw.githubusercontent.com/cloudspinx/linux-bash-scripts/main/webvirtcloud/debian-ubuntu-kvm-prep.sh
wget -O - $LINK | sudo sh
```
Kiểm tra dịch vụ supervisor:
```bash
$ sudo supervisorctl status
gstfsd                           RUNNING   pid 16080, uptime 0:00:48
```
Dịch vụ libvirtd cũng phải đang chạy.
```bash
systemctl status libvirtd
```
- **Thêm kết nối:**
  - Cấp quyền truy cập TCP trên máy KVM:
    - Sửa file `/etc/libvirt/libvirtd.conf`:
      ```bash
      sudo nano /etc/libvirt/libvirtd.conf
      ```
      Bật các dòng sau:
      ```plaintext
      listen_tls = 0
      listen_tcp = 1
      auth_tcp = "none"
      ```
    - Sửa `libvirtd.service` để kích hoạt TCP:
      ```bash
      sudo nano /lib/systemd/system/libvirtd.service
      ```
      Thêm `-l` vào ExecStart:
      ```plaintext
      ExecStart=/usr/sbin/libvirtd --listen
      ```
    - Khởi động lại dịch vụ:
      ```bash
      sudo systemctl daemon-reload
      sudo systemctl restart libvirtd
      ```
