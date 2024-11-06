1. **Đổi tên người dùng (Username)**:  
   Để thay đổi tên người dùng, sử dụng lệnh `usermod -l new_username old_username`.  
   Ví dụ:  
   ```bash
   sudo usermod -l phat205 phat
   ```

2. **Thay đổi UID của người dùng**:  
   Để thay đổi UID, sử dụng `usermod -u new_uid username`.  
   Ví dụ:  
   ```bash
   sudo usermod -u 2040 phat205
   ```

3. **Thay đổi UID bằng giá trị non-unique**:  
   Sử dụng `-o` để cho phép UID không duy nhất.  
   Ví dụ:  
   ```bash
   sudo usermod -o -u 2028 phat205
   ```

4. **Thay đổi GID của người dùng**:  
   Để thay đổi GID, sử dụng `usermod -g new_gid username`.  
   Ví dụ:  
   ```bash
   sudo usermod -g 2040 phat205
   ```

5. **Thêm người dùng vào nhóm phụ**:  
   Sử dụng `usermod -G group1,group2 username` để thêm người dùng vào các nhóm phụ.  
   Ví dụ:  
   ```bash
   sudo usermod -G group1,group2 phat205
   ```

6. **Thêm người dùng vào nhóm phụ mà không thay đổi nhóm chính**:  
   Sử dụng `usermod -a -G group username`.  
   Ví dụ:  
   ```bash
   sudo usermod -a -G group3 phat205
   ```

7. **Thêm thông tin vào tài khoản người dùng**:  
   Sử dụng `usermod -c "comment" username` để thêm thông tin.  
   Ví dụ:  
   ```bash
   sudo usermod -c "This is phat205" phat205
   ```

8. **Thay đổi thư mục home của người dùng**:  
   Dùng `usermod -d /new/home/directory username` để thay đổi thư mục home.  
   Ví dụ:  
   ```bash
   sudo usermod -d /home/phat205 phat205
   ```

9. **Di chuyển nội dung của thư mục home khi thay đổi thư mục home**:  
   Sử dụng `-m` để di chuyển nội dung thư mục home cũ sang thư mục mới.  
   Ví dụ:  
   ```bash
   sudo usermod -m -d /home/phat205 phat205
   ```

10. **Thay đổi shell đăng nhập của người dùng**:  
   Dùng `usermod -s /path/to/shell username` để thay đổi shell đăng nhập.  
   Ví dụ:  
   ```bash
   sudo usermod -s /bin/bash phat205
   ```

11. **Đặt ngày hết hạn cho tài khoản người dùng**:  
   Sử dụng `usermod -e YYYY-MM-DD username` để đặt ngày hết hạn.  
   Ví dụ:  
   ```bash
   sudo usermod -e 2024-12-31 phat205
   ```

12. **Khóa tài khoản người dùng**:  
   Để khóa tài khoản người dùng, sử dụng `usermod -L username`.  
   Ví dụ:  
   ```bash
   sudo usermod -L phat205
   ```

13. **Mở khóa tài khoản người dùng**:  
   Dùng `usermod -U username` để mở khóa tài khoản đã khóa.  
   Ví dụ:  
   ```bash
   sudo usermod -U phat205
   ```

14. **Thay đổi thông tin mật khẩu của người dùng**:  
   Để thay đổi mật khẩu mà không mã hóa, sử dụng `usermod -p password username`.  
   Ví dụ:  
   ```bash
   sudo usermod -p newpassword phat205
   ```
