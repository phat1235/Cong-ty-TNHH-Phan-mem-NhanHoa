Để tạo máy ảo bằng `virt-install`, bạn có thể làm theo các bước dưới đây. `virt-install` là công cụ dòng lệnh giúp bạn tạo máy ảo dễ dàng trên KVM. Dưới đây là hướng dẫn chi tiết:

### Bước 1: Cài đặt các gói cần thiết

Trước tiên, hãy đảm bảo rằng bạn đã cài đặt các gói cần thiết cho KVM và `virt-install`. Bạn có thể cài đặt chúng bằng lệnh sau (trên Ubuntu):

```bash
sudo apt update
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst
```

### Bước 2: Kiểm tra trạng thái KVM

Kiểm tra xem KVM đã được cài đặt và đang chạy bằng lệnh:

```bash
sudo systemctl status libvirt-bin
```

### Bước 3: Tạo máy ảo

Sử dụng lệnh `virt-install` để tạo máy ảo. Dưới đây là một ví dụ lệnh tạo máy ảo Ubuntu:

```bash
sudo virt-install \
  --connect qemu:///system \
  --name kvm10 \
  --memory 1024 \
  --vcpus 1 \
  --disk path=/var/lib/libvirt/images/kvm10.img,size=10 \
  --cdrom /var/lib/libvirt/images/ubuntu-18.04.2-live-server-amd64.iso \
  --network network=default \
  --graphics vnc,listen='0.0.0.0'

```
![](https://img001.prntscr.com/file/img001/4KwK7-M2TcyribDVEzfLKg.png)
### Giải thích các tham số:

- `--name`: Tên của máy ảo.
- `--ram`: Dung lượng RAM (MB).
- `--vcpus`: Số lượng CPU ảo.
- `--disk`: Đường dẫn và kích thước ổ đĩa ảo (qcow2).
- `--os-type`: Loại hệ điều hành (linux).
- `--os-variant`: Biến thể hệ điều hành (ubuntu20.04).
- `--network`: Cấu hình mạng cho máy ảo (network=default).
- `--graphics`: Cấu hình đồ họa, ở đây sử dụng VNC.
- `--cdrom`: Đường dẫn đến file ISO cài đặt hệ điều hành.

### Bước 4: Kiểm tra máy ảo đã tạo

Sau khi lệnh `virt-install` chạy thành công, bạn có thể kiểm tra máy ảo đã được tạo hay chưa bằng lệnh:

```bash
virsh list --all
```
![](https://img001.prntscr.com/file/img001/iTwgSO-cReeOlm1Ug38CoA.png)

---


# Xoa may ao

![](https://img001.prntscr.com/file/img001/DYPeQxAHQSCWnwQzb0Ld1g.png)
# Thay đổi thông số máy ảo ram disk ...

3. Thay đổi dung lượng RAM:

   ```bash
   virsh setmem ubuntu-vm 4096 --config
   ```
4. Tăng kích thước ổ đĩa:

   ```bash
   qemu-img resize /var/lib/libvirt/images/ubuntu-vm.qcow2 +10G
   ```


![](https://img001.prntscr.com/file/img001/ne9vfAm_RN6iTbMsdo3BJg.png)

### Kiểm tra thông số máy ảo

Sau khi khởi động lại, bạn có thể kiểm tra các thông số của máy ảo bằng lệnh:

```bash
virsh dominfo <tên_máy_ảo>
