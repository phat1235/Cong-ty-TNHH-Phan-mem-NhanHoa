Công cụ này thường được cài đặt sẵn trên hầu hết các máy chủ Ubuntu, nhưng nếu chưa có, bạn có thể cài đặt nó bằng các lệnh đơn giản sau đây:

```
sudo apt update 
sudo apt install unattended-upgrades
```

Sau khi cài đặt, bạn có thể kiểm tra để đảm bảo rằng dịch vụ nâng cấp không giám sát đang chạy trong systemctl bằng lệnh:

```
sudo systemctl status unattended-upgrades.service
```

![](https://img001.prntscr.com/file/img001/39H39nApQUqGtO-jzT1emw.png)

Lệnh `sudo systemctl status unattended-upgrades.service` dùng để kiểm tra trạng thái của dịch vụ **unattended-upgrades** trên hệ thống. Dưới đây là giải thích chi tiết về quá trình này:

### 1. **Kiểm tra trạng thái dịch vụ với `systemctl`**:
- `sudo systemctl status` là lệnh để kiểm tra trạng thái của các dịch vụ đang chạy trên hệ thống Linux sử dụng `systemd` làm hệ thống quản lý dịch vụ.
- `unattended-upgrades.service` là tên của dịch vụ bạn muốn kiểm tra, nó chịu trách nhiệm tải và cài đặt các bản cập nhật bảo mật, bản vá lỗi mà không cần sự can thiệp từ người dùng.

### 2. **Ý nghĩa của output**:

```
● unattended-upgrades.service - Unattended Upgrades Shutdown
     Loaded: loaded (/lib/systemd/system/unattended-upgrades.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2024-10-03 17:51:49 UTC; 1h 3min ago
       Docs: man:unattended-upgrade(8)
   Main PID: 1187 (unattended-upgr)
      Tasks: 2 (limit: 4624)
     CGroup: /system.slice/unattended-upgrades.service
```

#### a. **Loaded**:
- `Loaded: loaded (/lib/systemd/system/unattended-upgrades.service; enabled; vendor preset: enabled)`
  - Cho biết dịch vụ **unattended-upgrades** đã được tải từ tệp cấu hình dịch vụ nằm trong thư mục `/lib/systemd/system/`. 
  - `enabled` chỉ ra rằng dịch vụ được thiết lập để khởi động tự động mỗi khi hệ thống khởi động.
  - `vendor preset: enabled` nghĩa là theo thiết lập mặc định từ nhà cung cấp hệ điều hành (ở đây là Ubuntu), dịch vụ này được kích hoạt.

#### b. **Active**:
- `Active: active (running) since Mon 2022-02-14 17:51:49 UTC; 3h 4min ago`
  - Đây là thông tin về trạng thái của dịch vụ.
  - `active (running)` nghĩa là dịch vụ đang hoạt động.
  - `since Mon 2024-10-03 11:54:30 +7; 1h 3min ago` chỉ ra rằng dịch vụ đã hoạt động liên tục từ thời điểm này (Mon 2024-10-03 11:54:30 ), và đã chạy được **1 giờ 3 phút** tính từ khi lệnh được thực hiện.

#### c. **Main PID**:
- `Main PID: 1187 (unattended-upgr)`
  - `Main PID` là mã nhận dạng của quá trình chính của dịch vụ. Ở đây quá trình `unattended-upgr` có mã PID là 1187.
  
#### d. **Tasks**:
- `Tasks: 2 (limit: 4624)`
  - Số lượng tác vụ hiện đang được dịch vụ **unattended-upgrades** thực hiện, là **2** trên tổng số giới hạn tối đa là **4624**.

#### e. **CGroup**:
- `CGroup: /system.slice/unattended-upgrades.service`
  - Đây là thông tin về `Control Group` của dịch vụ, tức là nhóm kiểm soát các tài nguyên hệ thống mà dịch vụ này được phép sử dụng.

### 3. **Chức năng của dịch vụ `unattended-upgrades`**:
- Dịch vụ **unattended-upgrades** tự động tải và cài đặt các bản cập nhật bảo mật và bản vá lỗi mà không cần người dùng thực hiện thủ công. Điều này giúp đảm bảo rằng hệ thống của bạn luôn được bảo vệ khỏi các lỗ hổng bảo mật mới nhất.
Khi kiểm tra trạng thái và nhận được kết quả `active (running)` như trên, điều đó nghĩa là dịch vụ đang hoạt động bình thường, và hệ thống của bạn sẽ tự động cập nhật các bản vá lỗi mà không cần can thiệp.

---
Lệnh `sudo dpkg-reconfigure --priority=low unattended-upgrades` 


### 1. **`dpkg-reconfigure`**:
   - Đây là lệnh được sử dụng để cấu hình lại một gói đã được cài đặt trên hệ thống. Nó cho phép bạn thiết lập lại các tùy chọn cấu hình của gói mà bạn đã cài đặt, thường là thông qua một giao diện tương tác.

### 2. **`--priority=low`**:

   - `low` nghĩa là bạn sẽ thấy tất cả các câu hỏi, kể cả những câu hỏi ít quan trọng hoặc nâng cao. Điều này hữu ích nếu bạn muốn kiểm soát chi tiết hơn các tùy chọn cấu hình của gói.

### 3. **`unattended-upgrades`**:
   - Đây là tên gói bạn đang cấu hình. Gói **`unattended-upgrades`** tự động cài đặt các bản cập nhật bảo mật và các bản vá lỗi mà không yêu cầu sự can thiệp của người dùng. Điều này giúp đảm bảo rằng hệ thống luôn được bảo vệ trước các lỗ hổng bảo mật mới nhất.

### Mục đích của lệnh:
Lệnh này dùng để cấu hình lại gói `unattended-upgrades`, cho phép bạn kiểm soát các cài đặt liên quan đến việc tự động cập nhật hệ thống. Bằng cách sử dụng tùy chọn `--priority=low`, bạn sẽ được hỏi tất cả các câu hỏi cấu hình chi tiết để điều chỉnh hoạt động của tính năng cập nhật tự động này theo ý muốn.

