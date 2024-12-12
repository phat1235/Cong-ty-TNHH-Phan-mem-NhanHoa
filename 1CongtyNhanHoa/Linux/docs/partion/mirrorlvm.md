

1. **Tạo phân vùng vật lý (Physical Volume)**:
   ```bash
   sudo pvcreate /dev/sdf1 /dev/sdg1
   ```

2. **Tạo nhóm dung lượng (Volume Group)**:
   ```bash
   sudo vgcreate vg_mirror /dev/sdf1 /dev/sdg1
   ```

3. **Tạo phân vùng logic bản sao (Mirrored Logical Volume) trên các ổ cứng khác nhau**:
   ```bash
   sudo lvcreate -L 1.5G -m1 -n lv_mirror vg_mirror /dev/sdf1 /dev/sdg1
   ```
   Tham số `-m1` chỉ định rằng chúng ta muốn tạo một bản sao của phân vùng logic. Kích thước của phân vùng logic là 1.5GB để phù hợp với dung lượng 2GB của mỗi ổ đĩa.

4. **Định dạng phân vùng logic**:
   ```bash
   sudo mkfs.ext4 /dev/vg_mirror/lv_mirror
   ```

5. **Tạo điểm gắn kết và gắn phân vùng logic**:
   ```bash
   sudo mkdir /mnt/mirror
   sudo mount /dev/vg_mirror/lv_mirror /mnt/mirror
   ```

6. **Cập nhật file `/etc/fstab` để tự động gắn phân vùng logic sau khi khởi động lại hệ thống**:
   ```bash
   echo '/dev/vg_mirror/lv_mirror /mnt/mirror ext4 defaults 0 0' | sudo tee -a /etc/fstab
   ```
---

1. **Chặn thiết bị `sdg`**:
   ```bash
   echo 1 | sudo tee /sys/block/sdg/device/delete
   ```

2. **Kiểm tra trạng thái của LVM**:
   ```bash
   sudo lvs -a -o +devices
   ```

   Lúc này, bạn sẽ thấy rằng LVM sẽ chỉ còn nhận diện một ổ cứng duy nhất (trường hợp này là `sdf`).

3. **Kiểm tra khả năng truy cập dữ liệu**:
   - Đảm bảo rằng ta có thể truy cập và đọc/ghi dữ liệu từ phân vùng logic `lv_mirror`.
  
    =>ở /mnt/mirror

4. **Thêm lại thiết bị `sdg`**:
   - Sau khi kiểm tra, ta có thể thêm lại thiết bị `sdg` bằng cách scan lại thiết bị:
   ```bash
   echo "- - -" | sudo tee /sys/class/scsi_host/host*/scan
   ```

5. **Kiểm tra và sửa chữa nếu cần thiết**:
   ```bash
   sudo lvconvert --repair /dev/vg_mirror/lv_mirror
   ```
