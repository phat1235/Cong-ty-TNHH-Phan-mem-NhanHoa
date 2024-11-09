
### 1. **`useradd`**: Tạo người dùng mới

- **Cấu trúc**: 
  ```bash
  useradd [option] username
  ```

- **Các tùy chọn quan trọng**:
  - `-m`: Tạo thư mục home cho người dùng.
  - `-d <path>`: Xác định đường dẫn thư mục home.
  - `-s <shell>`: Xác định shell mặc định cho người dùng (ví dụ: `/bin/bash`).
  - `-g <group>`: Gán người dùng vào nhóm chính.
  - `-G <group1,group2,...>`: Gán người dùng vào nhiều nhóm bổ sung.
  - `-u <UID>`: Xác định ID người dùng.
  - `-e <date>`: Xác định ngày hết hạn của tài khoản người dùng.

- **Ví dụ**:
  ```bash
  useradd -m -d /home/johndoe -s /bin/bash -G sudo johndoe
  ```

### 2. **`usermod`**: Sửa đổi thông tin người dùng

- **Cấu trúc**:
  ```bash
  usermod [option] username
  ```

- **Các tùy chọn quan trọng**:
  - `-aG <group1,group2,...>`: Thêm người dùng vào nhóm (không thay đổi các nhóm hiện tại).
  - `-G <group1,group2,...>`: Gán người dùng vào các nhóm bổ sung (thay thế các nhóm hiện tại).
  - `-d <path>`: Thay đổi thư mục home.
  - `-s <shell>`: Thay đổi shell mặc định.
  - `-L`: Khóa tài khoản người dùng (tạm ngừng truy cập).
  - `-U`: Mở khóa tài khoản người dùng.

- **Ví dụ**:
  ```bash
  usermod -aG developers johndoe
  ```

### 3. **`userdel`**: Xóa người dùng

- **Cấu trúc**:
  ```bash
  userdel [option] username
  ```

- **Các tùy chọn quan trọng**:
  - `-r`: Xóa thư mục home của người dùng cùng với tất cả các tệp tin.
  - `-f`: Xóa người dùng ngay cả khi họ đang đăng nhập hoặc có các tệp tin đang được sở hữu.

- **Ví dụ**:
  ```bash
  userdel -r johndoe
  ```

### 4. **`groupadd`**: Tạo nhóm mới

- **Cấu trúc**:
  ```bash
  groupadd [option] groupname
  ```

- **Các tùy chọn quan trọng**:
  - `-g <GID>`: Chỉ định ID nhóm.
  - `-f`: Không tạo nhóm nếu nhóm đã tồn tại.

- **Ví dụ**:
  ```bash
  groupadd -g 1001 developers
  ```

### 5. **`groupdel`**: Xóa nhóm

- **Cấu trúc**:
  ```bash
  groupdel groupname
  ```

- **Ví dụ**:
  ```bash
  groupdel developers
  ```

### 6. **`gpasswd`**: Quản lý mật khẩu nhóm

- **Cấu trúc**:
  ```bash
  gpasswd [option] groupname
  ```

- **Các tùy chọn quan trọng**:
  - `-A <user1,user2,...>`: Cung cấp quyền quản trị nhóm cho các người dùng.
  - `-a <username>`: Thêm người dùng vào nhóm.
  - `-d <username>`: Xóa người dùng khỏi nhóm.

- **Ví dụ**:
  ```bash
  gpasswd -a johndoe developers
  ```

### 7. **`chage`**: Quản lý thông tin mật khẩu người dùng

- **Cấu trúc**:
  ```bash
  chage [option] username
  ```

- **Các tùy chọn quan trọng**:
  - `-l`: Liệt kê các thông tin về mật khẩu của người dùng.
  - `-m <days>`: Xác định số ngày tối thiểu giữa hai lần thay đổi mật khẩu.
  - `-M <days>`: Xác định số ngày tối đa mật khẩu có hiệu lực.
  - `-I <days>`: Xác định số ngày sau khi mật khẩu hết hạn mà tài khoản sẽ bị khóa.
  - `-E <date>`: Xác định ngày hết hạn của tài khoản.

- **Ví dụ**:
  ```bash
  chage -M 60 johndoe
  ```

### 8. **`passwd`**: Thay đổi mật khẩu người dùng

- **Cấu trúc**:
  ```bash
  passwd [option] username
  ```

- **Các tùy chọn quan trọng**:
  - `-l`: Khóa mật khẩu (ngừng cho phép đăng nhập).
  - `-u`: Mở khóa mật khẩu (cho phép đăng nhập lại).
  - `-e`: Buộc người dùng phải thay đổi mật khẩu khi đăng nhập lần sau.

- **Ví dụ**:
  ```bash
  passwd -e johndoe
  ```

### 9. **`id`**: Xem thông tin người dùng và nhóm

- **Cấu trúc**:
  ```bash
  id [username]
  ```

- **Ví dụ**:
  ```bash
  id johndoe
  ```

### 10. **`groups`**: Xem các nhóm mà người dùng tham gia

- **Cấu trúc**:
  ```bash
  groups [username]
  ```

- **Ví dụ**:
  ```bash
  groups johndoe
  ```

### 11. **`whoami`**: Xem tên người dùng hiện tại

- **Cấu trúc**:
  ```bash
  whoami
  ```

- **Ví dụ**:
  ```bash
  whoami
  ```
