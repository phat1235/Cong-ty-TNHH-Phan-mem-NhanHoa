
**Ví dụ về việc truyền file bằng Hyper-V Integration Services**

Giả sử bạn có hai VM tên là `VM1` và `VM2`, và bạn muốn sao chép một file văn bản từ máy chủ Hyper-V sang các VM này.

### Bước 1: Tạo file trên máy chủ Hyper-V
- Sử dụng Notepad, tạo một tài liệu trống và lưu vào ổ C trên máy chủ Hyper-V với tên là **a.txt**.

### Bước 2: Mở PowerShell trên máy chủ Hyper-V
- Mở PowerShell với quyền quản trị trên máy chủ Hyper-V.

### Bước 3: Tạo biến `$targetvms`
- Chạy lệnh PowerShell sau để tạo biến `$targetvms` chứa tên các VM mục tiêu:
   ```bash
   $targetvms = Get-VM –Name VM1, VM2
   ```
![](https://img001.prntscr.com/file/img001/_Ba45wTCQTmeOADVs6V84g.png)
### Bước 4: Xác minh Guest Services được kích hoạt
- Chạy lệnh sau để kiểm tra dịch vụ Guest Services trên các VM:
   ```bash
   $targetvms | Get-VMIntegrationService
   ```

### Bước 5: Sao chép file đến các VM
- Sau khi xác minh, bạn có thể sao chép file từ máy chủ Hyper-V sang đường dẫn `C:\Test` trên cả hai VM bằng lệnh:
   ```bash
   $targetvms | Copy-VMFile –SourcePath "C:\IntegrationServicesTest.txt" –DestinationPath "C:\Test\IntegrationServicesTest.txt" -CreateFullPath –FileSource Host
   ```
![](https://img001.prntscr.com/file/img001/dIojMS1nTg-y_tPCvf33Vw.png)
### Bước 6: Kiểm tra file trên VM
- Truy cập vào VM `VM1` và `VM2`, điều hướng đến thư mục `C:\Test` và kiểm tra xem file **IntegrationServicesTest.txt** đã được sao chép thành công chưa.
![](https://img001.prntscr.com/file/img001/wFXeaP5hSlmaa7L20ojBIQ.png)
