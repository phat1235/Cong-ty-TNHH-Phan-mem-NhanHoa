## VM la Linux

1. **`virt-customize` đã được cài đặt**:
   ```bash
   sudo apt update
   sudo apt install libguestfs-tools
   ```

2. **Thay đổi mật khẩu của người dùng `phat` và `root`**:

   ```bash
   sudo virt-customize -d ubuntu18.04 --password phat:password:1234567
   ```

```
sudo virt-customize -d ubuntu18.04 --root-password password:12345678

```
Trong đó:
- `-d ubuntu18.04` là tên của máy ảo.
- `--password phat:password:1234567` sẽ đặt mật khẩu mới (`1234567`) cho người dùng `phat`.


## VM la Windowns
 Vì `virt-customize` chủ yếu hỗ trợ các máy ảo Linux.
chntpw
### 1. **Sử dụng Công cụ `chntpw` để chỉnh sửa registry của Windows**
   - **Bước 1**: Tắt máy ảo Windows và gắn (mount) phân vùng ổ đĩa của máy ảo Windows vào hệ thống của bạn bằng công cụ như `guestmount`.
     ```bash
     sudo guestmount -a /path/to/windows-disk.qcow2 -i --rw /mnt
     ```
   - **Bước 2**: Cài đặt `chntpw` nếu chưa có:
     ```bash
     sudo apt install chntpw
     ```
   - **Bước 3**: Dùng `chntpw` để đặt lại mật khẩu:
     ```bash
     sudo chntpw -u "Tên Người Dùng" /mnt/Windows/System32/config/SAM
     ```
   - **Bước 4**: Tháo gắn (unmount) phân vùng:
     ```bash
     sudo umount /mnt
     ```
