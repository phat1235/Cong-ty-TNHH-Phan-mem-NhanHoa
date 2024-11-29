### Hướng dẫn sử dụng Logical Volume Manager (LVM) trên Linux

**Logical Volume Manager (LVM)** là một công cụ trên Linux giúp quản lý ổ cứng và các thiết bị lưu trữ khác. Công cụ này cho phép tổ chức không gian lưu trữ thô thành các **logical volume**, giúp việc cấu hình và sử dụng trở nên dễ dàng hơn. 

Bài viết hướng dẫn từng bước sử dụng LVM để tạo phân vùng, **physical volume**, **volume group**, **logical volume**, và **filesystem**. Ngoài ra, còn giới thiệu cách gắn kết, mở rộng và xóa logical volume.

---

#### **Những nội dung bạn sẽ học:**
- Cài đặt LVM trên các bản phân phối Linux phổ biến.
- Tạo phân vùng.
- Tạo physical volume.
- Tạo volume group.
- Tạo logical volume.
- Tạo filesystem trên logical volume.
- Chỉnh sửa **fstab** để tự động gắn kết phân vùng.
- Mở rộng logical volume.
- Xóa logical volume.

---

#### **Yêu cầu:**
- Hệ thống Linux với quyền root hoặc **sudo**.
- Cài đặt gói **LVM tools**.

---

### **1. Cài đặt LVM trên các bản Linux phổ biến**
- **Ubuntu/Debian/Linux Mint:**
  ```bash
  sudo apt install lvm2
  ```
- **CentOS/Fedora/Red Hat/AlmaLinux:**
  ```bash
  sudo dnf install lvm2
  ```
- **Arch Linux/Manjaro:**
  ```bash
  sudo pacman -S lvm2
  ```

---

### **2. Tạo phân vùng**
- Xác định ổ đĩa với `fdisk`:
  ```bash
  sudo fdisk -l
  ```
- Sử dụng `cfdisk` để tạo phân vùng:
  ```bash
  sudo cfdisk /dev/sdb
  ```
- Lưu thay đổi và kiểm tra các phân vùng vừa tạo:
  ```bash
  sudo fdisk -l
  ```

---

### **3. Tạo physical volume**
Sử dụng lệnh `pvcreate` để tạo physical volume:
```bash
sudo pvcreate /dev/sdb1
sudo pvcreate /dev/sdb2
```
Xem thông tin:
```bash
sudo pvdisplay
```

---

### **4. Tạo volume group**
- Tạo volume group chứa physical volume:
  ```bash
  sudo vgcreate mynew_vg /dev/sdb1 /dev/sdb2
  ```
- Kiểm tra thông tin volume group:
  ```bash
  sudo vgdisplay
  ```

---

### **5. Tạo logical volume**
- Tạo logical volume `vol01` kích thước 400MB:
  ```bash
  sudo lvcreate -L 400 -n vol01 mynew_vg
  ```
- Tạo thêm logical volume `vol02` kích thước 1GB:
  ```bash
  sudo lvcreate -L 1000 -n vol02 mynew_vg
  ```
- Kiểm tra thông tin logical volume:
  ```bash
  sudo lvdisplay
  ```

---

### **6. Tạo filesystem**
Tạo **ext4 filesystem** trên logical volume:
```bash
sudo mkfs.ext4 -m 0 /dev/mynew_vg/vol01
```

---

### **7. Gắn kết và tự động hóa**
- Tạo điểm gắn kết và gắn logical volume:
  ```bash
  sudo mkdir /mnt/vol01
  sudo mount /dev/mynew_vg/vol01 /mnt/vol01
  ```
- Thêm vào file `/etc/fstab` để tự động gắn:
  ```bash
  echo '/dev/mynew_vg/vol01 /mnt/vol01 ext4 defaults 0 0' | sudo tee -a /etc/fstab
  ```

---

### **8. Mở rộng logical volume**
- Mở rộng logical volume thêm 800MB:
  ```bash
  sudo lvextend -L +800 /dev/mynew_vg/vol01
  ```
- Điều chỉnh filesystem để sử dụng không gian mới:
  ```bash
  sudo resize2fs /dev/mynew_vg/vol01
  ```

---

### **9. Xóa logical volume**
- Tháo logical volume và xóa:
  ```bash
  sudo umount /mnt/vol01
  sudo lvremove /dev/mynew_vg/vol02
  ```

---

### **Tổng kết**
Hướng dẫn trên giúp bạn nắm được cách tạo, quản lý và sử dụng LVM trên Linux, từ việc tạo phân vùng, physical volume đến logical volume và filesystem. Bạn có thể áp dụng để triển khai cấu hình lưu trữ theo nhu cầu.

---
---

bạn có thể giảm kích thước của một Logical Volume (LV) trong LVM, nhưng việc này cần thận trọng để tránh mất dữ liệu. 

1. **Kiểm tra dung lượng đã sử dụng**:  
   Trước khi giảm, kiểm tra dung lượng thực tế đang sử dụng bằng lệnh:  
   ```bash
   df -h /đường/dẫn/gắn/kết
   ```

2. **Giảm kích thước hệ thống tệp (filesystem)**:  
   Nếu hệ thống tệp của bạn hỗ trợ giảm kích thước (như `ext4`), hãy thu nhỏ nó bằng lệnh:  
   ```bash
   resize2fs /dev/volume_group/logical_volume kích_thước_mới
   ```  
   Ví dụ:  
   ```bash
   resize2fs /dev/my_vg/my_lv 10G
   ```  

3. **Tháo Logical Volume** (nếu cần):  
   Đảm bảo không có hoạt động ghi/đọc bằng cách gỡ gắn kết:  
   ```bash
   umount /đường/dẫn/gắn/kết
   ```

4. **Giảm kích thước Logical Volume**:  
   Sau khi thu nhỏ hệ thống tệp, sử dụng lệnh sau để giảm kích thước Logical Volume:  
   ```bash
   lvreduce -L kích_thước_mới /dev/volume_group/logical_volume
   ```  
   Ví dụ:  
   ```bash
   lvreduce -L 10G /dev/my_vg/my_lv
   ```  

5. **Kiểm tra lại hệ thống tệp**:  
   Sau khi giảm kích thước, kiểm tra lại tính toàn vẹn của hệ thống tệp:  
   ```bash
   e2fsck -f /dev/volume_group/logical_volume
   ```

6. **Gắn lại Logical Volume**:  
   Nếu đã tháo Logical Volume, hãy gắn lại:  
   ```bash
   mount /dev/volume_group/logical_volume /đường/dẫn/gắn/kết
   ```  

### Lưu ý:  
- Sao lưu dữ liệu trước khi thực hiện, vì quá trình giảm có thể gây mất dữ liệu nếu không cẩn thận.  
- Một số hệ thống tệp không hỗ trợ giảm kích thước (như `xfs`). Trong trường hợp này, bạn cần tạo Logical Volume mới với kích thước mong muốn, sao chép dữ liệu và sau đó xóa Logical Volume cũ.
