

### Cách cấu hình để thiết lập thời gian hết hạn mật khẩu:

#### 1. Mở file `/etc/login.defs` để chỉnh sửa

Bạn có thể mở file này bằng trình soạn thảo văn bản bất kỳ, ví dụ như `nano`:

```bash
sudo nano /etc/login.defs
```

#### 2. Cấu hình các tham số liên quan đến mật khẩu

Trong file `/etc/login.defs`, bạn sẽ tìm thấy một số dòng cấu hình liên quan đến việc hết hạn mật khẩu:

- `PASS_MAX_DAYS`: Số ngày tối đa mà người dùng có thể sử dụng một mật khẩu trước khi hết hạn và bắt buộc phải đổi.
- `PASS_MIN_DAYS`: Số ngày tối thiểu mà người dùng phải chờ trước khi có thể thay đổi mật khẩu sau lần thay đổi gần nhất.
- `PASS_WARN_AGE`: Số ngày cảnh báo trước khi mật khẩu hết hạn, nhắc người dùng đổi mật khẩu.
![](https://img001.prntscr.com/file/img001/kIP6s0D5QPmkLi9b5OESLA.png)
Bạn có thể chỉnh sửa các giá trị này để phù hợp với chính sách bảo mật của hệ thống. Ví dụ:

```bash
PASS_MAX_DAYS   90
PASS_MIN_DAYS   7
PASS_WARN_AGE   14
```
![](https://img001.prntscr.com/file/img001/5PZ2TZGASGufx1bVLWITHQ.png)
Giải thích:

- `PASS_MAX_DAYS 90`: Mật khẩu sẽ hết hạn sau 90 ngày.
- `PASS_MIN_DAYS 7`: Người dùng phải chờ ít nhất 7 ngày sau khi đổi mật khẩu mới có thể thay đổi lại.
- `PASS_WARN_AGE 14`: Người dùng sẽ nhận được cảnh báo trước 14 ngày khi mật khẩu sắp hết hạn.

#### 3. Áp dụng thay đổi

Các thay đổi này sẽ được áp dụng ngay lập tức cho các tài khoản người dùng mới. Tuy nhiên, đối với các tài khoản hiện tại, bạn cần thiết lập lại thời gian hết hạn mật khẩu bằng lệnh `chage`.

### 4. Sử dụng `chage` để áp dụng chính sách cho người dùng hiện tại

Sau khi thiết lập cấu hình trong `/etc/login.defs`, bạn có thể sử dụng lệnh `chage` để áp dụng các quy tắc cho tài khoản người dùng hiện tại. Ví dụ:

```bash
sudo chage -M 90 -m 7 -W 14 username
```
![](https://img001.prntscr.com/file/img001/5PZ2TZGASGufx1bVLWITHQ.png)
Giải thích:

- `-M 90`: Thiết lập mật khẩu hết hạn sau 90 ngày.
- `-m 7`: Thiết lập thời gian tối thiểu giữa hai lần thay đổi mật khẩu là 7 ngày.
- `-W 14`: Cảnh báo người dùng 14 ngày trước khi mật khẩu hết hạn.
- `username`: Tên tài khoản người dùng mà bạn muốn áp dụng các chính sách này.

### Kiểm tra thông tin tài khoản với `chage`

Để xem thông tin hết hạn mật khẩu của một người dùng cụ thể, bạn có thể chạy lệnh:

```bash
sudo chage -l username
```
