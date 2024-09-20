

# Bật SSH trên VMWARE ESXI
## I. Cấu hình IP tĩnh
Mặc định, máy chủ ESXi sẽ nhận IP động từ router thông qua giao thức DHCP. Mình sẽ chỉnh lại thành IP tĩnh (Static IP) để tiện việc quản lý sau này.

Tôi đã cấu hình IP tĩnh ở bước cài đặt rùi nên giờ tui không làm lại nữa.


## II. Kích hoạt SSH
Kích hoạt nhanh SSH trên ESXi bằng cách bấm vào nút Actions > Services > Chọn Enable Secure Shell
![](https://img001.prntscr.com/file/img001/YES85v6iRKeu3jY9Ig5whQ.png)
Kích hoạt nhanh SSH trên ESXi bằng cách bấm vào nút Actions > Services > Chọn Enable Secure Shell
![](https://img001.prntscr.com/file/img001/8IApmsNKQXuflVhms3Djpg.png)
![](https://img001.prntscr.com/file/img001/LmEpuVsySw-DXuBD5IGRww.png)
Đăng nhập bằng SSH vào ESXi sử dụng username root và mật khẩu dùng để đăng nhập vào Web UI

- Với thao tác này, SSH sẽ bị vô hiệu hóa nếu bạn khởi động lại ESXi.


![](https://img001.prntscr.com/file/img001/oYiSvdrlSuK0K9c6o1Rdsg.png)
 - Nếu muốn SSH luôn luôn được kích hoạt mỗi khi khởi động, bạn cần truy cập vào mục Manage, chọn Services, chọn tiếp mục TSM-SSH, bấm vào nút Start để kích hoạt.
![](https://img001.prntscr.com/file/img001/t8rJyi-_SFOGifHlBcfZ7w.png)
- Bấm chọn tiếp vào mục Actions, chọn Start and stop with host.
![](https://img001.prntscr.com/file/img001/zjNcUGpkS0OzEx1fKAx3EQ.png)
