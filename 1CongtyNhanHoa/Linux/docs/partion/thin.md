### **Thin Provisioning Volume trong LVM**

**Thin Provisioning** trong LVM là một kỹ thuật quản lý dung lượng lưu trữ cho phép bạn phân bổ không gian lưu trữ một cách linh hoạt, chỉ cấp phát không gian thực sự khi cần sử dụng. Điều này giúp tiết kiệm tài nguyên đĩa cứng và tối ưu hóa hiệu suất.

![](https://img001.prntscr.com/file/img001/EqfjN63gQdidBIgaN-eAfA.png)
---
```
dd if=/dev/zero of=newfile.txt bs=1G count=1
```
### **Khái niệm cơ bản**
- **Thin Pool**: Một vùng lưu trữ dùng để cấp phát không gian cho các Thin Volume (TV).
- **Thin Volume (TV)**: Một Logical Volume chỉ tiêu thụ dung lượng thực tế khi dữ liệu được ghi vào.

---

### **Lợi ích**
1. **Tiết kiệm dung lượng:** Chỉ sử dụng dung lượng khi dữ liệu được ghi.
2. **Tăng hiệu quả:** Dễ dàng mở rộng mà không cần thêm đĩa ngay lập tức.
3. **Quản lý linh hoạt:** Tạo Logical Volume lớn hơn dung lượng vật lý thực tế (over-provisioning).

---

### **Cách cấu hình Thin Provisioning**

#### **1. Tạo Thin Pool**
Thin Pool là nơi chứa dữ liệu của các Thin Volume. Làm theo các bước sau:

1. **Tạo Physical Volume (PV):**
   ```bash
   pvcreate /dev/sdb
   ```
   (Hoặc sử dụng PV hiện có.)

2. **Tạo Volume Group (VG):**
   Nếu VG chưa tồn tại:
   ```bash
   vgcreate my_vg_name /dev/sdb
   ```

3. **Tạo Thin Pool Logical Volume:**
   ```bash
   lvcreate -L 50G -T my_vg_name/thin_pool_name
   ```
   Trong đó:
   - `-L 50G`: Kích thước Thin Pool.
   - `-T`: Tạo Thin Pool.

---

#### **2. Tạo Thin Volume**
Thin Volume được tạo từ Thin Pool:

1. **Tạo Thin Volume từ Thin Pool:**
   ```bash
   lvcreate -V 20G -T my_vg_name/thin_pool_name -n thin_volume_name
   ```
   Trong đó:
   - `-V 20G`: Dung lượng logic của Thin Volume.
   - `-T`: Gắn Thin Volume vào Thin Pool.
   - `-n`: Tên Thin Volume.

2. **Định dạng hệ thống tập tin:**
   ```bash
   mkfs.ext4 /dev/my_vg_name/thin_volume_name
   ```

3. **Gắn Thin Volume:**
   ```bash
   mount /dev/my_vg_name/thin_volume_name /mnt/thin_volume
   ```

---

#### **3. Quản lý và giám sát Thin Provisioning**
1. **Kiểm tra Thin Pool và Thin Volume:**
   ```bash
   lvs -a
   ```
   Bạn sẽ thấy thông tin về Thin Pool và các Thin Volume.

2. **Giám sát dung lượng Thin Pool:**
   - Sử dụng lệnh:
     ```bash
     lvs -o+thin_pool,thin_count
     ```

3. **Mở rộng Thin Pool nếu cần:**
   Nếu Thin Pool gần đầy, mở rộng nó:
   ```bash
   lvextend -L +10G my_vg_name/thin_pool_name
   ```

---

### **Lưu ý khi sử dụng Thin Provisioning**
1. **Over-Provisioning:** Nếu bạn tạo quá nhiều Thin Volume với dung lượng logic vượt quá dung lượng thực tế, Thin Pool có thể đầy, dẫn đến lỗi khi ghi dữ liệu. Hãy theo dõi sát sao dung lượng.
2. **Snapshot:** Thin Provisioning hỗ trợ snapshot, rất hữu ích khi sao lưu hoặc kiểm tra.
3. **Cần giám sát:** Sử dụng công cụ như `lvs` để đảm bảo không bị thiếu dung lượng vật lý trong Thin Pool.

---
😊
