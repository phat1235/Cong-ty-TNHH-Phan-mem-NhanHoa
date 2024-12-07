
## Phần 1: Tạo Logical Volume trên LVM
### Bước 1: Kiểm tra các ổ cứng hiện tại
```
# lsblk
```


### Bước 2: Tạo Partition
```
# fdisk /dev/sdb
```


Tháo tác:
- Chọn n để bắt đầu tạo partition
-	Chọn p để tạo partition primary
-	Chọn 1 để tạo partition primary 1
-	Tại First sector (2048-20971519, default 2048) để mặc định
-	Tại Last sector, +sectors or +size{K,M,G} (2048-20971519, default 20971519) chọn +1G để partition bạn tạo ra có dung lượng 1 G
-	Chọn w để lưu lại và thoát.

Tháo tác:
- Chọn t để thay đổi định dạng partition
- Chọn 8e để đổi thành LVM

Lặp các bước với sdc

### Bước 3: Tạo Physical Volume

Tạo các Physical Volume là /dev/sdb1 và /dev/sdc1 bằng các lệnh:
```
# pvcreate /dev/sdb1
# pvcreate /dev/sdc1
```

### Bước 4: Tạo Volume Group
Nhóm các Physical Volume thành 1 Volume Group bằng:

Kiểm tra lại các Volume Group đã tạo:
```
# vgs
# vgdisplay
```

### Bước 5: Tạo Logical Volume
```
 lvcreate -L 1G -n lv-demo1 vg-demo1
```
> -L: Chỉ ra dung lượng của logical volume
> -n: Chỉ ra tên của logical volume
> Note: lv-demo1 là tên Logical Volume, vg-demo1 là Volume Group mà vừa tạo

Kiểm tra:
```
# lvs
# lvdisplay
```

### Bước 6: Định dạng Logical Volume
```
 mkfs -t ext4 /dev/vg-demo1/lv-demo1
```


### Bước 7: Mount và sử dụng
Tạo thư mục mount
```
 mkdir demo1
```

Tiến hành mount logical volume lv-demo1 vào thư mục demo1
```
 mount /dev/vg-demo1/lv-demo1 demo1
```
![](PIC/basic-lvm-12.png)

Kiểm tra lại dung lượng
```
df -h
```
![](PIC/basic-lvm-13.png)

## Phần 2: Thay đổi dung lượng Logical Volume trên LVM
### 2.1 - Kiểm tra toàn bộ

### 2.2 - Kiểm tra dung lượng Volume Group
Trước khi tăng, cần kiểm tra xem Volume Group còn dư dung lượng để kéo dãn
```
 vgdisplay
```
### 2.3 - Tăng kích thước Logical Volume
Để tăng kích thước Logical Volume, sử dụng câu lệnh sau:
```
# lvextend -L +50M /dev/vg-demo1/lv-demo1
```
Kiểm tra lại
```
lvs
```

> Kích thước cho Logical Volume thì Logical Volume đã được tăng nhưng file system trên volume này vẫn chưa thay đổi, sử dụng lệnh sau:
```
# resize2fs /dev/vg-demo1/lv-demo1
```


## Phần 3: Thay đổi dung lượng Volume Group trên LVM
Việc thay đổi kích thước của Volume Group chính là việc nhóm thêm Physical Volume hay thu hồi Physical Volume ra khỏi Volume Group
### 3.1 - Kiểm tra lại các partition và Volume Group
```
# vgs
# lsblk
```
### 3.2 - Nhóm thêm partition vào Volume Group
Nhóm thêm 1 partition vào Volume Group như sau:
```
# vgextend /dev/vg-demo1 /dev/sdc2
```
### 3.3 - Cắt Physical Volume ra khỏi Volume Group
Cắt 1 Physical Volume ra khỏi Volume Group như sau:
```
 vgreduce /dev/vg-demo1 /dev/sdc2
```

## Phần 4: Xóa Logical Volume, Volume Group, Physical Volume
Trước tiên ta phải Umount Logical Volume
```
 umount /dev/vg-demo1/lv-demo1
```
### 4.1 - Xóa Logical Volume
Xóa Logical Volume bằng câu lệnh sau:
```
# lvremove /dev/vg-demo1/lv-demo1
```
![](PIC/basic-lvm-24.png)
![](PIC/basic-lvm-25.png)

### 4.2 - Xóa Volume Group
Trước khi xóa Volume Group, chúng ta phải xóa hết Logical Volume
```
# vgremove /dev/vg-demo1
```
![](PIC/basic-lvm-26.png)

### 4.3 - Xóa Physical Volume
```
# pvremove /dev/sdc2
```
![](PIC/basic-lvm-27.png)
---

## 1. Tăng giảm 
### **1. Cách kiểm tra kích thước hệ thống tập tin**
- Sau khi thay đổi kích thước Logical Volume, bạn có thể kiểm tra kích thước của hệ thống tập tin bằng lệnh:
  ```bash
  dumpe2fs /dev/vg_name/lv_name | grep -i 'block count\|block size'
  ```
  Nếu kích thước của hệ thống tập tin nhỏ hơn kích thước của LV, cần chạy `resize2fs`.

---

### **Ví dụ**
#### **Mở rộng Logical Volume và hệ thống tập tin:**
1. Mở rộng LV:
   ```bash
   lvextend -L+500M /dev/vg_name/lv_name
   ```
2. Mở rộng hệ thống tập tin:
   ```bash
   resize2fs /dev/vg_name/lv_name
   ```
3. Kiểm tra kết quả:
   ```bash
   df -h
   ```

#### **Giảm Logical Volume và hệ thống tập tin:**
1. Kiểm tra và sửa lỗi hệ thống tập tin (nếu có):
   ```bash
   e2fsck -f /dev/vg_name/lv_name
   ```
2. Thu nhỏ hệ thống tập tin:
   ```bash
   resize2fs /dev/vg_name/lv_name 5G
   ```
3. Thu nhỏ Logical Volume:
   ```bash
   lvreduce -L 5G /dev/vg_name/lv_name
   ```
4. Kiểm tra kết quả:
   ```bash
   df -h
   ```

---
---


### **1. Các loại Logical Volume trong LVM**

#### a. **Linear Logical Volume**
- **Mô tả**: Đây là loại logical volume (LV) cơ bản, trong đó các dữ liệu được lưu trữ tuần tự trên các Physical Volume (PV). Dung lượng của LV được giới hạn bởi tổng dung lượng của các PV trong Volume Group (VG).
- **Ưu điểm**: Đơn giản và dễ sử dụng, phù hợp cho nhu cầu lưu trữ thông thường.
- **Nhược điểm**: Không tối ưu về hiệu suất hoặc khả năng mở rộng, thiếu tính năng như Striping hoặc Mirroring.

#### b. **Striped Logical Volume**
- **Mô tả**: Trong loại này, dữ liệu được chia thành các khối (strip) và phân phối đều trên nhiều PV trong VG, tương tự như RAID 0. Điều này giúp tăng tốc độ đọc/ghi do việc truy xuất dữ liệu song song trên nhiều thiết bị lưu trữ.
- **Ưu điểm**: Tăng tốc độ I/O (đọc/ghi) do dữ liệu được phân phối đồng đều.
- **Nhược điểm**: Không có khả năng bảo vệ dữ liệu, nếu một PV bị hỏng, tất cả dữ liệu sẽ bị mất.

#### c. **Mirrored Logical Volume**
- **Mô tả**: Dữ liệu được sao chép đồng thời trên nhiều PV, giống như RAID 1, giúp bảo vệ dữ liệu. Nếu một PV bị hỏng, bản sao của dữ liệu trên PV khác vẫn có thể sử dụng được.
- **Ưu điểm**: Cung cấp bảo vệ dữ liệu, đảm bảo tính toàn vẹn của dữ liệu.
- **Nhược điểm**: Tốn dung lượng do việc sao chép dữ liệu (tốn gấp đôi dung lượng).

#### d. **Thin-provisioned Logical Volume**
- **Mô tả**: Đây là loại LV được cấp phát không gian lưu trữ khi có dữ liệu được ghi vào (không cấp phát toàn bộ không gian ngay từ đầu). Thin provisioning giúp tiết kiệm dung lượng lưu trữ vì không gian không được sử dụng sẽ không được cấp phát.
- **Ưu điểm**: Tiết kiệm không gian lưu trữ, chỉ sử dụng dung lượng thực tế khi có dữ liệu được ghi.
- **Nhược điểm**: Cần quản lý cẩn thận để tránh việc hết không gian nếu các LV dùng nhiều dung lượng mà không được giám sát.

---

### **2. Các thao tác cơ bản trên LVM**

#### a. **Tạo Physical Volume (PV)**
```bash
pvcreate /dev/sdX
```

#### b. **Tạo Volume Group (VG)**
```bash
vgcreate my_vg /dev/sdX /dev/sdY
```

#### c. **Tạo Logical Volume (LV)**
```bash
lvcreate -L 10G -n my_lv my_vg
```

#### d. **Xem thông tin LVM**
```bash
pvdisplay
vgdisplay
lvdisplay
```

#### e. **Mở rộng Logical Volume (LV)**
```bash
lvextend -L +5G /dev/my_vg/my_lv
resize2fs /dev/my_vg/my_lv
```

#### f. **Thu nhỏ Logical Volume (LV)**
```bash
lvreduce -L 5G /dev/my_vg/my_lv
resize2fs /dev/my_vg/my_lv
```

#### g. **Xóa Logical Volume**
```bash
lvremove /dev/my_vg/my_lv
```

---

### **3. LVM Snapshot**

LVM Snapshot là một bản sao của một LV tại thời điểm tạo snapshot. Snapshots thường được sử dụng để sao lưu dữ liệu hoặc để khôi phục lại dữ liệu nếu có sự cố.

#### a. **Tạo Snapshot**
```bash
lvcreate -L 5G -s -n snapshot_lv /dev/my_vg/my_lv
```
- `-L 5G`: Kích thước của snapshot.
- `-s`: Đánh dấu là snapshot.
- `-n snapshot_lv`: Tên snapshot.

#### b. **Khôi phục từ Snapshot**
```bash
lvconvert --merge /dev/my_vg/snapshot_lv
```
- Lưu ý: Sau khi khôi phục từ snapshot, cần khởi động lại hệ thống.

#### c. **Xóa Snapshot**
```bash
lvremove /dev/my_vg/snapshot_lv
```

---

### **4. Thin Provisioning Volume**

Thin provisioning là kỹ thuật cấp phát dung lượng chỉ khi dữ liệu thực sự được ghi vào (không cấp phát dung lượng ngay từ đầu). Điều này giúp tiết kiệm dung lượng lưu trữ khi không gian không được sử dụng.

#### a. **Tạo Thin Pool**
```bash
lvcreate -L 50G --name thin_pool --type thin-pool my_vg
```

#### b. **Tạo Thin Logical Volume**
```bash
lvcreate -V 10G --name thin_lv --thin my_vg/thin_pool
```

- `-V`: Kích thước LV trong dạng "thinner" (sẽ chỉ chiếm dung lượng thực tế khi có dữ liệu).

#### c. **Xem thông tin Thin Pool**
```bash
lvs --segments
```

---

### **5. Striped Logical Volume**

Striping (tương tự RAID 0) chia dữ liệu thành các khối và lưu trữ trên nhiều PV để tăng tốc độ đọc/ghi. Đây là một cách để cải thiện hiệu suất khi làm việc với các dữ liệu yêu cầu băng thông cao, ví dụ như các cơ sở dữ liệu lớn.

#### a. **Tạo Striped Logical Volume**
```bash
lvcreate -L 10G -i 2 -n striped_lv my_vg
```
- `-i 2`: Chỉ định số lượng PV tham gia vào việc striping (số lượng "cột" của striping).

---

### **6. Mirrored Logical Volume**

Mirroring (tương tự RAID 1) tạo các bản sao của dữ liệu để bảo vệ dữ liệu, nếu một thiết bị hỏng thì bản sao vẫn có thể sử dụng được.

#### a. **Tạo Mirrored Logical Volume**
```bash
lvcreate -L 10G -m 1 -n mirrored_lv my_vg
```
- `-m 1`: Tạo một bản sao (1 mirror), tạo ra một bản sao của dữ liệu lưu trữ trên một PV khác.

---

### **7. Cache Logical Volume**

Cache LV sử dụng một ổ đĩa nhanh (như SSD) để làm bộ nhớ đệm cho một LV chậm hơn (như HDD). Đây là cách tối ưu để cải thiện hiệu suất mà không cần thay đổi nhiều về phần cứng.

#### a. **Tạo Cache Logical Volume**
1. Tạo LV chính:
   ```bash
   lvcreate -L 100G -n main_lv my_vg
   ```

2. Tạo Cache LV:
   ```bash
   lvcreate -L 10G -n cache_lv --type cache my_vg
   ```

3. Thiết lập bộ nhớ cache:
   ```bash
   lvcreate -L 10G --type cache --name cache my_vg/main_lv /dev/sdX
   ```

---


