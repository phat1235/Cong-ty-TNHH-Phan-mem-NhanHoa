
1. **Chuyển sang chế độ cấu hình**:
	   ```bash
	   enable
	   configure terminal
	   ```

	3. **Tạo mật khẩu `enable secret`**: 
	   ```bash
	   enable secret <mật_khẩu_mới>
	   ```

	   Thay `<mật_khẩu_mới>` bằng mật khẩu mà bạn muốn đặt.

	4. **Mã hóa tất cả mật khẩu**: Để mã hóa tất cả mật khẩu trên thiết bị, bạn có thể sử dụng lệnh sau:
	   ```bash
	   service password-encryption
	   ```

	5. **Lưu cấu hình**: Cuối cùng, bạn nên lưu cấu hình để đảm bảo các thay đổi không bị mất khi thiết bị khởi động lại:
	   ```bash
	   end
	   write memory
	   ```

	### Kiểm tra mật khẩu

	Để kiểm tra xem mật khẩu đã được mã hóa hay chưa, bạn có thể sử dụng lệnh sau:

	```bash
	show running-config
	```
	### 

	Mật khẩu sẽ xuất hiện dưới dạng mã hóa (ví dụ: `5 $1$...`).

	### Ví dụ cụ thể 
	![](https://img001.prntscr.com/file/img001/rlzSbiVZTpSJ2vYrMiDbpg.png)
	![](https://img001.prntscr.com/file/img001/JanKbVDFQVyNOkj5EWZDUA.png)
	![](https://img001.prntscr.com/file/img001/ucPouPVqTZahbBH8jx2uzg.png)
