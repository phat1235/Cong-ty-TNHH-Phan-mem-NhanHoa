# Hướng Dẫn Backup và Restore Mail trên Zimbra

## Giới Thiệu

Trong môi trường doanh nghiệp hiện đại, email đóng vai trò quan trọng trong việc trao đổi thông tin và lưu trữ dữ liệu quan trọng. Việc sao lưu và khôi phục email là một bước không thể thiếu để bảo vệ dữ liệu và đảm bảo hoạt động liên tục của hệ thống.

Zimbra, một hệ thống quản lý email phổ biến, cung cấp các công cụ hỗ trợ việc sao lưu và phục hồi email một cách dễ dàng. Trong bài viết này, chúng ta sẽ hướng dẫn chi tiết cách thực hiện quá trình backup và restore email trên Zimbra.

## 1. Kết Nối SSH Vào Máy Chủ

Trước khi tiến hành backup hoặc restore email, bạn cần SSH vào máy chủ chạy Zimbra bằng lệnh:
```bash
ssh user@your-server-ip
```
Sau đó, chuyển sang tài khoản Zimbra:
```bash
su - zimbra
```

## 2. Hướng Dẫn Backup Mail Trên Zimbra

### 2.1. Sao Lưu Email Của Một Người Dùng Cụ Thể
Sử dụng lệnh sau để sao lưu email của một tài khoản cụ thể:
```bash
zmmailbox -z -m user@domain.com getRestURL "/?fmt=tgz" > /path/to/backup.tgz
```
Ví dụ thực tế:
```bash
zmmailbox -z -m user@example.com getRestURL "/?fmt=tgz" > /opt/zimbra/backup/user-backup.tgz
```

### 2.2. Sao Lưu Tất Cả Email Trên Zimbra
Nếu muốn sao lưu toàn bộ email của tất cả người dùng, hãy sử dụng vòng lặp:
```bash
zmprov -l gaa | while read -r account; do zmmailbox -z -m "$account" getRestURL "/?fmt=tgz" > "/opt/zimbra/backup/backup-$account.tgz"; done

hoặc ###  back up từ list user trong file txt
su - zimbra
while read -r account; do
    zmmailbox -z -m "$account" getRestURL "/?fmt=tgz" > "/opt/zimbra/backup/backup-$account.tgz"
done < /opt/zimbra/backup/user_list.txt

hoặc 
###
su - zimbra
for account in user1@example.com user2@example.com user3@example.com; do
    zmmailbox -z -m "$account" getRestURL "/?fmt=tgz" > "/opt/zimbra/backup/backup-$account.tgz"
done

```

## 3. Hướng Dẫn Restore Mail Trên Zimbra

### 3.1. Khôi Phục Email Của Một Người Dùng Cụ Thể
Dùng lệnh sau để khôi phục email từ tệp backup:
```bash
zmmailbox -z -m user@domain.com postRestURL "/?fmt=tgz&resolve=reset" /path/to/backup.tgz
```
Ví dụ thực tế:
```bash
zmmailbox -z -m user@example.com postRestURL "/?fmt=tgz&resolve=reset" /opt/zimbra/backup/user-backup.tgz
```

### 3.2. Khôi Phục Email Cho Nhiều Người Dùng
Để khôi phục email cho nhiều tài khoản, sử dụng vòng lặp:
```bash
while read -r account; do zmmailbox -z -m "$account" postRestURL "/?fmt=tgz&resolve=reset" "/opt/zimbra/backup/backup-$account.tgz"; done < <(zmprov -l gaa)

hoặc 
###
su - zimbra
for account in user1@example.com user2@example.com user3@example.com; do
    zmmailbox -z -m "$account" postRestURL "/?fmt=tgz&resolve=reset" < "/opt/zimbra/backup/backup-$account.tgz"
done

###hoặc từ list
###
su - zimbra
while read -r account; do
    zmmailbox -z -m "$account" postRestURL "/?fmt=tgz&resolve=reset" < "/opt/zimbra/backup/backup-$account.tgz"
done < /opt/zimbra/backup/user_list.txt

```

## 4. Script Tự Động Backup

### 4.1. Tạo Thư Mục Lưu Backup Và Log
```bash
mkdir -p /opt/zimbra/backup-zimbra/backup
mkdir -p /opt/zimbra/backup-zimbra/logs
touch /opt/zimbra/backup-zimbra/logs/zm.log
touch /opt/zimbra/backup-zimbra/logs/user.log
touch /opt/zimbra/backup-zimbra/logs/cron.log
```

### 4.2. Tạo Script Backup Tự Động
Mở file script:
```bash
nano /opt/zimbra/backup-zimbra/auto-backup.sh
```
Nhập nội dung sau:
```bash
#!/bin/bash
# Script tự động backup email trên Zimbra

backup_dir="/opt/zimbra/backup-zimbra/backup"
date_format=$(date +'%d-%m-%Y')
new_backup_dir="$backup_dir/$date_format"
mkdir -p "$new_backup_dir"
log_file="/opt/zimbra/backup-zimbra/logs/zm.log"
user_log_file="/opt/zimbra/backup-zimbra/logs/user.log"

echo "$(date): Bắt đầu backup" >> "$log_file"

zmprov -l gaa | while read -r account; do
    backup_file="$new_backup_dir/backup-$account.tgz"
    zmmailbox -z -m "$account" getRestURL "/?fmt=tgz" > "$backup_file"
    if [ -f "$backup_file" ]; then
        echo "$(date): Backup thành công cho tài khoản $account" >> "$user_log_file"
    else
        echo "$(date): Backup thất bại cho tài khoản $account" >> "$user_log_file"
    fi
done

backup_count=$(ls -l "$backup_dir" | grep '^d' | wc -l)
if [ "$backup_count" -gt 3 ]; then
    oldest_backup=$(ls -t "$backup_dir" | tail -1)
    rm -rf "$backup_dir/$oldest_backup"
fi

echo "$(date): Backup hoàn tất" >> "$log_file"
```

### 4.3. Phân Quyền Script
```bash
chown -R zimbra:zimbra /opt/zimbra/backup-zimbra/
chmod +x /opt/zimbra/backup-zimbra/auto-backup.sh
```

## 5. Thiết Lập Cron Job Tự Động Backup

### 5.1. Thêm Cron Job
Chạy lệnh:
```bash
su - zimbra
crontab -e
```
Thêm dòng sau để chạy backup vào 18:00 mỗi ngày:
```bash
0 18 * * * /opt/zimbra/backup-zimbra/auto-backup.sh >> /opt/zimbra/backup-zimbra/logs/cron.log 2>&1
```

---


Để sao lưu toàn bộ server Zimbra, bạn có thể thực hiện một trong hai phương pháp chính:  

1. **Sao lưu dữ liệu thư (mailbox) của tất cả tài khoản**  
2. **Sao lưu toàn bộ hệ thống Zimbra (bao gồm cấu hình, email, tệp tin, CSDL, v.v.)**  

---

## 🔹 1. Sao lưu tất cả mailbox của người dùng  
### 📌 Cách này chỉ sao lưu email của tất cả tài khoản trên server  

**Chạy lệnh sau dưới quyền user `zimbra`:**  
```bash
su - zimbra
zmprov -l gaa | while read -r account; do
    zmmailbox -z -m "$account" getRestURL "/?fmt=tgz" > "/opt/zimbra/backup/backup-$account.tgz"
done
```
📌 **Giải thích:**  
- Lệnh `zmprov -l gaa` lấy danh sách tất cả tài khoản trên Zimbra.  
- Dùng vòng lặp `while read -r account` để sao lưu từng tài khoản thành file `.tgz` riêng.  
- Tệp backup được lưu vào thư mục `/opt/zimbra/backup/`.  

✅ **Ưu điểm:**  
- Sao lưu nhanh gọn, chỉ chứa email.  
- Có thể khôi phục từng mailbox riêng lẻ khi cần.  

❌ **Nhược điểm:**  
- Không sao lưu được cấu hình hệ thống, cơ sở dữ liệu hoặc tệp đính kèm bên ngoài.  

---

## 🔹 2. Sao lưu toàn bộ hệ thống Zimbra  
### 📌 Cách này sao lưu toàn bộ dữ liệu, bao gồm:  
✅ Cấu hình Zimbra  
✅ Hộp thư của tất cả tài khoản  
✅ CSDL của Zimbra  
✅ Mail queue  
✅ Log và dữ liệu quan trọng  

📌 **Chạy lệnh sau dưới quyền root:**  
```bash
rsync -avz /opt/zimbra /backup/zimbra-full/
```
Hoặc nếu muốn nén lại:  
```bash
tar -czvf /backup/zimbra-full-$(date +%F).tar.gz /opt/zimbra
```
![](https://img001.prntscr.com/file/img001/PbBT8Zh4TCeZJyhyFwoZeg.png)
📌 **Giải thích:**  
- `rsync -avz /opt/zimbra /backup/zimbra-full/` sao lưu toàn bộ thư mục Zimbra mà không cần nén.  
- `tar -czvf` tạo file backup `.tar.gz` gọn hơn, có thể dễ dàng di chuyển.  
- Bạn có thể lưu backup vào ổ đĩa khác hoặc cloud như Google Drive, OneDrive.  

✅ **Ưu điểm:**  
- Sao lưu đầy đủ toàn bộ hệ thống.  
- Có thể khôi phục toàn bộ server khi bị lỗi nghiêm trọng.  

❌ **Nhược điểm:**  
- Tốn nhiều dung lượng lưu trữ hơn.  
- Khôi phục toàn bộ phức tạp hơn (cần restore cả database và thư mục).  

---

## 🔄 **Khôi phục toàn bộ server từ backup**  
Để khôi phục từ bản sao lưu toàn bộ server (`/backup/zimbra-full/`), thực hiện như sau:  

### 📌 1. Dừng dịch vụ Zimbra trên máy mới  
```bash
su - zimbra -c "zmcontrol stop"
```

### 📌 2. Xóa thư mục Zimbra cũ (nếu có)  
```bash
rm -rf /opt/zimbra
```

### 📌 3. Khôi phục từ backup  
```bash
rsync -avz /backup/zimbra-full/ /opt/zimbra/
```

### 📌 4. Cấp quyền lại cho thư mục  
```bash
chown -R zimbra:zimbra /opt/zimbra
```

### 📌 5. Khởi động lại dịch vụ  
```bash
su - zimbra -c "zmcontrol start"
```

---

💡 **Gợi ý:**  
- Nếu có đủ dung lượng, nên kết hợp cả 2 cách trên để backup email riêng và backup toàn bộ hệ thống.  
- Cấu hình `cron` để sao lưu tự động hàng ngày.  
- Có thể dùng `scp` hoặc `rsync` để đẩy bản backup lên một máy chủ khác hoặc cloud storage.  

