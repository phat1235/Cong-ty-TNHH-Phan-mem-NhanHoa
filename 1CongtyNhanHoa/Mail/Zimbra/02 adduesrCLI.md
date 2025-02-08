Bạn có thể tạo 100 user trên Zimbra với tên miền `nhanhoa2000.com` bằng cách sử dụng CSV và script Bash. 
---
Giả dụ là ta đang có danh sách thông tin user và cần tạo hàng loạt...
### **1. Tạo file danh sách user (`users.csv`)**
Mở file `users.csv` và nhập danh sách user theo định dạng:  

```csv
user1@nhanhoa2000.com,StrongPass123,User One
user2@nhanhoa2000.com,StrongPass456,User Two
user3@nhanhoa2000.com,StrongPass789,User Three
...
user100@nhanhoa2000.com,StrongPass999,User One Hundred
```
![](https://img001.prntscr.com/file/img001/Zsh5kUpKQrm69RxpnsQMSQ.png)
Bạn có thể tạo danh sách tự động bằng Python:  Thực tế thì nó có sẵn rùi.

```python
with open("users.csv", "w") as f:
    for i in range(1, 101):
        f.write(f"user{i}@nhanhoa2000.com,StrongPass{i:03},User {i}\n")
```

---
![](https://img001.prntscr.com/file/img001/PpF4ZtVqQoal3zyGzQmX0Q.png)
### **2. Tạo script Bash (`create_users.sh`)**
Tạo file `create_users.sh` với nội dung sau:

```sh
#!/bin/bash

FILE="users.csv"

while IFS=',' read -r email password displayname
do
    echo "Creating user: $email"
    su - zimbra -c "zmprov ca $email $password displayName \"$displayname\""
done < "$FILE"

echo "Done creating users!"
```

---

### **3. Chạy script để tạo user hàng loạt**
1. **Cấp quyền thực thi cho script:**  
   ```sh
   chmod +x create_users.sh
   ```

2. **Chạy script:**  
   ```sh
   ./create_users.sh
   ```

---
![](https://img001.prntscr.com/file/img001/PpF4ZtVqQoal3zyGzQmX0Q.png)
### **4. Kiểm tra user đã tạo**
Sau khi hoàn tất, bạn có thể kiểm tra danh sách user đã tạo bằng lệnh:  

```sh
su - zimbra -c "zmprov -l gaa"
```
![](https://img001.prntscr.com/file/img001/sMtpY7bvRvuim8DgJ-URwA.png)
---

### **Tùy chỉnh thêm**
Nếu muốn đặt giới hạn dung lượng mailbox cho mỗi user (ví dụ 2GB), hãy sửa script:  

```sh
su - zimbra -c "zmprov ca $email $password displayName \"$displayname\" zimbraMailQuota 2147483648"
```

---
