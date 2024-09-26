
### 1. **Phiên bản Cisco IOS:**
   ```bash
   Cisco IOS Software, C3750 Software (C3750-IPSERVICESK9-M), Version 12.2(55)SE9, RELEASE SOFTWARE (fc1)
   ```
   - **C3750 Software (C3750-IPSERVICESK9-M)**: Đây là phiên bản phần mềm IOS dành cho dòng **Cisco 3750**, với gói dịch vụ là **IP Services K9** (hỗ trợ các tính năng nâng cao về định tuyến và bảo mật).
   - **Version 12.2(55)SE9**: Đây là phiên bản IOS 12.2(55)SE9.
![](https://img001.prntscr.com/file/img001/2ugvVz9XQrWYA5YE_-6ySw.png)
### 6. File hệ thống IOS đang sử dụng:
```
System image file is "flash:c3750-ipservicesk9-mz.122-55.SE9.bin"
```
File IOS đang chạy là "flash:c3750-ipservicesk9-mz.122-55.SE9.bin", đây là file được lưu trữ trong bộ nhớ flash của thiết bị.
![](https://img001.prntscr.com/file/img001/9I1jr-SGSUmimbcm8HcFAQ.png)
#### Có tới 48 port RJ45  1GB
![](https://img001.prntscr.com/file/img001/XIgEaUYLQfqMX8XFT7TCvQ.png)
### Kiểm tra dung lượng còn trống trong flash:

```
dir flash:
```
Điều này giúp xác định xem bạn có cần xóa file IOS cũ để có chỗ trống cho firmware mới hay không.
32MB Nha mọi người :V
![](https://img001.prntscr.com/file/img001/j_Erm7E3SGeAy0WTTZplNA.png)

### Ta lên trang chủ cisco để tải firmware, ở đây tôi chỉ demo. Vì tải mấy cái này nó chả public gì nên khó khăn khi tải ghê :V; điền thông tin các thứ xu cà na ~~
![](https://img001.prntscr.com/file/img001/S6jvYLbOTnirw2_C11oqkQ.png)


### Tôi sẽ dùng chính file ISO mà con SW của tôi đang sử dụng để demo
### Tôi tải nó về máy và tải khá làm chậm - như rùa 
![](https://img001.prntscr.com/file/img001/bUJmRdTQSh-Ti0gOwKSBKg.png)
### Dưới đây là file khi tôi đã lưu vào local
![](https://img001.prntscr.com/file/img001/35u-w8u7SoGXPUu46N_nWA.png)
### Tôi thực hiện đổi tên cho file - thêm hậu tố  `test` để nhận dạng
![](https://img001.prntscr.com/file/img001/yAqoNeA7Q4uLWmRpC9OXDQ.png)
### Thực hiện backup cấu hình
trước khi upgrade firmware up or down - mà tôi quên mất backup vlan.dat

các bạn phải backup cả file vlan.dat nữa nhé
![](https://img001.prntscr.com/file/img001/-Z_LvJ5uSzmxTTUdXAi4lQ.png)
### Tải firmware mới lên switch (qua TFTP)
Trước tiên, bạn cần chuẩn bị file firmware IOS trên máy chủ TFTP. Sau đó, tải file từ TFTP server lên switch.
### Chờ đợi để copy  file ISO vào ổ đĩa flash:
![](https://img001.prntscr.com/file/img001/EiRpAknKQT-b3cMwa1txBQ.png)
### Xóa firmware cũ (nếu cần)
Nếu bộ nhớ flash không đủ chỗ cho firmware mới, bạn có thể xóa phiên bản IOS cũ.
![](https://img001.prntscr.com/file/img001/8SEtlglHQQKQrk8VPJuouQ.png)
### Cấu hình để sử dụng firmware mới
Sau khi đã tải firmware mới lên, bạn cần cấu hình switch để sử dụng phiên bản IOS này trong lần khởi động tiếp theo.

Chỉ định file IOS mới làm hệ điều hành chính:
![](https://img001.prntscr.com/file/img001/dL4FIA3oRSu-7RIb5ZwvTQ.png)
### Lưu cấu hình và reboot lại sw
![](https://img001.prntscr.com/file/img001/jltGNKAWRu6ih9932YsWbg.png)
### Kiểm tra lại phiên bản sau khi nâng cấp
![](https://img001.prntscr.com/file/img001/_K3_-yeDQZCxEam_xKxMyQ.png)
