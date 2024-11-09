

### Các Tùy Chọn `usermod`

1. **`-a`, `--append`**: Thêm người dùng vào nhóm bổ sung. Lưu ý: chỉ dùng kết hợp với `-G`.
   ```bash
   usermod -aG sudo,www-data username   # Thêm user vào nhóm sudo và www-data
   ```

2. **`-b`, `--badnames`**: Cho phép sử dụng tên người dùng không tuân thủ quy tắc đặt tên tiêu chuẩn.
   ```bash
   usermod -b -l "invalid@name" oldusername  # Đổi tên thành tên không hợp lệ
   ```

3. **`-c`, `--comment`**: Thêm hoặc cập nhật trường comment cho tài khoản.
   ```bash
   usermod -c "New Comment" username   # Thêm ghi chú mới cho user
   ```

4. **`-d`, `--home`**: Thay đổi thư mục home của người dùng.
   ```bash
   usermod -d /new/home/dir username  # Chuyển thư mục home sang /new/home/dir
   ```

5. **`-e`, `--expiredate`**: Đặt ngày hết hạn cho tài khoản (YYYY-MM-DD).
   ```bash
   usermod -e 2024-12-31 username     # Tài khoản hết hạn vào ngày 31/12/2024
   ```

6. **`-f`, `--inactive`**: Vô hiệu hóa tài khoản sau số ngày chỉ định khi mật khẩu hết hạn.
   ```bash
   usermod -f 30 username             # Vô hiệu hóa sau 30 ngày kể từ khi hết hạn mật khẩu
   ```

7. **`-g`, `--gid`**: Thay đổi nhóm chính của người dùng.
   ```bash
   usermod -g newgroup username       # Đặt nhóm chính là newgroup
   ```

8. **`-G`, `--groups`**: Thêm người dùng vào các nhóm bổ sung (ghi đè nếu không dùng `-a`).
   ```bash
   usermod -G developers,admin username  # Đặt nhóm bổ sung
   ```

9. **`-L`, `--lock`**: Khóa mật khẩu tài khoản người dùng.
   ```bash
   usermod -L username                # Khóa tài khoản
   ```

10. **`-m`, `--move-home`**: Di chuyển nội dung thư mục home tới thư mục mới.
    ```bash
    usermod -m -d /new/home/dir username  # Di chuyển thư mục home đến /new/home/dir
    ```

11. **`-o`, `--non-unique`**: Cho phép đặt trùng giá trị UID cho tài khoản.
    ```bash
    usermod -o -u 1000 username       # Đặt UID trùng 1000
    ```

12. **`-l`, `--login`**: Đổi tên đăng nhập.
    ```bash
    usermod -l newusername oldusername  # Đổi tên từ oldusername thành newusername
    ```

13. **`-p`, `--password`**: Đặt mật khẩu mã hóa mới cho tài khoản.
    ```bash
    usermod -p $(openssl passwd -1 "newpassword") username  # Đặt mật khẩu mã hóa
    ```

14. **`-R`**: Áp dụng thay đổi trong thư mục `CHROOT_DIR`.
    ```bash
    usermod -R /chroot/dir -l newusername oldusername   # Áp dụng thay đổi trong thư mục chroot
    ```

15. **`-s`, `--shell`**: Đặt shell đăng nhập mới cho người dùng.
    ```bash
    usermod -s /bin/zsh username         # Đặt shell thành /bin/zsh
    ```

16. **`-u`, `--uid`**: Đặt UID mới cho tài khoản.
    ```bash
    usermod -u 2000 username             # Đặt UID là 2000
    ```

17. **`-U`, `--unlock`**: Mở khóa mật khẩu của người dùng.
    ```bash
    usermod -U username                  # Mở khóa tài khoản
    ```

### Kết Hợp Tùy Chọn `usermod`

1. **Đổi tên và di chuyển thư mục home**:
   ```bash
   usermod -l newusername -d /new/home/dir -m oldusername
   ```

2. **Thêm vào nhóm bổ sung và đặt comment**:
   ```bash
   usermod -aG sudo,www-data -c "New User" username
   ```

3. **Đổi UID và nhóm chính**:
   ```bash
   usermod -u 3000 -g developers username
   ```

4. **Khóa tài khoản và đặt ngày hết hạn**:
   ```bash
   usermod -L -e 2025-01-01 username
   ```
