Dưới đây là phiên bản viết lại của hướng dẫn reset mật khẩu root trên Ubuntu:

---

### Hướng Dẫn Reset Mật Khẩu Root Trên Ubuntu

#### Bước 1: Truy Cập Menu GRUB
Đầu tiên, bạn cần khởi động lại hoặc bật nguồn hệ thống Ubuntu của mình. Khi hệ thống đang khởi động, hãy nhấn phím **Shift** hoặc **ESC** trên bàn phím để hiển thị menu GRUB, nơi cung cấp các tùy chọn khởi động cho hệ thống của bạn.
![](https://img001.prntscr.com/file/img001/HSZkQJpzTaWUm_3JFK_fAg.png)
*Menu GRUB của Ubuntu*

#### Bước 2: Chỉnh Sửa Tùy Chọn Menu GRUB
Khi bạn đã vào menu GRUB, sử dụng phím mũi tên để điều hướng đến mục Ubuntu và nhấn phím **'e'** để chỉnh sửa các tham số grub.
![](https://img001.prntscr.com/file/img001/-YqENFnUS9qA6-cEuOhYwQ.png)
*Tham số khởi động GRUB*

**Tìm Tham Số Khởi Động GRUB**
Tìm đến đoạn có chứa "ro maybe-". Thay thế "ro maybe-" bằng `rw init=/bin/bash` như hình minh họa. Điều này sẽ thiết lập hệ thống tệp gốc với các lệnh đọc và ghi được ký hiệu bởi tiền tố `rw`.
![](https://img001.prntscr.com/file/img001/0suwQLdsQ1a5woL652RbPg.png)
*Bật Hệ Thống Tệp Gốc*

Sau đó, nhấn **Ctrl + x** hoặc **F10** để khởi động lại hệ thống.

#### Bước 3: Gắn Kết Hệ Thống Tệp Gốc
Hệ thống của bạn sẽ khởi động vào màn hình shell root như hình dưới. Bạn có thể xác nhận rằng hệ thống tệp gốc đã có quyền đọc và ghi bằng cách chạy lệnh:
```bash
# mount | grep -w /
```
Kết quả trong hình dưới đây xác nhận quyền truy cập đọc và ghi được ký hiệu bởi `rw`.
![](https://img001.prntscr.com/file/img001/tnRksb-YQOm-KZ1rOobgrA.png)
*Xác Nhận Quyền Truy Cập Hệ Thống Tệp Gốc*

#### Bước 4: Đặt Lại Mật Khẩu Root
Khi hệ thống tệp gốc đã được gắn kết ở chế độ đọc-ghi, bạn có thể đặt lại mật khẩu root bằng lệnh:
```bash
# passwd
```
Nhập mật khẩu mới và xác nhận. Sau đó, bạn sẽ nhận được thông báo ‘password updated successfully’.
![](https://img001.prntscr.com/file/img001/p7tP-UBHQYeLTvxFOd2C6w.png)
*Đặt Lại Mật Khẩu Root Trong Ubuntu*

Sau khi đặt lại mật khẩu root, hãy gắn kết lại hệ thống tệp gốc ở chế độ chỉ đọc để tăng cường bảo mật hệ thống:
```bash
mount -o remount,ro /
```

Cuối cùng, khởi động lại hệ thống Ubuntu của bạn để áp dụng các thay đổi và cho phép bạn đăng nhập với mật khẩu root mới:
```bash
exec /sbin/init
```
**Hoặc:**
```bash
reboot
```

---

Hy vọng phần viết lại này rõ ràng và dễ hiểu hơn! Nếu bạn cần thêm điều chỉnh hoặc bổ sung gì, hãy cho tôi biết nhé.
