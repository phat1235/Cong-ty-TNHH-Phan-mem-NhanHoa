# Khôi Phục Toàn Bộ Máy Ảo (VM)

Nếu một máy ảo (VM) gặp sự cố, bạn có thể khôi phục nó từ tệp sao lưu. Bạn có thể khôi phục một VM hoặc nhiều VM đến vị trí ban đầu hoặc vị trí mới.

Trong phần này, bạn sẽ học cách khôi phục một VM về vị trí ban đầu. 

## Trước Khi Bắt Đầu
![](https://img001.prntscr.com/file/img001/qsH_0tOeSwiwXiV1hl_rWw.png)
![](https://img001.prntscr.com/file/img001/WfjAuIHPQ2iozj6fJRwGBA.png)

Trước khi khôi phục một VM từ bản sao lưu, hãy xem xét các điều sau:

- Bạn có thể khôi phục VM từ bản sao lưu có ít nhất một điểm khôi phục được tạo thành công. Để kiểm tra điều này, mở **inventory pane** của tab **Home** và chọn **Backups node**, sau đó mở rộng job sao lưu và xác nhận rằng có ít nhất một điểm khôi phục cho VM.
- Khi bạn khôi phục VM về vị trí ban đầu và VM gốc vẫn đang chạy, **Veeam Backup & Replication** sẽ tắt VM gốc và chỉ khôi phục những đĩa được bao gồm trong bản sao lưu. Các đĩa khác sẽ không bị thay đổi.

## Các Bước Khôi Phục Toàn Bộ Máy Ảo

Để khôi phục toàn bộ VM về vị trí ban đầu, thực hiện các bước sau:

1. Mở tab **Home**.
2. Trong **inventory pane**, chọn **Backups > Disk node**. Mở rộng job sao lưu, nhấp chuột phải vào VM trong job sao lưu và chọn **Restore entire VM** để khởi chạy trình hướng dẫn **Full VM Restore**.
![](https://img001.prntscr.com/file/img001/KEWA8z0cSx--6gxblAbRlw.png)
3. Tại bước **Virtual Machines** của trình hướng dẫn, chọn VM từ danh sách, nhấp vào nút **Point** và chọn một điểm khôi phục.
   - Nếu bạn chọn một điểm khôi phục dạng incremental, **Veeam Backup & Replication** sẽ tự động khôi phục các khối dữ liệu từ tệp sao lưu đầy đủ và chuỗi tệp incremental.
![](https://img001.prntscr.com/file/img001/sQJz-RohS-GS3lFungw6nA.png)
4. Tại bước **Restore mode**, thực hiện các thao tác sau:
   - Chọn tùy chọn **Restore to the original location**.
   - Chọn ô **Quick rollback**.
   
   **Veeam Backup & Replication** sẽ lấy các khối dữ liệu cần thiết để đưa VM trở lại trạng thái trước đó và chỉ khôi phục những khối dữ liệu này từ bản sao lưu. **Quick rollback** giúp giảm đáng kể thời gian khôi phục.

   **Note:** Không bật tùy chọn **Quick rollback** nếu sự cố xảy ra ở mức phần cứng của VM, mức lưu trữ hoặc do mất điện.
  ![](https://img001.prntscr.com/file/img001/RV29FzxsTGeXluUBmQ7HvA.png)
5. Tại bước **Reason**, ghi rõ lý do khôi phục VM.
![](	https://img001.prntscr.com/file/img001/JKOVfsyURVWrBEqJ3318Mg.png)

![](https://img001.prntscr.com/file/img001/pncFiY_AQDGi6DHL8dE1mg.png)
6. Tại bước **Summary**, chọn ô **Power on VM after restoring** và nhấn **Finish** để hoàn tất quá trình khôi phục.
![](	https://img001.prntscr.com/file/img001/Xj39f-8yRiuZdeBkcg6ecg.png)
## Restore thanh cong!
![](https://img001.prntscr.com/file/img001/WiqV9p2pSY-1944MB6nIoQ.png)

### Restore lai hostname: phat
![](https://img001.prntscr.com/file/img001/_Uags22SSNOpWfqbd_tqrw.png)
