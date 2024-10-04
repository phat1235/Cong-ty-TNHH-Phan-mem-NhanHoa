### 1. **Disable USB Devices Using sysfs**
Một phương pháp khác là vô hiệu hóa các cổng USB thông qua **sysfs**.
![](https://img001.prntscr.com/file/img001/Hqa6wfP8SyeVom-_faHkzQ.png)
#### Các bước thực hiện:

1. **Chạy lệnh sau** để vô hiệu hóa tất cả các USB devices trên hệ thống:
   ```bash
   echo '0' | sudo tee /sys/bus/usb/devices/usb*/authorized
   ```
- 1. **`|`**:
   - Dấu `|` là toán tử chuyển hướng (pipe), cho phép đầu ra của lệnh bên trái (trong trường hợp này là `echo '0'`) được sử dụng làm đầu vào cho lệnh bên phải (ở đây là `sudo tee`).

- 2. **`sudo tee /sys/bus/usb/devices/usb*/authorized`**:
   - **`sudo`**: Cung cấp quyền truy cập root để thực hiện lệnh, vì bạn cần quyền admin để thay đổi cấu hình hệ thống.
   - **`tee`**: Lệnh `tee` nhận dữ liệu từ đầu vào và ghi nó vào một hoặc nhiều tệp. Trong trường hợp này, nó sẽ ghi giá trị `0` vào tệp `/sys/bus/usb/devices/usb*/authorized`.
   - **`/sys/bus/usb/devices/usb*/authorized`**: Đây là đường dẫn đến tệp `authorized` của các thiết bị USB trong hệ thống. Dấu `*` là ký tự đại diện (wildcard) cho phép lệnh này áp dụng cho tất cả các thiết bị USB hiện có.
   Lệnh này sẽ disable tất cả các cổng USB trên máy chủ.
![](	https://img001.prntscr.com/file/img001/GnsqgG6tTA69KvrAZHTiCg.png)
2. **Để bật lại** các cổng USB (nếu cần), bạn có thể chạy lệnh sau:
   ```bash
   echo '1' | sudo tee /sys/bus/usb/devices/usb*/authorized
   ```
![](https://img001.prntscr.com/file/img001/G5dv1wTMTLSTr_LyeTRBfQ.png)
### 2. **Disable USB Devices in the BIOS**
Ngoài ra, trên một số hệ thống, bạn cũng có thể vào **BIOS/UEFI** của máy chủ và vô hiệu hóa các cổng USB từ đó. Phương pháp này không liên quan đến hệ điều hành mà ngắt hoàn toàn chức năng USB từ phần cứng.

### Kiểm tra:
Sau khi thực hiện các bước trên, bạn có thể kiểm tra xem hệ thống có nhận diện các thiết bị USB hay không bằng cách chạy:
```bash
lsusb
```

Nếu các thiết bị USB không xuất hiện trong danh sách, nghĩa là bạn đã vô hiệu hóa thành công.
https://ubuntuhandbook.org/index.php/2024/03/disable-usb-ubuntu/
