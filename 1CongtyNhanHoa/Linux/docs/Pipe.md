Bài viết này giới thiệu với các bạn về đường ống (Pipe), lọc (Filter) và chuyển hướng (Redirection) trên hệ điều hành Linux qua khái niệm và ví dụ dưới đây sẽ giúp cho các bạn có thể tự nghiên cứu và tự học Linux cơ bản một cách dễ dàng.

## 1. Đường ống (Pipe)
### 1.1. Giới thiệu về đường ống (pipe)
Đường ống (pipe) dùng để chuyển hướng trên hệ điều hành Linux, nó cho phép chúng ta sử dụng hai hoặc nhiều lệnh sao cho đầu ra của một lệnh đóng vai trò trực tiếp làm đầu vào của lệnh tiếp theo. Kết nối trực tiếp giữa các lệnh cho phép chúng hoạt động đồng thời và cho phép dữ liệu được truyền giữa chúng liên tục thay vì phải chuyển qua các tệp văn bản tạm thời hoặc qua màn hình hiển thị. Các đường ống là một chiều tức là luồng dữ liệu chuyển hướng từ trái sang phải qua đường ống.

`Biểu tượng | biểu thị một đường ống.`

Các đường ống (pipe) giúp chúng ta có thể kết hợp hai hoặc nhiều lệnh cùng lúc và chạy chúng liên tiếp. Cú pháp như sau:

`lệnh_1 | lệnh_2 | lệnh_3 | ... | lệnh_n`

Chúng ta thực hiện một số ví dụ bên dưới để dể hiểu hơn:

**Ví dụ 1: Sử dụng đường ống để kết hợp lệnh cat và lệnh less để xem một tệp có nhiều trang:**


Khi chúng ta sử dụng lệnh cat để xem tệp nhưng khi tệp có nhiều trang thì đầu ra sẽ nhanh chóng đến trang cuối cùng của tệp và chúng ta sẽ không thấy nội dung ở giữa.


```
[root@localhost ~]# cat /var/log/secure
May 25 07:57:04 localhost polkitd[6407]: Loading rules from directory /etc/polkit-1/rules.d
May 25 07:57:04 localhost polkitd[6407]: Loading rules from directory /usr/share/polkit-1/rules.d
May 25 07:57:04 localhost polkitd[6407]: Finished loading, compiling and executing 2 rules
May 25 07:57:04 localhost polkitd[6407]: Acquired the name org.freedesktop.PolicyKit1 on the system bus
May 25 07:57:10 localhost sshd[7155]: Server listening on 0.0.0.0 port 22.
May 25 07:57:10 localhost sshd[7155]: Server listening on :: port 22.
May 25 07:57:21 localhost sshd[7266]: Accepted password for root from 192.168.21.1 port 53093 ssh2
May 25 07:57:21 localhost sshd[7266]: pam_unix(sshd:session): session opened for user root by (uid=0)
```

**Để có thể xem toàn bộ nội dung tệp chúng ta có thể chuyển hướng đầu ra của lệnh cat thành less như sau:**
```
root@localhost ~]# cat /var/log/secure | less

May 24 00:22:43 localhost polkitd[6727]: Loading rules from directory /etc/polkit-1/rules.d
May 24 00:22:43 localhost polkitd[6727]: Loading rules from directory /usr/share/polkit-1/rules.d
May 24 00:22:43 localhost polkitd[6727]: Finished loading, compiling and executing 2 rules
May 24 00:22:43 localhost polkitd[6727]: Acquired the name org.freedesktop.PolicyKit1 on the system bus
May 24 00:22:48 localhost sshd[7289]: Server listening on 0.0.0.0 port 22.
May 24 00:22:48 localhost sshd[7289]: Server listening on :: port 22.
May 24 04:17:15 localhost sshd[7415]: Accepted password for root from 192.168.21.1 port 49728 ssh2
May 24 04:17:16 localhost sshd[7415]: pam_unix(sshd:session): session opened for user root by (uid=0)
May 24 04:18:07 localhost unix_chkpwd[7461]: password check failed for user (root)
...
```
**Ví dụ 2: Sử dụng lệnh sort kết hợp lệnh uniq để sắp xếp một tệp và in các giá trị duy nhất như sau:**

```
[root@localhost ~]# cat test.txt
apple
apple
apple
delay
delay
delay
nice
nice
rain
rain
safari
safari
[root@localhost ~]# cat test.txt | uniq
apple
delay
nice
rain
safari
```

**Ví dụ 3: Sử dụng head và tail để in các dòng trong một tệp.**

Lệnh này sẽ lấy 9 dòng đầu tiên của tệp /etc/passwd và từ 9 dòng trên chúng ta thực hiện lấy 4 dòng cuối cùng.

```
[root@localhost ~]# cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
operator:x:11:0:operator:/root:/sbin/nologin
games:x:12:100:games:/usr/games:/sbin/nologin
ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
nobody:x:99:99:Nobody:/:/sbin/nologin
systemd-bus-proxy:x:999:998:systemd Bus Proxy:/:/sbin/nologin
systemd-network:x:192:192:systemd Network Management:/:/sbin/nologin
dbus:x:81:81:System message bus:/:/sbin/nologin
polkitd:x:998:997:User for polkitd:/:/sbin/nologin
tss:x:59:59:Account used by the trousers package to sandbox the tcsd daemon:/dev/null:/sbin/nologin
sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
postfix:x:89:89::/var/spool/postfix:/sbin/nologin
chrony:x:997:995::/var/lib/chrony:/sbin/nologin
dang:x:1000:1000::/home/dang:/bin/bash
[root@localhost ~]# cat /etc/passwd | head -9 | tail -5
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
```

**Ví dụ 4: Sử dụng ls và find để liệt kê và in tất cả các dòng khớp trong một tệp.**
```
[root@localhost ~]#  ls -l | find ./ -type f -name "*.txt" -exec grep "network" {} \;
This is a example of network
The network
The               network
```
Lệnh trên sẽ giúp chúng ta chọn các tệp có phần mở rộng .txt trong thư mục hiện tại và tìm kiếm từ network trong các tệp có đuôi .txt và in nội dung những tệp đó.

**Ví dụ 5: Sử dụng lệnh `cat, grep, tee` và `wc` để thực hiện chọn từ apple trong file test.txt và lưu trữ chúng trong file2.txt và in tổng số dòng có từ khớp với apple.**
```
[root@localhost ~]# cat test.txt
apple
apple
apple
delay
delay
delay
nice
nice
rain
rain
safari
safari
[root@localhost ~]# cat test.txt | grep "apple" | tee file2.txt | wc -l
3
[root@localhost ~]# cat file2.txt
apple
apple
apple
```

