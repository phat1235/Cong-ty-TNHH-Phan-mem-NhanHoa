### Sử dụng John the Ripper để Phát Hiện Mật Khẩu Yếu

**John the Ripper** là một công cụ mạnh mẽ được sử dụng để phát hiện và kiểm tra độ an toàn của mật khẩu trên hệ thống Linux. Nó giúp bạn xác định các mật khẩu yếu hoặc dễ bị đoán. Bạn có thể sử dụng John the Ripper để phát hiện mật khẩu yếu bằng cách kiểm tra tập tin chứa hash mật khẩu của người dùng (thường là `/etc/shadow` trên hệ thống Linux).

Dưới đây là các bước chi tiết để thực hiện:

---

#### Bước 1: Cài đặt John the Ripper

Nếu bạn chưa có John the Ripper, bạn có thể cài đặt nó bằng lệnh sau:

```bash
sudo apt update
sudo apt install john
```

---

#### Bước 2: Trích xuất hash mật khẩu từ `/etc/shadow`

File `/etc/shadow` chứa các hash mật khẩu của người dùng. Để trích xuất hash từ file này, bạn cần quyền root hoặc phải chạy lệnh với quyền `sudo`.

- Bạn cần kết hợp nội dung của file `/etc/passwd` và `/etc/shadow` bằng lệnh:

```bash
sudo unshadow /etc/passwd /etc/shadow > password-hashes.txt
```
![](https://img001.prntscr.com/file/img001/H6xb_hmzQiy-iaMfJmTvPQ.png)
---

#### Bước 3: Sử dụng John the Ripper để kiểm tra mật khẩu

Sau khi trích xuất hash mật khẩu, bạn có thể chạy John the Ripper để kiểm tra các mật khẩu yếu. Sử dụng lệnh sau:

```bash
john password-hashes.txt
```
![](https://img001.prntscr.com/file/img001/0aNJU86LSzSSHnBDX2agmw.png)
John sẽ bắt đầu quá trình kiểm tra mật khẩu dựa trên hash mà bạn cung cấp. Nó sử dụng các tệp từ điển có sẵn để tìm ra các mật khẩu yếu.
![](	https://img001.prntscr.com/file/img001/GlwpxLJZRi6hMLfTZnn8ng.png)
---

#### Bước 4: Kiểm tra kết quả

Để xem kết quả kiểm tra mật khẩu yếu, bạn có thể chạy lệnh sau:

```bash
john --show <file-name>
```
![](https://img001.prntscr.com/file/img001/C2lRXY8fR_63x6SpmotJRw.png)
Lệnh này sẽ hiển thị các mật khẩu đã bị phát hiện là yếu.

---



### Ý nghĩa

Sử dụng John the Ripper để phát hiện mật khẩu yếu là một cách hiệu quả để cải thiện bảo mật của hệ thống. Nó giúp bạn tìm ra các tài khoản sử dụng mật khẩu dễ đoán, giúp bạn có thể thay thế chúng bằng các mật khẩu mạnh hơn.

---

