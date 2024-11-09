**Bước 6: Thêm Compute host**  
Trước khi thêm một hypervisor để quản lý, bạn cần cài đặt máy chủ ảo hóa.

Cài đặt ảo hóa KVM trên Ubuntu 24.04 (Noble Numbat).  
Cách cài đặt KVM trên các hệ điều hành Linux.

**Cấu hình trên máy chủ KVM (Ubuntu):**  
Sau khi cấu hình máy chủ hypervisor, thực hiện các bước sau:

Với máy chủ Ubuntu, chạy script có sẵn trong kho lưu trữ Github của chúng tôi.
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
pip3 install setuptools
**Tạo và sao chép SSH keys:**  
Chuyển sang người dùng `www-data` và tạo SSH key.
```bash
sudo mkdir -p /var/www/.ssh 
sudo chown -R www-data:www-data /var/www/.ssh
sudo -u www-data ssh-keygen
```
Sao chép SSH key sang máy chủ KVM.
```bash
ssh-copy-id -i /var/www/.ssh/id_rsa.pub user@kvmhostip
```
Ví dụ:
```bash
ssh-copy-id -i /var/www/.ssh/id_rsa.pub root@192.168.1.10
```
Để thêm một KVM host, vào **Computes -> SSH**.
