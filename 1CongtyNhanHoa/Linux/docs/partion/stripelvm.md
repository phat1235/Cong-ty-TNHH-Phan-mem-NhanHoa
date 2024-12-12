
Để cấu hình Stripe LVM với các phân vùng `/dev/sdc1`, `/dev/sdd1`, và `/dev/sde1`:

1. **Tạo phân vùng vật lý (Physical Volume)**:
   ```bash
   sudo pvcreate /dev/sdc1 /dev/sdd1 /dev/sde1
   ```

2. **Tạo nhóm dung lượng (Volume Group)**:
   ```bash
   sudo vgcreate vg_stripe /dev/sdc1 /dev/sdd1 /dev/sde1
   ```

3. **Tạo phân vùng logic với cấu hình stripe (Logical Volume with Stripe Configuration)**:
   ```bash
   sudo lvcreate -L 3G -i3 -I64 -n lv_stripe vg_stripe
   ```
   - Tham số `-i3` chỉ định rằng chúng ta sẽ stripe dữ liệu trên 3 ổ đĩa.
   - Tham số `-I64` chỉ định kích thước stripe là 64KB ( tùy theo nhu cầu).
   - Kích thước của phân vùng logic là 3GB để tận dụng hết dung lượng của 3 phân vùng 1GB.

4. **Định dạng phân vùng logic**:
   ```bash
   sudo mkfs.ext4 /dev/vg_stripe/lv_stripe
   ```

5. **Tạo điểm gắn kết và gắn phân vùng logic**:
   ```bash
   sudo mkdir /mnt/stripe
   sudo mount /dev/vg_stripe/lv_stripe /mnt/stripe
   ```

6. **Cập nhật file `/etc/fstab` để tự động gắn phân vùng logic sau khi khởi động lại hệ thống**:
   ```bash
   echo '/dev/vg_stripe/lv_stripe /mnt/stripe ext4 defaults 0 0' | sudo tee -a /etc/fstab
   ```
