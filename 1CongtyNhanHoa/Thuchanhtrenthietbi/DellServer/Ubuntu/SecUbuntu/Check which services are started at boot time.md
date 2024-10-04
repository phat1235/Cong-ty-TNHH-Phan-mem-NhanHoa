

### Bước 1: Tạo một dịch vụ không được phép chạy

1. **Tạo một tệp dịch vụ**  
   Tạo một tệp dịch vụ mới trong thư mục `/etc/systemd/system/`. Chúng ta sẽ gọi tệp này là `my_service.service`.

   ```bash
   sudo vi /etc/systemd/system/my_service.service
   ```
![](https://img001.prntscr.com/file/img001/DkZL-xxeQVGhrNkhCkTZXA.png)
2. **Thêm nội dung cho tệp dịch vụ**  
   Dán vào nội dung sau:

   ```ini
   [Unit]
   Description=My Test Service

   [Service]
   ExecStart=/bin/sleep infinity

   [Install]
   WantedBy=multi-user.target
   ```
![](https://img001.prntscr.com/file/img001/DkZL-xxeQVGhrNkhCkTZXA.png)
   Tệp này định nghĩa một dịch vụ đơn giản sẽ chạy lệnh `/bin/sleep infinity`, nghĩa là nó sẽ giữ cho dịch vụ chạy vô thời hạn.

### Bước 2: Khởi động dịch vụ

3. **Khởi động dịch vụ**  
   Bây giờ bạn có thể khởi động dịch vụ này:

   ```bash
   sudo systemctl start my_service
   ```

4. **Kích hoạt dịch vụ khởi động cùng hệ thống (tuỳ chọn)**  
   Nếu bạn muốn dịch vụ này tự động khởi động khi máy chủ khởi động, sử dụng lệnh:

   ```bash
   sudo systemctl enable my_service
   ```

### Bước 3: Kiểm tra trạng thái dịch vụ

5. **Kiểm tra trạng thái dịch vụ**  
   Để kiểm tra xem dịch vụ đang chạy hay không, sử dụng lệnh:

   ```bash
   sudo systemctl status my_service
   ```

   Kết quả sẽ hiển thị trạng thái của dịch vụ, nếu nó đang chạy.

### Bước 4: Tắt dịch vụ

7. **Tắt dịch vụ**  
   Để tắt dịch vụ, sử dụng lệnh:

   ```bash
   sudo systemctl stop my_service
   ```

### Bước 5: Vô hiệu hóa dịch vụ

8. **Vô hiệu hóa dịch vụ**  
   Để ngăn dịch vụ này tự khởi động lại trong tương lai, bạn có thể sử dụng lệnh:

   ```bash
   sudo systemctl disable my_service
   ```
![](https://img001.prntscr.com/file/img001/pMNAv2NYTwSlECFsDg0dCA.png)
### Bước 6: Xác nhận

9. **Xác nhận trạng thái dịch vụ**  
   Một lần nữa, bạn có thể kiểm tra trạng thái để đảm bảo dịch vụ không còn chạy:

   ```bash
   sudo systemctl status my_service
   ```

   Kết quả sẽ cho thấy rằng dịch vụ đã bị dừng lại.

### Bước 7: Xoá dịch vụ (tuỳ chọn)

10. **Xoá dịch vụ (tuỳ chọn)**  
    Nếu bạn không cần dịch vụ này nữa, bạn có thể xoá nó:

    ```bash
    sudo rm /etc/systemd/system/my_service.service
    ```
![](https://img001.prntscr.com/file/img001/SEp7--atT3aKxrq_jsy5GA.png)
    Sau đó, làm mới danh sách dịch vụ:

    ```bash
    sudo systemctl daemon-reload
    ```
