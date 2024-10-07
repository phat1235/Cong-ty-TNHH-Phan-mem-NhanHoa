Để tạo một quy tắc `auditd`
### **Quy tắc Auditd *
1. **Mở file quy tắc**:

   ```bash
   sudo vi /etc/audit/rules.d/basic_audit.rules
   ```

2. **Thêm các quy tắc giám sát nhẹ**:

   ```bash
   # Giám sát việc thực thi các lệnh và chương trình quan trọng
   -w /bin/ -p x -k bin-exec
   -w /usr/bin/ -p x -k user-bin-exec

   # Giám sát thay đổi quyền truy cập và thực thi trên các file nhạy cảm
   -w /etc/passwd -p wa -k passwd-change
   -w /etc/shadow -p wa -k shadow-change

   # Giám sát việc khởi động và tắt máy (shutdown)
   -w /var/log/wtmp -p wa -k logins

   # Giám sát thư mục chứa log để phát hiện các thay đổi
   -w /var/log/ -p wa -k logs-change
   ```
![](	https://img001.prntscr.com/file/img001/kH2d1r_rQ2KmlWMxcbKYLw.png)
   - **Giải thích**:
     - `-w`: Theo dõi đường dẫn đến file hoặc thư mục.
     - `-p wa`: Ghi nhận các thay đổi về ghi (write) và thay đổi thuộc tính (attribute).
     - `-p x`: Ghi nhận các lần thực thi.
     - `-k`: Từ khóa giúp dễ dàng tìm kiếm và phân loại các sự kiện trong log.



4. **Tải lại các quy tắc `auditd`**:

   ```bash
   sudo augenrules --load
   sudo systemctl restart auditd
   ```

### **Kiểm tra Hoạt Động của `auditd`**
- Sau khi cấu hình, bạn có thể kiểm tra lại các quy tắc đã được áp dụng:

   ```bash
   sudo auditctl -l
   ```
![](	https://img001.prntscr.com/file/img001/zo9Z_vH4Rpq3qF-CNevTkA.png)
- Để xem các sự kiện audit được ghi nhận:

   ```bash
   sudo ausearch -k bin-exec
   sudo ausearch -k passwd-change
   ```
![](https://img001.prntscr.com/file/img001/PCS6DqWJRv2DOdD3JCPG9A.png)
### **Giải thích chi tiết**
1. **Cấu hình thay đổi (`CONFIG_CHANGE`)**:
   - `type=CONFIG_CHANGE`: Loại sự kiện này liên quan đến thay đổi cấu hình của `auditd`.
   - `op=add_rule` và `op=remove_rule`: Lần lượt ghi nhận việc thêm và xóa quy tắc audit.
   - `key="logins"`: Đây là từ khóa được gán cho quy tắc audit để giám sát các sự kiện đăng nhập hoặc các thay đổi cấu hình liên quan đến đăng nhập.
   - `auid=1000`: Cho biết UID của người thực hiện lệnh (ở đây là `1000`, tức là người dùng `phat`).
   - `ses=1`: ID phiên của người dùng khi thay đổi quy tắc.

2. **Thực thi lệnh (`SYSCALL`)**:
   - `syscall=44`: Đây là mã hệ thống (system call) đã được thực hiện (mã 44 thường liên quan đến thao tác `sendmsg` trong Linux).
   - `success=yes`: Cho thấy lệnh đã được thực thi thành công.
   - `comm="auditctl"`: Ghi nhận rằng lệnh `auditctl` đã được thực thi để thay đổi quy tắc audit.
   - `exe="/usr/sbin/auditctl"`: Đường dẫn của lệnh `auditctl` được thực thi.

3. **Đường dẫn và file (`PATH`)**:
   - `type=PATH` và `name="/var/log/"`: Đường dẫn của file hoặc thư mục được giám sát, trong trường hợp này là `/var/log/`.
   - `inode=131081`: Inode của thư mục `/var/log/`, chỉ định vị trí của file trên ổ đĩa.
   - `mode=040775`: Quyền của file hoặc thư mục.
### **Lời khuyên**
- Với cấu hình trên, `auditd` sẽ chỉ ghi nhận các sự kiện quan trọng như việc thay đổi quyền của các file hệ thống và các lần thực thi lệnh từ các thư mục `bin`, giúp bạn phát hiện các hành động bất thường mà không làm hệ thống quá tải.


