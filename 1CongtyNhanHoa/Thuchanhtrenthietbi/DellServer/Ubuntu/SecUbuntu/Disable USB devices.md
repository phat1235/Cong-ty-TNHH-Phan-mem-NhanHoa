### 1. **Disable USB Devices Using sysfs**
Một phương pháp khác là vô hiệu hóa các cổng USB thông qua **sysfs**.
![](https://img001.prntscr.com/file/img001/Hqa6wfP8SyeVom-_faHkzQ.png)
#### Các bước thực hiện:

1. **Chạy lệnh sau** để vô hiệu hóa tất cả các USB devices trên hệ thống:
   ```bash
   echo '0' | sudo tee /sys/bus/usb/devices/usb*/authorized
   ```

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
