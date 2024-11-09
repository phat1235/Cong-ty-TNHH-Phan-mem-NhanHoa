
### Cú Pháp

```bash
chage [OPTIONS] USERNAME
```

### Các Tùy Chọn `chage`

1. **`-l`, `--list`**: Hiển thị thông tin về cài đặt mật khẩu hiện tại của người dùng.
   ```bash
   chage -l username
   ```
   **Giải thích**: Lệnh này sẽ liệt kê các thông tin liên quan đến mật khẩu, như ngày hết hạn, số ngày giữa các lần thay đổi, ngày phải thay đổi tiếp theo.

2. **`-d`, `--lastday`**: Đặt ngày lần cuối thay đổi mật khẩu, tính bằng số ngày kể từ ngày 1/1/1970.
   ```bash
   chage -d 0 username
   ```
   **Giải thích**: Tùy chọn này buộc người dùng thay đổi mật khẩu trong lần đăng nhập tiếp theo bằng cách đặt ngày cuối thay đổi thành 0.

3. **`-E`, `--expiredate`**: Đặt ngày hết hạn tài khoản theo định dạng `YYYY-MM-DD`.
   ```bash
   chage -E 2024-12-31 username
   ```
   **Giải thích**: Tùy chọn này cho phép thiết lập ngày hết hạn tài khoản. Sau ngày này, tài khoản sẽ bị vô hiệu hóa.

4. **`-I`, `--inactive`**: Đặt số ngày vô hiệu hóa tài khoản sau khi mật khẩu hết hạn.
   ```bash
   chage -I 7 username
   ```
   **Giải thích**: Tùy chọn này xác định số ngày tài khoản vẫn có thể đăng nhập sau khi mật khẩu hết hạn. Sau khoảng thời gian này, tài khoản sẽ bị khóa.

5. **`-m`, `--mindays`**: Thiết lập số ngày tối thiểu giữa hai lần thay đổi mật khẩu.
   ```bash
   chage -m 5 username
   ```
   **Giải thích**: Người dùng sẽ phải chờ ít nhất 5 ngày sau khi thay đổi mật khẩu mới có thể thay đổi lại. Tùy chọn này giúp hạn chế việc thay đổi mật khẩu liên tục.

6. **`-M`, `--maxdays`**: Đặt số ngày tối đa mật khẩu có thể sử dụng trước khi hết hạn.
   ```bash
   chage -M 90 username
   ```
   **Giải thích**: Sau 90 ngày, người dùng phải thay đổi mật khẩu. Tùy chọn này bắt buộc người dùng thay đổi mật khẩu định kỳ để tăng cường bảo mật.

7. **`-W`, `--warndays`**: Đặt số ngày cảnh báo trước khi mật khẩu hết hạn.
   ```bash
   chage -W 7 username
   ```
   **Giải thích**: Người dùng sẽ nhận được cảnh báo trước 7 ngày khi mật khẩu sắp hết hạn, giúp họ chuẩn bị thay đổi mật khẩu.

### Ví Dụ Kết Hợp `chage`

1. **Buộc người dùng thay đổi mật khẩu và thiết lập cảnh báo trước 10 ngày**:
   ```bash
   chage -d 0 -W 10 username
   ```
   **Giải thích**: Người dùng sẽ phải thay đổi mật khẩu ngay lần đăng nhập tiếp theo và sẽ nhận cảnh báo 10 ngày trước khi mật khẩu sắp hết hạn.

2. **Đặt ngày hết hạn tài khoản, thời gian không hoạt động và ngày tối đa mật khẩu**:
   ```bash
   chage -E 2024-12-31 -I 5 -M 90 username
   ```
   **Giải thích**: Tài khoản sẽ hết hạn vào ngày 31/12/2024, sẽ bị vô hiệu hóa sau 5 ngày không hoạt động nếu mật khẩu hết hạn và người dùng sẽ phải thay đổi mật khẩu mỗi 90 ngày.

3. **Xem cài đặt mật khẩu hiện tại của người dùng**:
   ```bash
   chage -l username
   ```
   **Giải thích**: Lệnh này sẽ liệt kê chi tiết các cài đặt hết hạn mật khẩu hiện tại cho người dùng.
