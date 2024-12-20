## Khái niệm
– NFS ( Network File System ) là một giao thức dùng để chia sẻ file giữa các máy linux
– Các port NFS sử dụng
+ TCP/111 và UDP/111 – RPC 4.0 Port mapper
+ TCP/2049 và UDP/2049 – NFSD (NFS Server)

Chuẩn bị
– Sơ đồ bài lab
![](https://img001.prntscr.com/file/img001/lD-zzpE1SgihDPjrEKiWDg.png)
# Hướng dẫn cấu hình NFS Server trên U22

## 1. Cấu hình 2 card mạng cho NFS Server(1 cũng được)

### Tệp cấu hình mạng: `/etc/netplan/01-netcfg.yaml`
```yaml
network:
  ethernets:
    ens160:
      dhcp4: false
      addresses: [172.16.12.171/20]
      routes:
        - to: default
          via: 172.16.10.1
          metric: 100
      nameservers:
        addresses: [8.8.8.8]
      dhcp6: false
  version: 2

network:
  ethernets:
    ens192:
      dhcp4: false
      addresses: [192.168.1.40/24]
      nameservers:
        addresses: [192.168.1.10]
      dhcp6: false
  version: 2
```

## 2. Đổi hostname và timezone

### Thực hiện đổi hostname:
```bash
hostnamectl set-hostname nfs.nhanhoa2000.com
```

### Thay đổi múi giờ:
```bash
timedatectl set-timezone Asia/Ho_Chi_Minh
```

### Khởi động lại hệ thống:
```bash
reboot
```

## 3. Cài đặt và cấu hình NFS Server

### Cài đặt NFS Server
```bash
apt -y install nfs-kernel-server
```

### Cấu hình tệp `/etc/idmapd.conf`
- Mở tệp cấu hình:
```bash
vi /etc/idmapd.conf
```
- Sửa dòng 5:
```plaintext
Domain = nhanhoa2000.com
```

### Cấu hình tệp `/etc/exports`
- Thêm cấu hình chia sẻ NFS:
```bash
vi /etc/exports
```
- Nội dung ví dụ:
```plaintext
/home/nfsshare 192.168.1.0/24(rw,no_root_squash)
```

### Tạo thư mục chia sẻ NFS
```bash
mkdir /home/nfsshare
```

### Khởi động lại dịch vụ NFS
```bash
systemctl restart nfs-server
```

## 4. Tùy chọn cơ bản trong `/etc/exports`
- **rw**: Cho phép ghi và đọc.
- **ro**: Chỉ cho phép đọc.
- **sync**: Đảm bảo thay đổi được lưu trước khi phản hồi (mặc định).
- **async**: Phản hồi trước khi thay đổi được lưu.
- **secure**: Yêu cầu kết nối từ cổng nhỏ hơn 1024 (mặc định).
- **insecure**: Cho phép kết nối từ mọi cổng.
- **wdelay**: Trì hoãn thực hiện yêu cầu ghi nếu nghi ngờ yêu cầu ghi liên quan.
- **no_wdelay**: Tắt trì hoãn.
- **subtree_check**: Bật kiểm tra subtree (mặc định).
- **no_subtree_check**: Tắt kiểm tra subtree.
- **root_squash**: Chuyển uid/gid 0 thành người dùng ẩn danh.
- **no_root_squash**: Tắt root squashing.
- **all_squash**: Chuyển mọi uid/gid thành người dùng ẩn danh.
- **anonuid=UID**: Đặt UID cho người dùng ẩn danh.
- **anongid=GID**: Đặt GID cho người dùng ẩn danh.

## 5. Thêm bản ghi DNS
- Cấu hình DNS server để trỏ IP 192.168.1.10 tới `nfs.nhanhoa2000.com`.

### Thêm bản ghi trong tệp `/etc/bind/nhanhoa2000.com`
```plaintext
nfs     IN  A       192.168.1.40
```

### Thêm bản ghi PTR trong tệp `/etc/bind/1.168.192.db`
```plaintext
40      IN  PTR     nfs.nhanhoa2000.com.
```

### Khởi động lại dịch vụ BIND
```bash
systemctl restart named
```


![](https://img001.prntscr.com/file/img001/V-IItv4DRz-7yYD6Ah9bQg.png)


![](https://img001.prntscr.com/file/img001/6mNwvrXQTDSTt-XYz4S7og.png)
