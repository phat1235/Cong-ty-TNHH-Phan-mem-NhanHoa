# Các bước cài đặt Zimbra trên Ubuntu

## Bước 1: Thiết lập cấu hình

### Thiết lập bản ghi DNS
Bạn hãy tạo sẵn bản ghi MX và bản ghi A

### Thiết lập file hosts
Mở file `/etc/hosts` và thêm vào các giá trị sau (thay `172.16.12.5` và `mail.nhanhoa2000.com` bằng thông tin của bạn):

```sh
172.16.12.5 mail.nhanhoa2000.com
```

### Thiết lập hostname
Thay `mail.nhanhoa2000.com` bằng tên miền của bạn:

```sh
hostnamectl set-hostname mail.nhanhoa2000.com
exec bash
```

> **Lưu ý:** Nếu bạn chưa cấu hình bản ghi MX, hãy cài đặt DNS Server để sử dụng.

## Bước 2: Cài đặt DNS server (dùng khi chưa trỏ DNS hoặc sử dụng local)

### Vô hiệu systemd-resolve
`systemd-resolve` dùng cổng 53, nên cần vô hiệu hoá trước khi cài dnsmasq:

```sh
systemctl disable systemd-resolved
systemctl stop systemd-resolved
```

### Gỡ symlink và tạo `resolv.conf`

```sh
rm /etc/resolv.conf
sh -c 'echo nameserver 8.8.8.8 >> /etc/resolv.conf'
```

### Cài đặt dnsmasq

```sh
apt install dnsmasq
```

### Cấu hình dnsmasq

Mở file cấu hình:

```sh
vi /etc/dnsmasq.conf
```

Thêm các dòng sau (thay `1.2.3.4` và `your_domain_name` bằng thông tin của bạn):

```sh
server=1.2.3.4
domain=your_domain_name
mx-host=your_domain_name, mail.your_domain_name, 5
mx-host=mail.your_domain_name, mail.your_domain_name, 5
listen-address=127.0.0.1
```

### Khởi động lại dnsmasq

```sh
systemctl restart dnsmasq
```

## Bước 3: Cài đặt Zimbra

Tải phần mềm về và cài đặt:

```sh
wget https://files.zimbra.com/downloads/8.8.15_GA/zcs-8.8.15_GA_4179.UBUNTU20_64.20211118033954.tgz
tar -xzvf zcs-8.8.15_GA_4179.UBUNTU20_64.20211118033954.tgz
cd zcs-8.8.15_GA_4179.UBUNTU20_64.20211118033954/
./install.sh
```
![](https://img001.prntscr.com/file/img001/VLqeMaKZRPSkqJfAK1GIVQ.png)
![](https://img001.prntscr.com/file/img001/aGz_ym8lSsu0Qn6B-enovA.png)
![](	https://img001.prntscr.com/file/img001/zhOPNiHmQlaN7OYbmHlXfg.png)
Khi cài đặt, chọn `N` để không cài hai dịch vụ sau:

```sh
zimbra-dnscache = N
zimbra-imapd (BETA – for evaluation only) = N
```
![](https://img001.prntscr.com/file/img001/PaexSgYQRMi6rtgFDwGEwQ.png)

Trong bước `Change domain name? [Yes]`, chọn `Yes` và nhập domain.

Tại `Main menu`, chọn phần có dấu `******`, các bước quan trọng:

- Chọn `6) zimbra-store`
- Thiết lập mật khẩu Admin bằng `4) Admin Password`
- Chọn `Select from menu, or press 'a' to apply config (? - help) a`, sau đó nhập `Yes`
![](https://img001.prntscr.com/file/img001/4IgDZKtCSTCgswKOw0FiFw.png)
![](https://img001.prntscr.com/file/img001/sAZD7_NySPyDVLNeAddsow.png)
![](https://img001.prntscr.com/file/img001/Y9EIjC_zQWK8FdT1x1VCdg.png)

Sau khi cài xong, nếu trạng thái máy chủ xanh ✅, cài đặt đã hoàn tất.

## Nếu không, chạy lại:

```sh
su - zimbra
zmcontrol restart
```
![](https://img001.prntscr.com/file/img001/GQVeXvk2QCuW8R4GefiP7g.png)
---
![](https://img001.prntscr.com/file/img001/Nu9lFUOfSY2fNEyiyUe89A.png)
---

![](https://img001.prntscr.com/file/img001/UOEzmu0yST6np_vgjIThJQ.png)
## Truy cập giao diện web:

- https://ip_server:7071
- https://mail.domain:7071
![](https://img001.prntscr.com/file/img001/zxp1HISiQpCaMt2-GPI-lQ.png)
## Bước 4: Thiết lập Zimbra sau cài đặt

Vào `Cấu Hình` → `Lớp dịch vụ` → `Sửa Default` → `Tuùy Chọn` → Chỉnh `Múi giờ` thành `+7`.

## Kết luận

Zimbra là hệ thống email mã nguồn mở mạnh mẽ, cung cấp giải pháp email và công tác toàn diện, bao gồm email, lịch, danh bạ, và nhiều tính năng khác.

