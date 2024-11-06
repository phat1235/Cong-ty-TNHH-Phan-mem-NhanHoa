Tạo một script tự động sao lưu máy ảo KVM trên Ubuntu 18.04. Script này sẽ sao lưu máy ảo `ubuntu18.04` mỗi 2 phút một lần và tạo một bản sao lưu đầy đủ sau 10 phút.

### 1. Cài Đặt Công Cụ Cần Thiết

Trước tiên, đảm bảo rằng bạn đã cài đặt `qemu-kvm` và `libvirt` trên hệ thống của bạn. Nếu chưa, bạn có thể cài đặt bằng cách:

```bash
sudo apt update
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients
```

### 2. Tạo Script Sao Lưu

Mở terminal và tạo một file script mới:

```bash
sudo nano /var/backups/backup_ubuntu_vm.sh
```

Dán đoạn mã sau vào file:

```bash
#!/bin/bash

# Cau hinh
BACKUP_DIR="/var/backups"  # Duong dan luu tru backup
DATE=$(date +"%Y%m%d_%H%M%S")  # Thoi gian backup
LOG_FILE="/var/log/kvm_backup.log"  # Duong dan file log

# Ten may ao can sao luu
VM_NAME="ubuntu18.04"

# Ham ghi log
log() {
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] $1" >> $LOG_FILE
}

# Lay so phut da troi ke tu luc dau
START_TIME_FILE="/tmp/backup_start_time"
if [ ! -f "$START_TIME_FILE" ]; then
    date +%s > "$START_TIME_FILE"
fi
START_TIME=$(cat "$START_TIME_FILE")
CURRENT_TIME=$(date +%s)
DIFF_TIME=$((CURRENT_TIME - START_TIME))
DIFF_MINUTES=$((DIFF_TIME / 60))

log "Bat dau sao luu may ao $VM_NAME vao $DATE"

# Thuc hien backup
IMAGE_PATH="/var/lib/libvirt/images/${VM_NAME}.qcow2"  # Duong dan file anh dia
CONFIG_PATH="/etc/libvirt/qemu/${VM_NAME}.xml"  # Duong dan file cau hinh

if [ "$DIFF_MINUTES" -lt 10 ]; then
    BACKUP_IMAGE="${BACKUP_DIR}/${VM_NAME}_incremental_${DATE}.qcow2"
    BACKUP_CONFIG="${BACKUP_DIR}/${VM_NAME}_config_incremental_${DATE}.xml"
    
    log "Thuc hien backup incremental"
    # Sao chep file anh dia bang qemu-img
    qemu-img convert -O qcow2 "$IMAGE_PATH" "$BACKUP_IMAGE"  # Sao chep voi dinh dang qcow2 ho tro snapshot
    
    log "Sao chep file cau hinh tu $CONFIG_PATH den $BACKUP_CONFIG"
    cp "$CONFIG_PATH" "$BACKUP_CONFIG"  # Sao luu file cau hinh
else
    BACKUP_IMAGE="${BACKUP_DIR}/${VM_NAME}_full_${DATE}.qcow2"
    BACKUP_CONFIG="${BACKUP_DIR}/${VM_NAME}_config_full_${DATE}.xml"
    
    log "Thuc hien backup day du"
    qemu-img convert -O qcow2 "$IMAGE_PATH" "$BACKUP_IMAGE"  # Snapshot qcow2

    log "Sao chep file cau hinh tu $CONFIG_PATH den $BACKUP_CONFIG"
    cp "$CONFIG_PATH" "$BACKUP_CONFIG"  # Sao luu file cau hinh

    rm "$START_TIME_FILE"  # Xoa file luu thoi gian bat dau
fi

log "Hoan tat: Sao luu tai: ${BACKUP_IMAGE}."

```

![](https://img001.prntscr.com/file/img001/SL6kwf1eTxudBb6MFi6W3A.png)
### 3. Cấp Quyền Thực Thi Cho Script

Sau khi lưu file, bạn cần cấp quyền thực thi cho script:

```bash
sudo chmod +x /var/backups/backup_ubuntu_vm.sh
```

### 4. Chạy Script

Bạn có thể chạy script bằng lệnh:

```bash
sudo /var/backups/backup_ubuntu_vm.sh
```

### 5. Tự Động Hóa Sao Lưu

Để tự động chạy script mỗi 2 phút, bạn có thể sử dụng `cron`. Mở crontab để chỉnh sửa:

```bash
sudo crontab -e
```

Thêm dòng sau vào cuối file để chạy script mỗi 2 phút:

```bash
*/2 * * * * /var/backups/backup_ubuntu_vm.sh
```
![](https://img001.prntscr.com/file/img001/Nmo9PPkKTL-FtC8fXf_2Zg.png)
### 6. Kiểm Tra Kết Quả Sao Lưu

Sau khi chạy script hoặc khi cron tự động chạy, bạn có thể kiểm tra thư mục `/var/backups` để xem các file sao lưu được tạo ra. Các file backup sẽ có tên như sau:

- `ubuntu18.04_incremental_YYYYMMDD_HHMMSS.qcow2` cho các bản sao lưu tăng dần.
- `ubuntu18.04_full_YYYYMMDD_HHMMSS.qcow2` cho bản sao lưu đầy đủ.

![](https://img001.prntscr.com/file/img001/EUZP1gGBRUOW54QqVD14aw.png)
### 7. Xem Log

Các thông tin log sẽ được lưu vào file `/var/log/kvm_backup.log`, bạn có thể xem file log này để kiểm tra các thông tin về quá trình sao lưu.

```bash
cat /var/log/kvm_backup.log
```
![](https://img001.prntscr.com/file/img001/lBrfyQR-RG29gCM28YKpmw.png)
