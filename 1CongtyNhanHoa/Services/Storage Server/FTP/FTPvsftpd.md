### Cách cài đặt và cấu hình FTP Server sử dụng VSFTPD trên Ubuntu 22.04  

Hướng dẫn này không chỉ áp dụng cho Ubuntu 22.04 mà còn sử dụng được trên các hệ điều hành tương tự như Ubuntu 20.04, Debian 11, Linux Mint, v.v.

---

#### **1. Cập nhật hệ thống**  
Đầu tiên, hãy đảm bảo hệ thống đã được cập nhật đầy đủ các gói mới nhất:  

```bash
sudo apt update && sudo apt upgrade
```

Lệnh trên sẽ đồng thời cập nhật danh sách gói (update) và nâng cấp các gói đã cài đặt (upgrade).

---

#### **2. Cài đặt VSFTPD**  
VSFTPD (Very Secure FTP Daemon) là một trong những phần mềm FTP Server phổ biến và bảo mật tốt:  

```bash
sudo apt install vsftpd
```

---

#### **3. Kiểm tra trạng thái dịch vụ VSFTPD**  
Sau khi cài đặt, kiểm tra xem dịch vụ VSFTPD có đang hoạt động không:  

```bash
systemctl status vsftpd --no-pager -l
```

Nếu dịch vụ chưa chạy, hãy khởi động nó:  

```bash
sudo systemctl start vsftpd
```

---

#### **4. Tạo người dùng FTP**  
Người dùng FTP sẽ bị hạn chế quyền để chỉ có thể truy cập một thư mục cụ thể:  

```bash
sudo adduser ftpuser
```

Hệ thống sẽ yêu cầu bạn nhập mật khẩu và thông tin bổ sung cho người dùng. Nhấn Enter để bỏ qua các thông tin không cần thiết.

---

#### **5. Tạo thư mục FTP và cấu hình quyền**  
- Tạo thư mục FTP:  
  ```bash
  sudo mkdir /home/ftpuser/ftp
  ```

- Thay đổi quyền sở hữu của thư mục gốc FTP để đảm bảo bảo mật:  
  ```bash
  sudo chown nobody:nogroup /home/ftpuser/ftp
  sudo chmod a-w /home/ftpuser/ftp
  ```

- Tạo thư mục con để tải lên:  
  ```bash
  sudo mkdir /home/ftpuser/ftp/upload
  sudo chown ftpuser:ftpuser /home/ftpuser/ftp/upload
  ```

- Tạo một tệp thử nghiệm trong thư mục tải lên để kiểm tra:  
  ```bash
  echo "My FTP Server" | sudo tee /home/ftpuser/ftp/upload/demo.txt
  ```

---

#### **6. Cấu hình VSFTPD**  
- Mở file cấu hình của VSFTPD:  
  ```bash
  sudo nano /etc/vsftpd.conf
  ```

- **Kích hoạt người dùng ẩn danh (nếu cần):**  
  ```plaintext
  anonymous_enable=YES
  ```

- **Cho phép người dùng local:**  
  ```plaintext
  local_enable=YES
  ```

- **Cho phép tải tệp lên:**  
  ```plaintext
  write_enable=YES
  ```

- **Hạn chế người dùng local chỉ truy cập vào thư mục của họ:**  
  ```plaintext
  chroot_local_user=YES
  ```

- **Định tuyến người dùng đến thư mục cụ thể:**  
  Thêm các dòng sau vào cuối file:  
  ```plaintext
  user_sub_token=$USER
  local_root=/home/$USER/ftp
  pasv_min_port=30000
  pasv_max_port=31000
  ```

- **Chỉ cho phép người dùng cụ thể:**  
  ```plaintext
  userlist_enable=YES
  userlist_file=/etc/vsftpd.userlist
  userlist_deny=NO
  ```

Lưu file và thoát:  
- Nhấn `Ctrl+O`, sau đó Enter.  
- Nhấn `Ctrl+X` để thoát.

---

#### **7. Cấu hình Firewall**  
Mở các cổng FTP cần thiết:  
```bash
sudo ufw allow 20,21,990/tcp
sudo ufw allow 30000:31000/tcp
```

---

#### **8. Thêm người dùng vào danh sách được phép truy cập**  
Thêm tên người dùng vào file `/etc/vsftpd.userlist`:  
```bash
echo "ftpuser" | sudo tee -a /etc/vsftpd.userlist
```

---

#### **9. Khởi động lại VSFTPD**  
Sau khi hoàn thành cấu hình, khởi động lại dịch vụ để áp dụng thay đổi:  
```bash
sudo systemctl restart vsftpd
```

---

#### **10. Kiểm tra kết nối đến FTP Server**  
Bạn có thể sử dụng các công cụ FTP client như **FileZilla**, **WinSCP**, hoặc lệnh `ftp` trong terminal để kết nối và kiểm tra:  

```bash
ftp <địa chỉ_IP_hoặc_tên_máy_chủ>
```

---

### **Giải thích thêm**  

- **Chroot Jail:**  
  Tùy chọn `chroot_local_user=YES` giúp hạn chế người dùng chỉ truy cập được vào thư mục của họ, tăng tính bảo mật.

- **Passive Mode Configuration:**  
  `pasv_min_port` và `pasv_max_port` chỉ định phạm vi cổng sử dụng trong chế độ Passive FTP, cần thiết khi có Firewall hoặc NAT.

- **Danh sách người dùng:**  
  Tùy chọn `userlist_enable=YES` và `userlist_deny=NO` chỉ cho phép các người dùng được liệt kê trong file `/etc/vsftpd.userlist` truy cập FTP Server.

- **File Permissions:**  
  Quyền hạn chặt chẽ cho thư mục gốc FTP (`chmod a-w`) giúp ngăn chặn ghi đè hoặc xóa nhầm tệp/thư mục.

---
