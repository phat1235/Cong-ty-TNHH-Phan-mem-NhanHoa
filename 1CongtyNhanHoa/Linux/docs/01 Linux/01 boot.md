## Kiến trúc của hệ điều hành Linux
![](https://img001.prntscr.com/file/img001/yQide0_GS4WJ93SNfT2T0Q.png)
## - Hạt nhân (Kernel):
 Là trung tâm điều khiển hệ điều hành Linux, chứa mã nguồn kiểm soát hệ thống.  
  - Có 2 phiên bản: phát triển mới nhất và ổn định mới nhất.  
  - Thiết kế dạng modul, chỉ tải phần cần thiết lên bộ nhớ, tiết kiệm tài nguyên.  
  - Hỗ trợ CPU Intel 80386, tận dụng khả năng quản lý bộ nhớ.  
  - **Swap space:** Lưu trữ dữ liệu tạm trên đĩa khi thiếu bộ nhớ.  
  - **Đặc tính:**  
    - Bảo vệ vùng nhớ giữa các tiến trình.  
    - Chỉ tải chương trình khi có yêu cầu.  
## Shell
Shell cung cấp tập lệnh cho người dùng thao tác với kernel để thực hiện công việc. Shell đọc các lệnh từ người dùng và xử lý. Ngoài ra shell còn cung cấp một số đặc tính khác như : chuyển
hướng xuất nhập, ngôn ngữ lệnh để tạo các tập tin lệnh tương tự tập tin bat trong DOS.

Có nhiều loại shell được dùng trong Linux. Điểm quan trọng để phân biệt các shell với nhau là bộ
lệnh của mỗi shell.

Ví dụ, C shell thì sử dụng các lệnh tương tự ngôn ngữ C, Bourne Shell thì
dùng ngôn ngữ lệnh khác.

Shell sử dụng chính trong Linux là GNU Bourne Again Shell (bash). Shell này là shell phát triển
từ Bourne Shell, là shell sử dụng chính trong các hệ thống Unix, với nhiều tính năng mới như :
điều khiển các tiến trình, các lệnh history, tên tập tin dài ...

## Đĩa cứng và phân vùng đĩa trong Linux
Đĩa cứng được phân ra nhiều vùng khác nhau gọi là partition. 

Mỗi partition sử dụng một hệ thống tập tin và lưu trữ dữ liệu. Mỗi đĩa bạn chỉ chia được tối đa 4 partition chính (primary). Giới hạn
như vậy là do Master Boot Record (MBR) của đĩa chỉ ghi tối đa 4 chỉ mục tới 4 partition.
Để tạo nhiều partition lưu trữ dữ liệu ( hơn 4) người ta dùng partition mở rộng (extended
partition). 

Thực ra partition mở rộng cũng là primary partition nhưng cho phép tạo các partition
con được gọi là logical partition trong nó.

GPT ra đời giải quyết vấn đề của MBR là tối đa chia 4 phân vùng. Hỗ trợ 128 Phân vùng

- **Quản lý ổ đĩa và phân vùng:**  
  - **Truy xuất ổ đĩa:** Thông qua tập tin trong `/dev/` (fd: ổ mềm, hd: ổ cứng, sd: ổ SCSI).  
  ![](https://img001.prntscr.com/file/img001/kFGIsQeiTiyRILE36AQPgA.png)
  - **Ký hiệu:**  
    - `hda`: Primary Master.  
    - `hdb`: Primary Slave.  
    - `hdc`: Secondary Master.  
    - `hdd`: Secondary Slave.  
    - `sda`, `sdb`: SCSI disks.  
    ![](https://img001.prntscr.com/file/img001/tHYUT2mhSlatHdP_KkxojQ.png)
  - **Partition:**  
    - **Primary/Extended:** Đánh số 1-4.  
    - **Logical:** Số từ 5 trở đi.  
- **Cấu hình bắt buộc:**  
  - Partition gốc (`/`): Chứa hệ điều hành.  
  - **Swap Partition:** Không gian hoán đổi, thường bằng kích thước RAM.  
  - 
## Khởi động hệ thống  
Các bước khởi động hệ thống:  
- Bước 1: Khi một máy PC bắt đầu khởi động, bộ vi xử lý sẽ tìm đến cuối vùng bộ nhớ hệ thống của BIOS và thực hiện các chỉ thị ở đó.  
- Bước 2: BIOS sẽ kiểm tra hệ thống, tìm và kiểm tra các thiết bị, đồng thời tìm kiếm đĩa chứa trình khởi động. Thông thường, BIOS sẽ kiểm tra ổ đĩa mềm hoặc CDROM xem có thể khởi động từ chúng được không, sau đó kiểm tra đĩa cứng. Thứ tự kiểm tra các ổ đĩa phụ thuộc vào cấu hình trong BIOS.  
- Bước 3: Khi kiểm tra ổ đĩa cứng, BIOS sẽ tìm đến MBR và nạp vào vùng nhớ hoạt động, chuyển quyền điều khiển cho nó.  
- Bước 4: MBR chứa các chỉ dẫn cho biết cách nạp trình quản lý khởi động GRUB/LILO cho Linux hoặc NTLDR cho Windows NT/2000. Sau khi nạp trình quản lý khởi động, MBR sẽ chuyển quyền điều khiển cho trình quản lý này.  
- Bước 5: Boot loader sẽ tìm kiếm boot partition và đọc thông tin cấu hình trong file grub.conf hoặc lilo.conf, hiển thị các hệ điều hành có sẵn trong hệ thống để cho phép người dùng lựa chọn kernel cần boot.  
Ví dụ về grub.conf:  
```
default=0  
timeout=10  
splashimage=(hd0,0)/grub/splash.xpm.gz  
title Fedora Core (2.6.8-1.521)  
root (hd0,0)  
kernel /vmlinuz-2.6.8-1.521 ro root=LABEL=/  
initrd /initrd-2.6.8-1.521.img  
title Windows 2000  
rootnoverify (hd0,1)  
chainloader +1  
```
- Bước 6: Sau khi chọn kernel boot từ file cấu hình của boot loader, hệ thống sẽ tự động nạp chương trình /sbin/init để kiểm tra hệ thống tập tin (file system check) rồi đọc file /etc/inittab để xác định mức hoạt động (runlevel). Các mức runlevel trong Linux:  

| Mode/Runlevel | Thư mục lưu script file (Directory) | Mô tả mode hoạt động |
|---------------|-------------------------------------|----------------------|
| 0             | /etc/rc.d/rc0.d                     | Mức shutdown hệ thống (halt) |
| 1             | /etc/rc.d/rc1.d                     | Dành cho một người dùng, thường dùng để sửa lỗi hệ thống tập tin (single user mode) |
| 2             | /etc/rc.d/rc2.d                     | Không sử dụng (user-definable) |
| 3             | /etc/rc.d/rc3.d                     | Dành cho nhiều người dùng, chỉ giao tiếp dưới dạng text (Full multi-user mode no GUI interface) |
| 4             | /etc/rc.d/rc4.d                     | Không sử dụng (user-definable) |
| 5             | /etc/rc.d/rc5.d                     | Dành cho nhiều người dùng và có thể cung cấp giao tiếp đồ họa (Full multi-user mode) |
| 6             | /etc/rc.d/rc6.d                     | Mức reboot hệ thống |

- Bước 7: Sau khi xác định runlevel (thông qua biến initdefault), chương trình /sbin/init sẽ thực thi các file startup script được đặt trong các thư mục con của thư mục /etc/rc.d. Script sử dụng runlevel 0-6 để xác định thư mục chứa file script chỉ định cho từng runlevel như: /etc/rc.d/rc0.d -> /etc/rc.d/rc6.d. Một số file script trong thư mục /etc/rc.d/rc3.d bao gồm:
```
K01yum K50snmptrapd S09isdn S40snortd S90mysql
K05innd K50tux S10network S44acpid S90xfs
K05saslauthd K50vsftpd S12syslog S55cups S95anacron
K15postgresql K54dovecot S13irqbalance S55named S95atd
K20nfs K70aep1000 S13portmap S55sshd S97messagebus
K24irda K70bcm5820 S14nfslock S56rawdevices S97rhnsd
K25squid K74ntpd S20random S56xinetd S99local
K34yppasswdd K74ypserv S24pcmcia S78mysqld S99webmin
K35smb K74ypxfrd S25netfs S80sendmail K35vncserver
K92iptables S26apmd S85gpm K35winbind S00microcode_ctl
S85httpd K50snmpd S05kudzu S40smartd S90crond
```
Các tập tin bắt đầu bằng từ khóa “S” sẽ được thực thi khi hệ thống khởi động, trong khi các tập tin bắt đầu bằng từ khóa “K” sẽ được thực thi khi hệ thống shutdown. Số theo sau các từ khóa này chỉ định thứ tự khởi động các script, tiếp theo là tên file script cho từng dịch vụ.  

- Bước 8: Nếu ở bước 4, runlevel 3 được chọn, hệ thống sẽ chạy chương trình login để yêu cầu đăng nhập cho từng user trước khi sử dụng hệ thống. 

Nếu runlevel 5 được chọn, hệ thống sẽ nạp ứng dụng giao diện đồ họa X terminal GUI để yêu cầu đăng nhập cho từng user.
