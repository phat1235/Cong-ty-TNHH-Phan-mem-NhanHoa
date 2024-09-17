Trước khi cài đặt hệ điều hành ta phải cấu hình RAID cho máy chủ
Tại màn hình vừa mới khởi động ta nhấn tổ hợ phím ` CRT +R` để vào cài đặt cấu hình `RAID`.

### Windows 10

-   Ta nhấn **F2** để lựa chọn các options
- ![Image 1](https://img001.prntscr.com/file/img001/SG-FBgv4SyWvj8oLoj1wMA.png)

-   Như các bạn có thể thấy thì tôi đang có 4 ổ cứng 480gb SSD vẫn chưa cài `RAID`
- ![Image 2](https://img001.prntscr.com/file/img001/bQU4VqofQfSGeHZ69qiIgg.png)
-   Ta chọn `Create New VD`
- ![Image 3](https://img001.prntscr.com/file/img001/6d8ntXh7RD-RhM0jhdu1qg.png)
- Các thông số:
   - Raid Level: các loại Raid
   - VD Size: tự động gen sau khi ta chọn xong ổ cứng được áp dụng
   - VD Name: tùy chọn
- Ta chọn các ổ cứng tham gia vào chế độ RAID theo lý thuyết. Tôi sẽ chọn hết 4 ổ
- Sau đó nhấn OK, nó sẽ hiển thị thêm cảm báo blabla, nhấn OK tiếp.
- ![Image 4](https://img001.prntscr.com/file/img001/o09R6awiRpuaSWaS41qnIg.png)
- nó sẽ hiển thị thêm cảm báo blabla, nhấn OK tiếp.
- ![Image 5](https://img001.prntscr.com/file/img001/SwJFqoR8SLqIgHUru0R7aQ.png)
- Hiện tại tôi đã tạo được RAID 0, tiến hành bấm tổ hợp phím `CRT + ALT + DEL` để reload lại máy.
- ![Image 6](https://img001.prntscr.com/file/img001/BESc7qgTSsah1hud9Z7GaQ.png)
- Cắm usb boot vào và tiến hành cài đặt hệ điều hành Win 10.
- Nhân F11 để vào `Boot Manager`
- ![Image 7](https://img001.prntscr.com/file/img001/493SQd4XTNCKGMPREhe08Q.png)
- Sau khi đã vào BM, ta lựa chọn `ONE-SHOT BIOS MENU`
- ![Image 8](https://img001.prntscr.com/file/img001/2gBwYX71T1Sdmdx6IWSaSQ.png)
- Ta lựa chọn USB vừa cắm vào
- ![Image 9](https://img001.prntscr.com/file/img001/rJUxY7xuR8irC8e4AydAGA.png)
- Màn hình cài Win quen thuộc :v
- ![Image 10](https://img001.prntscr.com/file/img001/S_JDTVBXRS236RBLd85OrQ.png)
- Ta để mặc định, click Next
- ![Image 11](https://img001.prntscr.com/file/img001/yd9Ta0XnTsuEg9DLvFGC5A.png)
- Waitting
- ![Image 12](https://img001.prntscr.com/file/img001/xOUMlKuWT4SLkRlJhUZ1ng.png)
- Ta nhập key, nếu có thì nhập, tôi không có xiềng mua KEY nên nhấn `I dont have a prd key`
- ![Image 13](https://img001.prntscr.com/file/img001/Bn8JNemKRK-7sOgGELf-5w.png)
- Lựa chọn phiên bản Win cần cài đặt
- ![Image 14](https://img001.prntscr.com/file/img001/EUKwIK1STj2SOGJlzZ0sZQ.png)
- Chấp nhận các điều khoản của Microsoft...
- Rồi click Next
- ![Image 15](https://img001.prntscr.com/file/img001/VDxinsGPQaOnt_vF_Gl9Zw.png)
- Bước này ta lựa chọn `CUSTOM:INSTALL WINDOWN ONLY` để đẩy nhanh quá trình cài đặt nhé
- ![Image 16](https://img001.prntscr.com/file/img001/2F0Na4jDRfCVkaYhA8T4vA.png)
- Lựa chọn ổ cứng, ở đây chính là RAID0 vừa nãy ta tạo
- ![Image 17](https://img001.prntscr.com/file/img001/CpOw5t0EQBKfVpk5Rr-Sgg.png)
- Lại là Waitting
- ![Image 18](https://img001.prntscr.com/file/img001/LPzoHkZnTyqmx2mDLgbJvA.png)
- Logo quen thuộc
- ![Image 19](https://img001.prntscr.com/file/img001/MPKRVbh0R-qejbIyf0yzLQ.png)
- Lựa chọn khu vựa rồi click YES
- ![Image 20](https://img001.prntscr.com/file/img001/V2B-r7FOTJiqY_rStIl8-Q.png)
- Tắt hết các option nhé, để cài cho nhanh
- ![Image 21](https://img001.prntscr.com/file/img001/GAHAhXCQSQmbRdmaaCaxXA.png)
- tèn tén ten, giao diện thân yêu
- ![Image 22](https://img001.prntscr.com/file/img001/hUXTYejqTg2_1EP7ikJ7sw.png)
- Check var cái. Xem cấu hình như nào.
- ![Image 23](https://img001.prntscr.com/file/img001/zYlxrnYQQFurlLGRia6DAA.png)
- Ta check hiệu năng của chế độ RAID 0 Nhé
- ![Image 24](https://img001.prntscr.com/file/img001/PTVjKgAAQPGE3PW8EQNz3w.png)
- 
- ![Image 25](https://img001.prntscr.com/file/img001/yIos234pSE2R2p6Gmh8jJQ.png)
- Đây là kết quả của Raid0 MAR, do ổ cứng cũng down khá nhiều nên không được như kỳ vọng. Nhưng cũng biểu hiện cho thấy rằng, tốc độ đọc/ ghi của Raid0 luôn là nhanh nhất nếu cùng số lượng ổ cứng.
- Nó sẽ nhân 4 lần tốc độ lên vì ở đây tôi dùng 4 ổ cấu hình Raid0 - Cả r/w nhé
- ![Image 26](https://img001.prntscr.com/file/img001/_KB2MxunTn2leEpaQM1V4A.png)