## Khái niệm
– NFS ( Network File System ) là một giao thức dùng để chia sẻ file giữa các máy linux
– Các port NFS sử dụng
+ TCP/111 và UDP/111 – RPC 4.0 Port mapper
+ TCP/2049 và UDP/2049 – NFSD (NFS Server)

Chuẩn bị
– Sơ đồ bài lab
![](https://img001.prntscr.com/file/img001/lD-zzpE1SgihDPjrEKiWDg.png)
### Hướng dẫn cấu hình và sử dụng NFS trên Ubuntu 22.04

#### 1. Cài đặt NFS Server
Hãy chắc chắn rằng bạn đã cài đặt và cấu hình NFS Server như hướng dẫn.

---

#### 2. Cấu hình 2 card mạng cho NFS Client
Kiểm tra và chỉnh sửa file cấu hình Netplan như sau:

```yaml
# /etc/netplan/01-netcfg.yaml
network:
  version: 2
  ethernets:
    ens33:
      dhcp4: false
      addresses: [172.16.12.173/20]
      routes:
        - to: default
          via: 172.16.10.1
          metric: 100
      nameservers:
        addresses: [8.8.8.8]
      dhcp6: false
    ens37:
      dhcp4: false
      addresses: [192.168.1.110/24]
      nameservers:
        addresses: [192.168.1.10]
      dhcp6: false
```

- **`ens33`**: Sử dụng Google DNS (`8.8.8.8`).
- **`ens37`**: Sử dụng DNS `192.168.1.10`.

**Áp dụng cấu hình:**
```bash
sudo netplan apply
```

---

#### 3. Đổi hostname và timezone
```bash
hostnamectl set-hostname client.nhanhoa2000.com
timedatectl set-timezone Asia/Ho_Chi_Minh
reboot
```

---

#### 4. Cấu hình DNS
```bash
echo "nameserver 192.168.1.10" > /etc/resolv.conf
host -t A nfs.nhanhoa2000.com
```
Kiểm tra truy vấn DNS:
```bash
nfs.nhanhoa2000.com has address 192.168.1.40
```

---

#### 5. Cài đặt và cấu hình NFS Client

##### 5.1 Cài đặt NFS Client
```bash
apt -y install nfs-common
```

##### 5.2 Chỉnh sửa file `/etc/idmapd.conf`
Tìm và bỏ comment dòng `Domain`, sau đó chỉnh sửa như sau:
```bash
Domain = nhanhoa2000.com
```

---

#### 6. Mount NFS Share

##### 6.1 Mount thủ công
Mount thư mục được chia sẻ trên NFS Server vào thư mục `/mnt`:
```bash
mount -t nfs nfs.nhanhoa2000.com:/mnt/nfs /mnt
df -hT
```

**Kết quả:**
```plaintext
Filesystem                            Type   Size  Used Avail Use% Mounted on
nfs.nhanhoa2000.com:/home/nfsshare nfs4   9.8G  3.4G  5.9G  37% /mnt
```

##### 6.2 Mount với NFSv3
```bash
mount -t nfs -o vers=3 nfs.nhanhoa2000.com:/home/nfsshare /mnt
```

---

#### 7. Tự động mount khi khởi động

##### 7.1 Sửa file `/etc/fstab`
Thêm dòng sau vào cuối file:
```plaintext
nfs.nhanhoa2000.com:/home/nfsshare /mnt nfs defaults 0 0
```

##### 7.2 Mount động với AutoFS
Cài đặt và cấu hình AutoFS:
```bash
apt -y install autofs
```

Sửa file `/etc/auto.master`, thêm dòng sau:
```plaintext
/-    /etc/auto.mount
```

Tạo file `/etc/auto.mount`:
```plaintext
/mnt   -fstype=nfs,rw  nfs.nhanhoa2000.com:/home/nfsshare
```

Khởi động lại AutoFS:
```bash
systemctl restart autofs
```

**Kiểm tra:**
```bash
cd /mnt
df -h /mnt
```

---

#### 8. Quản lý ACL (Access Control List) trên NFSv4

##### 8.1 Cài đặt công cụ NFSv4 ACL Tools
```bash
apt -y install nfs4-acl-tools
```

##### 8.2 Kiểm tra ACL
Hiển thị ACL của file hoặc thư mục:
```bash
nfs4_getfacl /mnt/testfile.txt
```

##### 8.3 Thêm quyền cho user
Thêm quyền đọc và thực thi cho user `ubuntu`:
```bash
nfs4_setfacl -a A::ubuntu@nhanhoa2000.com:rxtncy /mnt/testfile.txt
```

Kiểm tra lại:
```bash
nfs4_getfacl /mnt/testfile.txt
```

##### 8.4 Xóa quyền của user
```bash
nfs4_setfacl -x A::1000:rxtcy /mnt/testfile.txt
```

##### 8.5 Sửa ACL trực tiếp
```bash
nfs4_setfacl -e /mnt/testfile.txt
```

##### 8.6 Thêm hoặc thay thế ACL từ file
Tạo file ACL:
```plaintext
A::ubuntu@nhanhoa2000.com:RX
A::root@nhanhoa2000.com:RWX
```

Thêm ACL từ file:
```bash
nfs4_setfacl -A acl.txt /mnt/testfile.txt
```

Thay thế ACL từ file:
```bash
nfs4_setfacl -S acl2.txt /mnt/testfile.txt
```

---

#### 9. Tổng kết
Ta đã thiết lập thành công NFS Client với các bước:
1. Cấu hình card mạng.
2. Đặt hostname và timezone.
3. Cài đặt và sử dụng AutoFS.
4. Quản lý quyền truy cập với NFSv4 ACL.
