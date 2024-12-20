### Thao tác cơ bản cấu hình máy khách để kết nối FTP Server 

Máy trạm (client) sử dụng công cụ `lftp` để kết nối và thao tác với FTP Server. Dưới đây là các bước chi tiết:

---

#### **1. Cài đặt FTP Client**  
Sử dụng lệnh sau để cài đặt `lftp`, một công cụ FTP Client phổ biến:  

```bash
sudo apt -y install lftp
```

---

#### **2. Kết nối đến FTP Server**  
Sử dụng lệnh `lftp` với tùy chọn phù hợp để kết nối đến FTP Server:

```bash
lftp -u <username> <hostname>
```

**Ví dụ:**  
```bash
lftp -u ubuntu www.srv.world
```

Nhập mật khẩu khi được yêu cầu. Sau khi kết nối thành công, bạn sẽ thấy dấu nhắc lệnh của `lftp`.

---

#### **3. Các lệnh cơ bản trong lftp**

- **Hiển thị thư mục hiện tại trên FTP Server:**  
  ```bash
  lftp> pwd
  ```

- **Hiển thị thư mục hiện tại trên máy trạm:**  
  ```bash
  lftp> !pwd
  ```

- **Liệt kê tệp/thư mục trên FTP Server:**  
  ```bash
  lftp> ls
  ```

- **Liệt kê tệp/thư mục trên máy trạm:**  
  ```bash
  lftp> !ls -l
  ```

- **Chuyển đổi thư mục trên FTP Server:**  
  ```bash
  lftp> cd <tên_thư_mục>
  ```

---

#### **4. Tải lên tệp lên FTP Server**  

- **Tải một tệp lên FTP Server:**  
  ```bash
  lftp> put <tên_tệp>
  ```

- **Tải nhiều tệp lên FTP Server:**  
  ```bash
  lftp> mput <tệp_1> <tệp_2>
  ```

**Ví dụ:**  
```bash
put ubuntu.txt
mput test.txt test2.txt
```

---

#### **5. Tải xuống tệp từ FTP Server**  

- **Tải một tệp từ FTP Server:**  
  ```bash
  lftp> get <tên_tệp>
  ```

- **Tải nhiều tệp từ FTP Server:**  
  ```bash
  lftp> mget <tệp_1> <tệp_2>
  ```

**Lưu ý:** Nếu muốn ghi đè tệp trên máy trạm, bật tùy chọn sau:  
```bash
lftp> set xfer:clobber on
```

---

#### **6. Quản lý thư mục trên FTP Server**  

- **Tạo thư mục mới trên FTP Server:**  
  ```bash
  lftp> mkdir <tên_thư_mục>
  ```

- **Xóa thư mục trên FTP Server:**  
  ```bash
  lftp> rmdir <tên_thư_mục>
  ```

---

#### **7. Quản lý tệp trên FTP Server**  

- **Xóa một tệp:**  
  ```bash
  lftp> rm <tên_tệp>
  ```

- **Xóa nhiều tệp:**  
  ```bash
  lftp> mrm <tệp_1> <tệp_2>
  ```

**Ví dụ:**  
```bash
rm test2.txt
mrm ubuntu.txt test.txt
```

---

#### **8. Thực thi lệnh hệ thống trên máy trạm**  
Sử dụng `!<lệnh>` để thực thi các lệnh shell trên máy trạm.  

**Ví dụ:**  
- Hiển thị nội dung file `/etc/passwd`:  
  ```bash
  lftp> !cat /etc/passwd
  ```

---

#### **9. Thoát khỏi `lftp`**  
Sử dụng lệnh sau để kết thúc phiên làm việc:  
```bash
lftp> quit
```

---

### **Ghi chú quan trọng:**
- **Bảo mật kết nối:** Nếu cần bảo mật, hãy cân nhắc sử dụng **FTPS** hoặc **SFTP** thay vì FTP thông thường.  
- **Chế độ Passive/Active:** Lưu ý cấu hình chế độ Passive hoặc Active tùy theo tường lửa của bạn.  
