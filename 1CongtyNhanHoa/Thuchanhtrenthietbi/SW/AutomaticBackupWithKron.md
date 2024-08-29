## **1. Kron trên Cisco Switch là gì?**

**Kron** là một tính năng trên Cisco IOS dùng để thực hiện các tác vụ theo lịch trình định sẵn, tương tự như **cron** trên hệ điều hành UNIX. Với Kron, bạn có thể tự động hóa các tác vụ quản trị như sao lưu cấu hình, khởi động lại thiết bị...
### **1.1. Các Thành Phần Chính trong Kron**

- **Policy-List:** Chứa các lệnh CLI sẽ được thực thi. Bạn có thể có nhiều **policy-list** cho nhiều tác vụ khác nhau.
- **Occurrence:** Là lịch trình để thực thi **policy-list**. Bạn có thể đặt lịch theo thời gian cụ thể hoặc thiết lập để chạy định kỳ.

### **1.2. Tại Sao Nên Sử Dụng Kron Để Sao Lưu Định Kỳ?**

- **Tự động hóa và Tiết kiệm Thời gian:** Không cần thực hiện thủ công; Kron sẽ tự động thực hiện backup theo lịch.
- **Giảm thiểu Sai sót của Con người:** Tự động hóa giúp tránh được lỗi do con người gây ra khi sao lưu thủ công.
- **Tính Linh hoạt:** Kron cho phép thực thi hầu hết mọi lệnh CLI của Cisco, giúp dễ dàng lên lịch các tác vụ quản trị khác.


## **2. Sao Lưu Định Kỳ Cấu Hình Sử Dụng Kron**

### **2.1. Cấu Hình Sao Lưu Định Kỳ Sử Dụng Kron**

#### **Bước 1: Tạo một Kron Policy-List**

Một **Kron policy-list** chứa các lệnh mà bạn muốn thực thi định kỳ. Trong trường hợp này, chúng ta sẽ tạo một policy-list để sao lưu cấu hình chạy (`running-config`) đến một máy chủ TFTP.

```shell
Kythuat(config)#kron policy-list backupdata
Kythuat(config-kron-policy)#cli copy running-config tftp://172.16.2.165/backup-running-config.cfg
Kythuat(config-kron-policy)#exit
Kythuat(config)#

```

- **Giải thích các câu lệnh:**
  - `kron policy-list backup-policy`: Tạo một **policy-list** mới có tên là `backupdata`. Policy-list này sẽ chứa các lệnh cần thực thi.
  - `cli copy running-config tftp://172.16.2.165/backup-running-config.cfg`: Lệnh này sử dụng `cli` để chạy câu lệnh sao chép (`copy`) cấu hình đang chạy (`running-config`) từ switch tới máy chủ TFTP có địa chỉ IP là `172.16.2.165`, với tên file lưu trữ là `backup-running-cofig.cfg`.
  - `exit`: Thoát khỏi chế độ cấu hình `kron-policy`.

#### **Bước 2: Đặt Lịch Sao Lưu Định Kỳ với Kron Occurrence**

Sau khi đã tạo policy-list, bạn cần lên lịch để Kron thực thi policy này theo thời gian định sẵn.

```shell
Kythuat(config)#kron occurrence backup-minute in 1 recurring
Kythuat(config-kron-occurrence)#policy-list backupdata
Kythuat(config-kron-occurrence)#exit

```

- **Giải thích các câu lệnh:**
  - `kron occurrence backup-minute in 1 recurring`: Tạo một tác vụ định kỳ có tên `backup-minute` sử dụng lệnh `occurrence`. Tác vụ này sẽ chạy 1 phút 1 lần và sẽ lặp lại hàng ngày (`recurring`).
  - `policy-list backupdata`: Chỉ định **policy-list** `backupdata` (đã tạo ở Bước 1) để thực thi khi `occurrence` này được kích hoạt.
  - `exit`: Thoát khỏi chế độ cấu hình `kron-occurrence`.

### **2.2. Kiểm Tra và Quản Lý Cấu Hình Kron**

Sau khi cấu hình Kron, bạn có thể kiểm tra lại các cài đặt bằng lệnh `show`.

```shell
Switch#show kron schedule
```
![](https://img001.prntscr.com/file/img001/EFnpQioDRgOkYRKsMYxI_A.png)

- **Giải thích các câu lệnh:**

  - `show kron schedule`: Hiển thị lịch trình thực thi các Kron occurrence, bao gồm tên occurrence, thời gian chạy, và trạng thái.
 
**Ảnh dưới đây là folder lưu trữ các  file cấu hình tự động**

![](https://img001.prntscr.com/file/img001/VOsWvizGR-WyK4K5lrGIUg.png)


