# MỘT SỐ CÔNG CỤ QUẢN LÝ 

## ***Mục lục***

[1. Virt-manager ](#1)

- [1.1. Giới thiệu](#1.1)

- [1.2. Cài đặt](#1.2)

- [1.3. Cấu hình và quản lý máy ảo](#1.3)


[2. Virt - Virsh command tool](#3)

- [2.1. Giới thiệu](#3.1)

- [2.2. virsh command tool](#3.2)

- [2.3. virt command tool](#3.3)
---

<a name = "1"></a>
# 1. Virt-manager

<a name = "1.1"></a>
## 1.1. Giới thiệu

- **Virt-manager** là ứng dụng có giao diện đồ họa cho người dùng để quản lý các máy ảo thông qua các API của libvirt. 

-  Nó có thể quản lý các máy ảo KVM, Xen và LXC. Nó có thể hiển thị thông tin của các máy ảo, mạng ảo, interface… Tạo, xóa, bật, tắt và quản lý máy ảo, mạng áo thông quan giao diện đồ họa. 

<a name = "1.2"></a>
## 1.2. Cài đặt

- Để cài đặt virt-manager (trên host đã cài đặt libvirt) sử dụng câu lệnh sau:

`sudo apt-get install virt-manager -y`

- Sau khi cài đặt xong, sử dụng người dùng root hoặc người dùng trong nhóm libvirtd bật virt-manager bằng cách gõ lệnh

`virt-manager `

***(Nếu bạn sử dụng ubuntu server, hoàn toàn có thể sử dụng virt-manager thông qua SSH với chức năng X11 forwarding)***

- Giao diện chương trình virt-manger 

![](https://img001.prntscr.com/file/img001/iElr0OvhR4KRDizt9Bktaw.png)

## 1.3. Cấu hình và quản lý máy ảo

###	Quản lý máy ảo

##### Tạo Virtual machine:

- Download một file ISO hoặc image  OS mà bạn muốn cài đặt.

- Click vào **File** => **New virtual machine**

- Điền các thông số  cho máy ảo, rồi chọn **Forward**. Cuối cùng chọn Finish và click **Install virtual machine**.

#####	Làm việc với virtual machine:

  - Click vào virtual machine, một cửa sổ mới hiện ra với các thông số cấu hình cho máy ảo: Bạn có thể chọn và sửa cho từng thông số tùy ý mình:

![](https://img001.prntscr.com/file/img001/7ZOQc80yQF-TskDXwHDk7A.png)

  - Đồng thời có thể tùy chỉnh: Run, Pause, shutdown, reboot, forceoff, fullscreen hoặc console và một số thao tác tới máy ảo:

  - ***Lưu ý***: Các thông số của máy ảo chỉ có thể chỉnh sửa và có hiệu lực khi máy ảo đang tắt. Nếu VM đang chạy, chỉnh sửa có thể không có hiệu lực và gây ra lỗi.

  - Màn hình máy ảo được truy cập thông qua kết nối VNC. Khi đó chuột và bàn phím của bạn đang truy cập vào trong màn hình của máy ảo, để thoát ra ngoài máy host sử dụng tổ hợp Ctrl+Alt.

  - Xóa máy ảo hoặc tạo snapshot cho máy ảo: Chọn máy ảo cần thao tác và bấm chuột phải.

###	Quản lý mạng ảo

- Quản lý mạng ảo: trên màn hình chính của virt-manager : chọn **Edit** => **Connection details** => **Virtual network**

![](https://img001.prntscr.com/file/img001/BdpVu-EyTSeT128FzxHQIg.png)
- Tại đây có thể thêm, stop, start, xóa các mạng ảo như trong phần chế độ


<a name = "2"></a>

# 2. virt – virsh command tool

<a name = "3.1"></a>
## 2.1. Giới thiệu

- Là bộ công cụ dòng lệnh để tương tác với  libvirtd có hỗ trợ quản lý KVM. 

- Một số khác biệt giữa bộ dòng lệnh virt và virsh:

  -	virsh là bộ công cụ quản lý libvirtd đi kèm sẵn khi cài đặt libvirt-bin, còn bộ công cụ virt cần phải cài đặt riêng.

  -	Virsh không thể tương tác trực tiếp tới libvirtd để sử dụng tài nguyên mà chỉ có thể sử dụng tài nguyên hypervisor thông qua việc thực thi các file xml. Ngược lại, bộ công cụ virt với virt-install có thể triển khai trực tiếp máy ảo thông qua câu lệnh.

  -	Virsh có nhiều tùy chọn hơn dùng để quản lý (bật, tắt, sửa, xóa, …) các thành phần ảo hóa (máy ảo, mạng ảo, storage ảo, …) trong libvirt – tất nhiên thông qua tương tác với file xml.  Còn bộ công cụ virt tập trung chủ yếu vào quản lý các máy ảo.  

  -	Bộ công cụ virt có tùy chọn –c / --connect URI nên có thể quản lý libvirt server trên các host khác nhau, còn virsh chỉ quản lý trên local host. 

<a name = "3.2"></a>
## 2.2. virsh command tool 

-	Cấu trúc câu lệnh:

`virsh [OPTION]... <command> <domain> [ARG]...`

Các thành phần trong câu lệnh tìm hiểu thêm tại: http://manpages.ubuntu.com/manpages/xenial/man1/virsh.1.html 

-	Một số ví dụ thường dùng:

\- Liệt kê các máy ảo đang chạy: (liệt kê hết các máy ảo dù chạy hay không thêm tùy chọn –all):

  `virsh list`

\- Bật máy ảo:

  `virsh start <VM_name>`

\- Tự động bật máy ảo khi khởi động hệ thống: 

  `virsh autostart  <VM_name>`

\- Reboot máy ảo:

  `virsh reboot <VM_name>`

\- Lưu lại trạng thái đang hoạt động của máy ảo vào một file và sau này restore lại:

  `virsh save <VM_name>  <VM_name_time>.state # time tùy chọn để sau này dễ nhớ`

\- Để restore lại máy ảo vừa lưu: 

  `virsh restore <VM_name_time>.state`

\- Tắt máy ảo: 

  `virsh shutdown <VM_name>`

-	Để quản lý các thành phần ảo khác như mạng ảo, pool ảo, volumn ảo, … thì sẽ dùng với cú pháp chung như sau:

`virsh <object>-<command> <object_name>`

ví dụ:  sửa lại cấu hình cho mạng default: 

<img src = "http://imgur.com/uXXYAea.jpg">

-	Để console tới máy ảo: 

`virsh console <VM_name>`

Tham khảo thêm [tại đây](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Virtualization_Administration_Guide/chap-Virtualization_Administration_Guide-Managing_guests_with_virsh.html )

<a name = "3.3"></a>
## 2.3. virt command tool

Bộ câu lệnh virt gồm rất nhiều câu lệnh để quản lý máy ảo có hỗ trợ quản lý KVM như: **virt-install** (cài đặt máy ảo), **virt-viewer** (console tới máy ảo), **virt-log** (đọc log của máy ảo), **virt-xml** (dùng để sửa các cấu hình trong file xml), **virt-edit** (sửa cấu hình máy ảo), …

Tuy nhiên phần này chỉ trình bày **virt-install** và **virt-viewer**, các câu lệnh còn lại tham khảo thêm tại man page của ubuntu. 

#### **1) virt-install**

-	Là công cụ dòng lệnh dùng để tạo các máy ảo KVM, Xen, hoặc LXC sử dụng libvirt để quản lý hypervisor.

-	Hỗ trợ giao diện đồ họa cho máy ảo sử dụng VNC hoặc SPICE, cũng như là chế độ text thông qua console. Máy ảo có thể được cấu hình sử dụng một hoặc nhiều ổ đĩa ảo, nhiều interface mạng, physical USB, PCI devices, …

-	Cấu trúc câu lệnh: 

`virt-install [OPTION]... `    

Các OPTION tham khảo tại: http://manpages.ubuntu.com/manpages/xenial/man1/virt-install.1.html

-	Sau đây là một số ví dụ: 

  - Tạo máy ảo từ một image có sẵn :

```
virt-install \
              --connect qemu:///system \
              --name kvm1 \
              --memory 512 \
              --vcpus 1 \
              --disk /var/lib/libvirt/images/cirros. img \
              --import \
              --network network=default \
              --graphics vnc,listen='0.0.0.0'        
```

  - Tạo máy ảo từ file iso :

```
virt-install \
              --connect qemu:///system \
              --name kvm2 \
              --memory 1024 \
              --vcpus 1 \
              --disk /var/lib/libvirt/images/kvm2.img,size=10G #Tự tạo ra một image rỗng tên kvm2, kích thước 10G \
               --location /var/lib/libvirt/images/ubuntu-14.04.4-server-amd64.iso \
              --network network=default \
              --graphics vnc,listen='0.0.0.0'      
```

  - Tạo máy ảo từ Internet sử dụng netboot image:

```
virt-install \
              --connect qemu:///system \
              --name kvm3 \
              --ram 1024 \
              --vcpus 1 \
              --disk /var/lib/libvirt/images/kvm3.img,size=10G \
               --location http://vn.archive.ubuntu.com/ubuntu/dists/xenial/main/installer-i386/ \
              --network network=default \
              --graphics vnc,listen='0.0.0.0'     
```
 

#### **2) virt-viewer**

- Là công cụ thu nhỏ để biểu diễn console đồ họa một máy ảo. console được truy cập sử dụng VNC hoặc SPICE protocol.

-  Nếu máy ảo đang không hoạt động, virt-viewer sẽ thông báo chờ kết nối. 

<img src = "http://imgur.com/4ujUUor.jpg">

- Khi thành công, giao diện sẽ như sau:

<img src = "http://imgur.com/g7oGUfZ.jpg">


<a name = "4"></a>
