 ### 1. Reset Password switch Cisco


- Trường hợp 1: Nếu bạn muốn cấu hình lại thiết bị Switch từ một sw đã có cấu hình rồi, nhưng lại không có mật khẩu để vào switch;  ta muốn xóa cả file config

- Trường hợp 2: Quyên mật khẩu switch ta muốn đặt lại pass nhưng không muốn mất cấu hình cũ trong switch.

Không như router, đặt lại mật khẩu cho switch khác hẳn. Sau đây Lab sẽ hướng dẫn các bước để giải quyết các trường hợp trên.

Nguyên lý:

– Khi ta boot switch vào chế độ ROM bằng cách giữ nút MODE

– Thay đổi tên file lưu trữ cấu hình trong flash là config.text sang tên khác ví dụ như config.cu

– Boot switch vào chế độ bình thường, vào chế độ Privilige và copy nội dung file cấu hình config.cu sang RAM

– Thay đổi Password rồi ghi lại vào nvram
(nếu là áp dụng cho trường hợp 1 thì không cần 2 bước sau)

Yêu cầu:

B1:- Bạn kết nối Switch với PC qua cổng Console hoặc qua USB
– Trên PC có cài đặt phần mềm để kết nối dòng lệnh giống như Putty hoặc
SecureCRT…

B2:- Bạn bật nguồn, trong khi đó, ta nhấn giữ nút MODE

Thực hiện lab:

Bước 1 – Tay nhấn vào nút MODE và tiến hành bật nguồn switch, giữ nút trong vòng khoảng 15s và thả ra

![](https://img001.prntscr.com/file/img001/BB3HBgJJRaq-MN4UWqWuIQ.png)

Bước 2 –Ta sẽ nhìn thấy Switch hiển thị các thông tin trong chế độ ROM như sau:

```Boot Sector Filesystem (bs) installed, fsid: 2
Base ethernet MAC Address: 00:14:f2:d2:41:80
Xmodem file system is available.
The password-recovery mechanism is enabled.

The system has been interrupted prior to initializing the
flash filesystem. The following commands will initialize
the flash filesystem, and finish loading the operating
system software:

flash_init
load_helper
boot
switch:
```
Bước 3 – ta nhập lệnh flash_init để nhận thiết bị flash
```
switch:flash_init
Initializing Flash…
flashfs[0]: 5 files, 1 directories
flashfs[0]: 0 orphaned files, 0 orphaned directories
flashfs[0]: Total bytes: 15998976
flashfs[0]: Bytes used: 12282368
flashfs[0]: Bytes available: 3716608
flashfs[0]: flashfs fsck took 10 seconds.
…done Initializing Flash.
switch:
```
![](https://img001.prntscr.com/file/img001/kgff92FzTw-qkPGfhKu4Kw.png)
Bước 4 – Xem nội dung flash, mặc định file cấu hình của switch được lưu với tên config.text;
```
switch:dir flash:
Directory of flash:/
1 -rwx 10573494 c3560-advipservicesk9-mz.122-44.SE6.bin
2 -rwx 684 vlan.dat
3 -rwx 1938 private-config.text
4 -rwx 1654 config.text
5 -rwx 3096 multiple-fs

3716608 bytes available (10508886 bytes used)
switch:
```
![](https://img001.prntscr.com/file/img001/KRwfQiUFTgmFDZwsf0LCpA.png)
Bước 5: Nếu ta muốn xóa cả file cấu hình config.text này luôn thì bạn gõ lệnh
```
delete flash:config.text
```
Còn nếu muốn chỉ thay mật khẩu mà giữ lại các cấu hình khác thì ta cần đổi tên file `config.text` sang tên khác

```
switch:rename flash:config.text flash:config.cu
```

![](https://img001.prntscr.com/file/img001/JgOe8Q0hSfuFUUJhR5lmnA.png)
Bước 6 – Sau khi bạn đổi tên tệp `config.text` file sang `config.cu` ta xem lại nội dung flash bằng lệnh `dir flash:`

Sau khi đã đổi tên thành công ta boot vào switch bằng lệnh `boot`

Bước 7 — System Configuration Dialog —

`
Would you like to enter the initial configuration dialog? [yes/no]: n
`
`Switch>`


Bước 8 vào chế độ 2 và copy nội dung file bạn đã đổi tên vào RAM bằng lệnh 

`copy flash:config.cu run`

```
Switch>enable
Switch#copy flash:config.cu run
Destination filename [running-config]?
1654 bytes copied in 9.647 secs (171 bytes/sec)
```

Bước 10 – Sau khi ta copy nội dung file có chứa cấu hình vào running, ta cần đổi lại Password mới, nhớ rằng bạn nên đặt password cả 2 loại mã hóa (nếu cần) và ghi lại vào Nvram với lệnh copy run start .

```
Switch#configure terminal
Switch(config)#enable password NEWENABLEPASSWORD
Switch(config)#line con0
Switch(config-line)#password NEWCONSOLELINEPASSWORD
Switch(config-line)#end
Switch#copy run start
Destination filename [startup-config]?
Building configuration…
[OK]
0 bytes copied in 1.309 secs (0 bytes/sec)
```
