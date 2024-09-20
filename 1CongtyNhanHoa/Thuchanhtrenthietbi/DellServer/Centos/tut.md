Các bước cấu hình SSH trên Rockey Linux
### Hướng dẫn Cấu hình SSH trên CentOS/Rocky/AlmaLinux 7, 8, và 9

#### Yêu cầu
- Hệ thống CentOS, Rocky, hoặc AlmaLinux có quyền root.
---

```bash
sudo yum update
```
or

```bash
sudo dnf update
```

---

```bash
sudo systemctl status sshd
```

or

```bash
sudo systemctl enable sshd
sudo systemctl start sshd
```
---
```bash
sudo yum install firewalld
```

or

```bash
sudo dnf install firewalld
```



```bash
sudo systemctl enable firewalld
sudo systemctl start firewalld
```



```bash
sudo firewall-cmd --add-service=ssh --permanent
sudo firewall-cmd --reload
```
---

```bash
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
```



```bash
sudo vi /etc/ssh/sshd_config
```


```bash
Port 33556
```
---

```bash
sudo firewall-cmd --remove-service=ssh --permanent
```



```bash
sudo firewall-cmd --add-port=33556/tcp --permanent
```



```bash
sudo firewall-cmd --reload
```
---

```bash
sudo systemctl restart sshd
```
---
```bash
sudo ss -tulpn | grep ssh
```

Kết quả sẽ hiển thị cổng mới (ví dụ: 33556) trong cột "Local Address:Port".



