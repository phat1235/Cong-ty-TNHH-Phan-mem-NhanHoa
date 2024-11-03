**KVM (Kernel-based Virtual Machine)** là một giải pháp ảo hóa mã nguồn mở đầy đủ cho các hệ thống Linux. KVM cung cấp khả năng ảo hóa nhờ sử dụng các mở rộng ảo hóa như Intel VT hoặc AMD-V. Khi cài đặt KVM trên một máy Linux bất kỳ, KVM sẽ biến hệ thống đó thành hypervisor bằng cách nạp các module nhân như `kvm-intel.ko` (cho máy sử dụng chip Intel) và `kvm-amd.ko` (cho máy sử dụng chip AMD).

KVM cho phép chúng ta cài đặt và chạy nhiều máy ảo (Windows & Linux). Chúng ta có thể tạo và quản lý các máy ảo dựa trên KVM thông qua giao diện đồ họa **virt-manager** hoặc các lệnh dòng lệnh như **virt-install** và **virsh**.
### Hướng dẫn cài đặt và cấu hình KVM trên Ubuntu 18.04 LTS

#### Bước 1: Xác minh hệ thống có hỗ trợ ảo hóa phần cứng
Chạy lệnh sau để kiểm tra xem hệ thống có hỗ trợ ảo hóa phần cứng hay không:
```bash
egrep -c '(vmx|svm)' /proc/cpuinfo
```

Nếu kết quả lớn hơn 0, hệ thống có hỗ trợ ảo hóa. Nếu không, khởi động lại hệ thống, vào BIOS và bật công nghệ VT.
![](https://img001.prntscr.com/file/img001/TdgMGjZRSO63QiErMEFSNQ.png)

Chạy lệnh **kvm-ok** để xác minh khả năng sử dụng KVM:
```bash
sudo kvm-ok
```

![](https://img001.prntscr.com/file/img001/1GEwOW6RS5uQtkGrAtXKlQ.png)

#### Bước 2: Cài đặt KVM và các gói cần thiết
Chạy các lệnh sau để cài đặt KVM và các gói phụ thuộc:
```bash
sudo apt update
sudo apt install qemu qemu-kvm libvirt-bin bridge-utils virt-manager
```
Sau khi cài đặt thành công, người dùng cục bộ sẽ được thêm vào nhóm **libvirtd**.

![](https://img001.prntscr.com/file/img001/gxddEIo-QJa7d1I9MAVoNw.png)

#### Bước 3: Khởi động và kích hoạt dịch vụ libvirtd
Khi cài đặt các gói **qemu** và **libvirtd** trên Ubuntu 18.04, dịch vụ **libvirtd** sẽ tự động được khởi động và kích hoạt. Nếu dịch vụ chưa khởi động, chạy lệnh sau:
```bash
sudo service libvirtd start
sudo update-rc.d libvirtd enable
```
Xác minh trạng thái dịch vụ libvirtd:
```bash
service libvirtd status
```


![](https://img001.prntscr.com/file/img001/ktl0NOQPRvKPZPpu3Q1dZQ.png)


#### Bước 4: Cấu hình Network Bridge cho máy ảo KVM
Network bridge cần thiết để các máy ảo KVM có thể truy cập bên ngoài hypervisor. Trên Ubuntu 18.04, mạng được quản lý bằng công cụ **netplan**. Thường file cấu hình netplan nằm trong **/etc/netplan/** và có tên là `50-cloud-init.yaml` hoặc `01-netcfg.yaml`.


Ví dụ cấu hình bridge:
```yaml
network:
  version: 2
  ethernets:
    ens33:
      dhcp4: no
      dhcp6: no

  bridges:
    br0:
      interfaces: [ens33]
      dhcp4: no
      addresses: [192.168.0.51/24]
      gateway4: 192.168.0.1
      nameservers:
        addresses: [192.168.0.1]
```
Sau đó, áp dụng thay đổi với lệnh:
```bash
sudo netplan apply
```
Xác minh trạng thái bridge bằng:
```bash
sudo networkctl status -a
ifconfig
```

Nhưng ở đây tôi không cấu hình vì tôi sẽ dùng default NAT của KVM
![](https://img001.prntscr.com/file/img001/4Nbd0M18ThOgl3KD8VMy9A.png)

Ta tiến hành copy file iso lên máy chủ lưu trữ ở đâu đó.
![](https://img001.prntscr.com/file/img001/Qr_deJ8-TMy1itSJiuCj5Q.png)
Vì cần có quyền truy cập root mà tôi không muốn làm điều đó nên tôi sẽ copy nó vào thư mục /tmp sau đó sẽ vào máy chủ để move vào vị trí lưu trữ iso cố định.
![](https://img001.prntscr.com/file/img001/d0Sdv9uSTmyEnt-cAoGn9w.png)




## Ta tiến hành tạo máy ảo từ file ISO vừa mới tải lên.

![](https://img001.prntscr.com/file/img001/Aev7UJ6pQKCpdDPSsOcxRg.png)

## Tôi đã tạo một thư mục mới chưa file iso để lúc cần thiết có thể lấy ở đó luôn.
![](https://img001.prntscr.com/file/img001/mppIsdjZSD27pVJz2VHCtw.png)
## Chọn thông số về RAM và CPU 
![](https://img001.prntscr.com/file/img001/1KkL70FdTxWNLKWTHeYjoQ.png)
## Chọn thông số về Disk và nó sẽ lưu mặc định ở /libvirt/images/....qcow2 hoặc .raw
![](https://img001.prntscr.com/file/img001/tUiJ3MV8TlG1OAshjXTVzg.png)
## Đặt tên cho máy ảo
![](https://img001.prntscr.com/file/img001/p09L4qGgTluZqgbFPlEDiA.png)

## Lựa chọn NIC ảo, thực chất ở đây tôi đã tạo 1 cái bridge br0 tới ens33, ta có thể chọn cái default mà libvirt tạo mặc định nhé, vẫn ra internet được!
![](https://img001.prntscr.com/file/img001/Ddiypbk4SW6B5IfSF_gmgw.png)

# Tiến hành cài đặt máy ảo.
![](https://img001.prntscr.com/file/img001/HPI9DymJRJOO4DEOGQxKZA.png)
# lệnh dưới để hiển thị các máy ảo đang có trên hệ thống, dù nó đang tắt hay đang mở.
![](https://img001.prntscr.com/file/img001/G2SGJ9M7Tgapi0jghW7Y5A.png)	
