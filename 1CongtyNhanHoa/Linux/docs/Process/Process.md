

## [I. Process Management](#i-process-management)
- [1. Introduction to Processes](#1-introduction-to-processes)

**Chương 1. Giới thiệu về tiến trình**

1.1. **Thuật ngữ**
- **1.1.1. Tiến trình**: Một tiến trình là mã nguồn đã được biên dịch và đang chạy trên hệ thống.

- **1.1.2. PID**: Mỗi tiến trình có một ID tiến trình (PID).

- **1.1.3. PPID**: Mỗi tiến trình có một tiến trình cha (PPID). Tiến trình con thường được khởi tạo bởi tiến trình cha.

- **1.1.4. init**: Tiến trình init luôn có PID là 1. Tiến trình này được khởi động bởi chính kernel, vì vậy về lý thuyết nó không có tiến trình cha. Init đóng vai trò là cha nuôi cho các tiến trình mồ côi.

- **1.1.5. kill**: Khi một tiến trình ngừng chạy, tiến trình đó chết. Khi muốn một tiến trình dừng lại, bạn sẽ "giết" nó.

- **1.1.6. daemon**: Các tiến trình khởi động khi hệ thống khởi động và chạy suốt, không bao giờ chết, gọi là daemon.

- **1.1.7. zombie**: Khi một tiến trình bị giết nhưng vẫn hiển thị trên hệ thống, đó là tiến trình zombie. Bạn không thể "giết" tiến trình zombie vì nó đã chết.

1.2. **Quản lý tiến trình cơ bản**
- **1.2.1. $$ và $PPID**: Một số biến môi trường shell chứa thông tin về tiến trình. Biến $$ lưu trữ PID của tiến trình hiện tại, và $PPID lưu trữ PID của tiến trình cha. Thực tế, $$ là tham số shell, không phải biến và bạn không thể gán giá trị cho nó. 
    - Ví dụ: `echo $$ $PPID` 
![](https://img001.prntscr.com/file/img001/Qi_BdeqhQA-uHRnasEAlRA.png)
- **1.2.2. pidof**: Bạn có thể tìm các PID của tiến trình theo tên bằng lệnh `pidof`.
    - Ví dụ: `pidof mingetty`
![](https://img001.prntscr.com/file/img001/ENu9ehpqTT20G1pBW-kwrQ.png)
- **1.2.3. Tiến trình cha và con**: Các tiến trình có mối quan hệ cha-con. Mỗi tiến trình có một tiến trình cha.
    - Ví dụ: Khởi động một shell mới và kiểm tra PID:
      - `echo $$ $PPID` trả về `4812 4224`
      - Lệnh `exit` sẽ kết thúc tiến trình hiện tại và đưa bạn trở lại giá trị ban đầu của $$ và $PPID.
- **1.2.4. fork và exec**: Một tiến trình khởi tạo một tiến trình khác trong hai pha. Đầu tiên, tiến trình tạo một bản sao của chính nó (fork). Sau đó, tiến trình fork sẽ thực thi lệnh exec để thay thế bản sao đó bằng tiến trình con mục tiêu.
    - Ví dụ: `echo $$` (Hiển thị PID hiện tại), sau đó chạy `bash` và kiểm tra lại PID.
![](https://img001.prntscr.com/file/img001/aOM_WSctRq2BXyx0pJezwA.png)
- **1.2.5. exec**: Lệnh `exec` cho phép bạn thực thi một tiến trình mà không tạo ra một tiến trình mới (fork).
    - Ví dụ: Khởi động Korn shell (ksh), sau đó thay thế bằng bash với lệnh `exec bash`.
    - Kết quả: PID của bash mới sẽ giống với PID của ksh.
![](https://img001.prntscr.com/file/img001/0K36iyULTZuLiDTVRe4ghg.png)
- **1.2.6. ps**: Công cụ ps là một trong những công cụ phổ biến nhất trên Linux để xem thông tin tiến trình. Lệnh `ps fx` sẽ hiển thị mối quan hệ cha-con của các tiến trình.
    - Ví dụ: Sử dụng `ps fx` để hiển thị các tiến trình đang chạy và mối quan hệ cha-con của chúng.
![](https://img001.prntscr.com/file/img001/Jkv1BAAmQtOAgNizEL1geg.png)
- **1.2.7. pgrep**: Lệnh `pgrep` giúp tìm kiếm tiến trình theo tên lệnh.
    - Ví dụ: `pgrep sleep` sẽ hiển thị PID của tiến trình `sleep`.
- **1.2.8. top**: Công cụ top là công cụ phổ biến trên Linux, cho phép bạn sắp xếp các tiến trình theo mức độ sử dụng CPU hoặc các thuộc tính khác. Bạn cũng có thể giết tiến trình từ trong công cụ top. Nhấn `h` trong top để xem trợ giúp.
![](https://img001.prntscr.com/file/img001/NpdSYEmCRH-Md0hpBRPtUg.png)
- PID: ID của tiến trình.

- USER: Người dùng sở hữu tiến trình.
PR: Độ ưu tiên của tiến trình.

- NI: Giá trị nice (độ ưu tiên điều chỉnh của tiến trình).

- VIRT: Bộ nhớ ảo của tiến trình.

- RES: Bộ nhớ thực tế mà tiến trình đang sử dụng.
- SHR: Bộ nhớ chia sẻ.
- S: Trạng thái của tiến trình (ví dụ: S = ngủ, R = đang chạy, Z = zombie).
- %CPU: Tỷ lệ sử dụng CPU của tiến trình.
- %MEM: Tỷ lệ sử dụng bộ nhớ của tiến trình.
- TIME+: Thời gian tiến trình đã chạy.
- COMMAND: Tên tiến trình.
### 1.3. Signalling Processes

#### 1.3.1. **kill**
Lệnh `kill` được sử dụng để kết thúc (hoặc dừng) một tiến trình. Ví dụ dưới đây sử dụng `kill` để dừng tiến trình với PID là 1942:
```bash
kill 1942
```
Khi dùng lệnh `kill`, bạn thực sự đang gửi một tín hiệu tới tiến trình.

#### 1.3.2. **List Signals**
Các tiến trình đang chạy có thể nhận tín hiệu từ nhau hoặc từ người dùng. Bạn có thể liệt kê các tín hiệu bằng lệnh:
```bash
kill -l
1) SIGHUP 2) SIGINT 3) SIGQUIT 4) SIGILL
5) SIGTRAP 6) SIGABRT 7) SIGBUS 8) SIGFPE
9) SIGKILL 10) SIGUSR1 11) SIGSEGV 12) SIGUSR2
...
```

**kill -1 (SIGHUP)**
SIGHUP (hoặc HUP) thường được sử dụng trong Linux để yêu cầu một tiến trình đọc lại file cấu hình của nó mà không cần phải dừng và khởi động lại. Ví dụ, lệnh `kill -1 1` yêu cầu tiến trình `init` (PID = 1) đọc lại file cấu hình của nó:
```bash
kill -1 1

```
Lập trình viên của tiến trình quyết định xem liệu tiến trình có thể làm điều này khi đang chạy hay phải dừng lại và khởi động lại.

#### 1.3.4. **kill -15 (SIGTERM)**
SIGTERM là tín hiệu mặc định được gửi khi sử dụng `kill` mà không chỉ định tín hiệu cụ thể. Đây là tín hiệu "kết thúc chuẩn", yêu cầu tiến trình dừng một cách lịch sự:
```bash
kill 1942
kill -15 1942
```
![](https://img001.prntscr.com/file/img001/AhzEQRfgQdG2RE_cbRlFUw.png)
#### 1.3.5. **kill -9 (SIGKILL)**
SIGKILL là tín hiệu đặc biệt, không thể bị bắt và không thể xử lý bởi tiến trình. Khi gửi tín hiệu này, kernel sẽ ngay lập tức dừng tiến trình mà không cần thông báo:
```bash
kill -9 3342
```
![](https://img001.prntscr.com/file/img001/NTS4d0MKTAepOtaSgZVWpA.png)
#### 1.3.6. **SIGSTOP và SIGCONT**
Một tiến trình có thể bị tạm dừng khi nhận tín hiệu SIGSTOP (hoặc `kill -19`). Tiến trình bị tạm dừng không sử dụng CPU nhưng vẫn ở trong bộ nhớ và có thể được khôi phục với tín hiệu SIGCONT (hoặc `kill -18`):
```bash
kill -19 <PID>   # Tạm dừng tiến trình
kill -18 <PID>   # Tiếp tục tiến trình
```

#### 1.3.7. **pkill**
Lệnh `pkill` cho phép bạn dừng một tiến trình dựa trên tên của lệnh, thay vì phải biết PID của tiến trình:
```bash
sleep 1000 &
[1] 30203
pkill sleep
sleep 1000
```

#### 1.3.8. **killall**
Lệnh `killall` sẽ gửi tín hiệu 15 đến tất cả các tiến trình có tên nhất định:

![](https://img001.prntscr.com/file/img001/02DSDRvlTrinSL2Zw4sQQQ.png)

#### 1.3.9. **top**
Trong giao diện `top`, phím **k** cho phép bạn chọn tín hiệu và PID của tiến trình để kill. Sau khi nhấn phím **k**, bạn nhập PID và chọn tín hiệu (ví dụ: `9` để SIGKILL).
- [2. Process Priorities](#2-process-priorities)
- [3. Background Jobs](#3-background-jobs)


### 2.1. **Giá trị ưu tiên và Nice**

#### 2.1.1. **Giới thiệu**
- Mỗi tiến trình trong Linux có giá trị ưu tiên và giá trị "nice".
- Các tiến trình có ưu tiên cao sẽ được cấp nhiều thời gian CPU hơn các tiến trình có ưu tiên thấp.
- Các lệnh **nice** và **renice** cho phép người dùng điều chỉnh các giá trị ưu tiên này.

#### 2.1.2. **Pipes (mkfifo)**
- **Pipes** cho phép các tiến trình giao tiếp với nhau bằng cách truyền dữ liệu qua lại giữa chúng.
- Bạn có thể tạo pipe có tên sử dụng lệnh `mkfifo`. Ví dụ:
```bash
mkdir procs
cd procs
mkfifo pipe33a pipe33b pipe42a pipe42b
```
- Lệnh trên sẽ tạo ra bốn pipe có tên trong thư mục `procs`.

#### 2.1.3. **Một số thử nghiệm với lệnh cat**
- Để tạo tải CPU và chứng minh về ưu tiên của các tiến trình, chúng ta sử dụng lệnh `cat` kết hợp với pipe.
- Lệnh `cat` được sao chép và đổi tên, sau đó được sử dụng để truyền ký tự giữa các pipe, tạo ra tải CPU.
- Ví dụ:
```bash
cp /bin/cat proj33
cp /bin/cat proj42
echo -n x | ./proj33 - pipe33a > pipe33b &
./proj33 <pipe33b >pipe33a &
echo -n z | ./proj42 - pipe42a > pipe42b &
./proj42 <pipe42b >pipe42a &
```

#### 2.1.4. **Top**
- Lệnh `top` được sử dụng để hiển thị một cái nhìn động về các tiến trình đang chạy và hiệu suất hệ thống.
- Dưới đây là ví dụ về cách thức sử dụng `top` để kiểm tra tình trạng CPU và bộ nhớ:
```bash
top
```
- Trong đầu ra của lệnh, bạn có thể thấy các tiến trình tiêu tốn thời gian CPU và bộ nhớ như thế nào.

#### 2.1.5. **top -p**
- Lệnh `top -p` được sử dụng để theo dõi các tiến trình cụ thể theo PID.
- Ví dụ:
```bash
top -p 1670,1671,1673,1674
```
- Lệnh này hiển thị mức độ sử dụng CPU của bốn tiến trình cụ thể.

#### 2.1.6. **Renice**
- Lệnh `renice` được sử dụng để thay đổi giá trị ưu tiên (nice value) của một tiến trình đang chạy.
- Ví dụ:
```bash
renice +8 1670
renice +8 1671
```
- Lệnh trên thay đổi giá trị nice của các tiến trình có PID được chỉ định thành +8, làm giảm ưu tiên của chúng.

- **Quan trọng**: Người dùng bình thường có thể tăng giá trị nice (giảm ưu tiên), nhưng chỉ có người dùng root mới có thể giảm giá trị nice (tăng ưu tiên).

#### 2.1.7. **Tác động của giá trị Nice**
- Tác động của việc thay đổi giá trị nice có thể thấy rõ qua mức độ sử dụng CPU, nơi các tiến trình có giá trị nice cao (ưu tiên thấp) sử dụng ít thời gian CPU hơn.
- Ví dụ sau khi thay đổi giá trị nice:
```bash
PID USER PR NI VIRT RES SHR S %CPU %MEM TIME+ COMMAND
1674 paul 20 0 2972 616 524 S 46.6 0.1 0:22.37 proj42
1673 paul 20 0 2972 620 524 R 42.6 0.1 0:21.65 proj42
1671 paul 28 8 2972 616 524 S 5.7 0.1 0:29.65 proj33
1670 paul 28 8 2972 616 524 R 4.7 0.1 0:29.82 proj33
```
- Trong ví dụ này, giá trị nice của các tiến trình `proj33` đã được thay đổi, dẫn đến mức sử dụng CPU thấp hơn cho các tiến trình đó.

#### 2.1.8. **Nice**
- Lệnh `nice` hoạt động giống như lệnh `renice`, nhưng được sử dụng khi khởi chạy một tiến trình để gán cho nó một giá trị nice cụ thể.
- Ví dụ:
```bash
nice -5 ./backup.sh
```
- Lệnh này sẽ khởi chạy script `backup.sh` với giá trị nice là `-5`, tạo ra ưu tiên cao hơn cho tiến trình đó.

### Tóm tắt
- **Giá trị nice** có thể dao động từ -20 (ưu tiên cao nhất) đến 19 (ưu tiên thấp nhất).
- **Renice** thay đổi ưu tiên của một tiến trình đang chạy, trong khi **nice** được sử dụng khi khởi chạy một tiến trình.
- Việc điều chỉnh giá trị nice giúp quản lý tải CPU và ngăn chặn các tiến trình ưu tiên thấp chiếm dụng tài nguyên của hệ thống.




# **Chương 3. Tiến trình nền**

**3.1. Tiến trình nền**

**3.1.1. Lệnh `jobs`**  
Các tiến trình chạy ở nền trong shell hiện tại có thể được hiển thị bằng lệnh `jobs`. Mặc định, không có tiến trình nào chạy ở nền.  
Ví dụ:
```bash
jobs

```

**3.1.2. `Ctrl-Z`**  
Một số tiến trình có thể bị tạm ngừng bằng cách nhấn tổ hợp phím `Ctrl-Z`. Lệnh này gửi tín hiệu **SIGSTOP** tới nhân Linux, làm "đóng băng" tiến trình.  
Khi thực hiện điều này trong **vi(m)**, vi(m) sẽ chuyển sang nền. Tiến trình **vi(m)** ở nền có thể được xem bằng lệnh `jobs`.  
Ví dụ:
```bash
. vi procdemo.txt
[5]+ Stopped vim procdemo.txt
. jobs
[5]+ Stopped vim procdemo.txt
```

**3.1.3. Dấu `&`**  
Các tiến trình được bắt đầu ở nền bằng cách sử dụng ký tự `&` ở cuối dòng lệnh cũng có thể được hiển thị bằng lệnh `jobs`.  
Ví dụ:
```bash
. find / > allfiles.txt 2> /dev/null &
[6] 5230
. jobs
[5]+ Stopped vim procdemo.txt
[6]- Running find / > allfiles.txt 2>/dev/null &
```

**3.1.4. `jobs -p`**  
Một tùy chọn hữu ích là `jobs -p`, giúp hiển thị ID tiến trình (PID) của các tiến trình chạy ở nền.  
Ví dụ:
```bash
 sleep 500 & 
[1] 4902
 sleep 400 & 
[2] 4903
 jobs -p
4902
4903
 ps `jobs -p`
```

**3.1.5. Lệnh `fg`**  
Lệnh `fg` sẽ đưa một tiến trình từ nền ra phía trước. Số thứ tự của tiến trình nền cần được đưa ra phía trước là tham số của `fg`.  
Ví dụ:
```bash
 jobs
[1] Running sleep 1000 &
[2]- Running sleep 1000 &
[3]+ Running sleep 2000 &
 fg 3
sleep 2000
```

**3.1.6. Lệnh `bg`**  
Các tiến trình bị tạm ngừng trong nền có thể được khởi động lại bằng lệnh `bg`. Lệnh này sẽ gửi tín hiệu **SIGCONT**.  
Ví dụ:
```bash
jobs
[1]- Running sleep 5000 &
[2]+ Stopped sleep 3000
bg 2
[2]+ sleep 3000 &
[jobs
[1]- Running sleep 5000 &
[2]+ Running sleep 3000 &
```



