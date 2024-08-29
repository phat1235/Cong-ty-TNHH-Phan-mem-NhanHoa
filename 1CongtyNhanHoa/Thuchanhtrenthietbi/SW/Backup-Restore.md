

## **1. Giới thiệu**

### **1.1. Khái Niệm Backup và Restore**

- **Backup cấu hình:** Là quá trình sao lưu lại file cấu hình hiện tại của thiết bị mạng (switch Cisco) để có thể khôi phục lại khi cần thiết.
- **Restore cấu hình:** Là quá trình khôi phục lại file cấu hình đã sao lưu trước đó lên thiết bị mạng để đảm bảo thiết bị hoạt động đúng như cấu hình đã định sẵn.

### **1.2. Tại Sao Cần Backup/Restore Cấu Hình?**

- **Phòng tránh sự cố:** Trong trường hợp switch gặp sự cố hoặc bị cấu hình sai, việc khôi phục cấu hình từ file sao lưu giúp giảm thiểu thời gian ngừng hoạt động của hệ thống.
- **Thử nghiệm và cấu hình mới:** Sau khi thử nghiệm hoặc cập nhật cấu hình mới, bạn có thể khôi phục lại cấu hình cũ nếu có vấn đề xảy ra.
- **Bảo mật và tuân thủ quy định:** Sao lưu cấu hình giúp tuân thủ quy định bảo mật và quản lý hệ thống, đảm bảo rằng các cấu hình quan trọng luôn có bản sao dự phòng.

## **2. Các Phương Pháp Backup và Restore Cấu Hình trên Switch Cisco**

### **2.1. Phương Pháp Sao Lưu Cấu Hình**

1. **Sao lưu thủ công qua CLI (Command Line Interface):** Sử dụng các lệnh cơ bản trên CLI để sao lưu cấu hình trực tiếp trên switch.
2. **Sao lưu qua TFTP, FTP, SCP:** Sử dụng giao thức TFTP (Trivial File Transfer Protocol), FTP (File Transfer Protocol), hoặc SCP (Secure Copy Protocol) để truyền file cấu hình tới máy chủ từ xa.
3. **Sao lưu định kỳ với Kron:** Sử dụng tính năng Kron trên Cisco để lên lịch sao lưu tự động.



## **3. Thực Hành Backup và Restore Cấu Hình trên Switch Cisco**

### **3.1. Sao Lưu Cấu Hình Thủ Công qua CLI**

- **Bước 1:** Truy cập vào chế độ `privileged EXEC` bằng lệnh `enable`.

```shell
Switch>enable
Switch#
```

- **Bước 2:** Hiển thị cấu hình đang chạy (running configuration) bằng lệnh `show running-config`.

```shell
Switch#show running-config
```

- **Bước 3:** Sao chép cấu hình hiện tại vào bộ nhớ khởi động (startup configuration).

```shell
Switch#copy running-config startup-config
```

- **Giải thích:** Lệnh `copy running-config startup-config` sao chép cấu hình hiện tại từ RAM (bộ nhớ chạy) vào NVRAM (bộ nhớ khởi động) để đảm bảo rằng cấu hình sẽ được lưu lại sau khi thiết bị khởi động lại.

### **3.2. Sao Lưu Cấu Hình qua TFTP**

- **Bước 1:** Cài đặt TFTP server trên máy tính cá nhân (ta sử dụng phần mềm Tftpd64).
- **Bước 2:** Cấu hình địa chỉ IP trên TFTP server sao cho nó cùng subnet với switch.
- **Bước 3:** Trên switch, sao lưu cấu hình chạy tới TFTP server.

Ta cần phải cấu hình phần mềm TFTPD64 để có thể truyền và nhận file:

![](https://img001.prntscr.com/file/img001/VbKz__ytTvmtlT46eFcyBg.png)
**Giao diện của phần mềm tftpd64**
1. Vị trí nơi lưu trữ các file cấu hình
2. Click vào để lựa chọn nơi lưu trữ
3. Địa chỉ IP của TFTPD Server
4. Hiển thị các nội dung(file) có trong D:\TFTP
5. Nơi hiển thị các nội dung
6. Click vào **Setting** để cài đặt chi tiết

**Đây là giao diện cài đặt chi tiết** Tab Global
ta chỉ cần chọn TFTP Server
![](https://img001.prntscr.com/file/img001/wmgkZlHRRL6MPbmXrALHjw.png)

**Đây là giao diện cài đặt chi tiết của TFTP**
1. Nơi lưu trữ 
2. Phương thức bảo mật(ở đây ta chọn None)
3. Port mặc định của TFTP là 69
4. Liên kết TFTP với địa chỉ( ở đây là địa chỉ IP của card WIFI của tôi)


![](https://img001.prntscr.com/file/img001/jo56rs6sRbCwX7rgSIzlWA.png)

**Sau khi cấu hình được TFTP64 làm TFTP server ta bắt cầu cài đặt cấu hình trên SWITCH để backup hoặc restore**
```
Kythuat#copy running-config tftp://172.16.2.165/running-config.cfg
Address or name of remote host [172.16.2.165]?
Destination filename [running-config.cfg]?

```

- **Giải thích:** 
  - `172.16.2.165` là địa chỉ IP của máy tính cài đặt TFTP server.
  - `running-config.cfg` là tên file sao lưu trên TFTP server.
  - Tại dòng 2 ta nhấn `Enter` để bỏ qua vì câu lệnh trên dòng 1 đã đầy đủ thông số.
  - Tại dòng 3 ta cũng nhấn `Enter` để tiếp tục 
   
  
    -  Kết quả sau khi ta thực hiện câu lệnh:
    -  Đã lưu file `running-config.cfg` tại `D:\TFTP\`


![](https://img001.prntscr.com/file/img001/bgWtGWPZSxqfmqT-H21pAg.png)

### **3.3. Khôi Phục Cấu Hình từ TFTP**

- **Bước 1:** Trên switch, sử dụng lệnh `copy` để sao chép file cấu hình từ TFTP server vào cấu hình đang chạy.

```shell
Kythuat#copy tftp://172.16.2.165/startup-config.cfg startup-config
Destination filename [startup-config]?
```

- **Giải thích:** Khôi phục cấu hình từ file `startup-config.cfg` trên TFTP server vào cấu hình khởi động trên switch.

Đây là ảnh thực tế:
![](https://img001.prntscr.com/file/img001/Zd4SB4Y_SZ6TjQUWViYDGw.png)



