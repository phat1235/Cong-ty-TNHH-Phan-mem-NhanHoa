Để kiểm tra xem có tài khoản người dùng nào trên hệ thống Ubuntu không có mật khẩu hay không.

Ta phải học cách xem cấu trúc file đã! file Shadow
### 1. Sử dụng lệnh `cat` với quyền `sudo`:
Bạn cần quyền root để xem file `/etc/shadow`. Dùng lệnh sau để hiển thị nội dung:

```bash
sudo cat /etc/shadow
```

Sau khi nhập mật khẩu, bạn sẽ thấy nội dung của file `/etc/shadow`. Mỗi dòng đại diện cho một người dùng và có dạng:

```
username:$id$hashed_password:last_change:min:max:warn:inactive:expire
```

Ví dụ:

```
user1:$6$abc123$klsdfjksdf8hsfalksdfhlfhsafkhsf:19000:0:99999:7:::
```

### 2. Ý nghĩa các trường trong `/etc/shadow`:
- `username`: Tên người dùng.
- `hashed_password`: Mật khẩu đã được mã hóa (hoặc `!` hoặc `*` nếu không có mật khẩu).
- `last_change`: Ngày lần cuối mật khẩu được thay đổi (dạng số).
- `min`: Số ngày tối thiểu cần đợi trước khi có thể thay đổi mật khẩu.
- `max`: Số ngày tối đa trước khi phải thay đổi mật khẩu.
- `warn`: Số ngày trước khi hết hạn để cảnh báo người dùng thay đổi mật khẩu.
- `inactive`: Số ngày sau khi mật khẩu hết hạn mà tài khoản sẽ bị vô hiệu hóa.
- `expire`: Ngày tài khoản sẽ hết hạn (dạng số).



![](https://img001.prntscr.com/file/img001/-HaDuQs3Qxu28LNmwP1e4w.png)

### 1. Kiểm tra tài khoản không có mật khẩu bằng lệnh `passwd -S`
Lệnh này hiển thị trạng thái của tài khoản người dùng, bao gồm trạng thái mật khẩu.

```bash
sudo awk -F: '($2 == "!") {print $1}' /etc/shadow
```
![](	https://img001.prntscr.com/file/img001/d5c1GQryR5O5_YCZic1kDg.png)
### 2. Phân tích kết quả:
- Nếu lệnh không trả về gì, điều đó có nghĩa là không có tài khoản nào trên hệ thống có mật khẩu trống.
- Nếu có tài khoản, tên người dùng của các tài khoản đó sẽ xuất hiện, và bạn nên đặt mật khẩu cho chúng ngay lập tức bằng lệnh `passwd`.
### 3. Kiểm tra trực tiếp với lệnh `cat`
Bạn cũng có thể kiểm tra các tài khoản trong file `/etc/shadow` để xem có tài khoản nào không có mật khẩu:

```bash
sudo cat /etc/shadow | awk -F: '($2 == "") {print $1}'
```


File `/etc/shadow` trong Ubuntu (và các hệ điều hành Linux khác) chứa thông tin về mật khẩu người dùng, nhưng nó được bảo vệ chặt chẽ để ngăn chặn truy cập trái phép. Chỉ người dùng root hoặc người có quyền `sudo` mới có thể xem file này.
