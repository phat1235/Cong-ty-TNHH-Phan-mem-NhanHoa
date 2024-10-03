Để thử cài đặt một số gói không cần thiết và sau đó xóa chúng

### Bước 1: Cài đặt một số gói không cần thiết

Bạn có thể cài đặt các gói mà bạn cho là không cần thiết. Dưới đây là một số gói mẫu có thể cài đặt (chỉ để thử nghiệm):

```bash
sudo apt install cowsay fortune
```

- **`cowsay`**: Một chương trình đơn giản hiển thị một con bò nói chuyện.
- **`fortune`**: Một chương trình hiển thị các câu nói ngẫu nhiên.
![](https://img001.prntscr.com/file/img001/V6MQdAPPRdOQ3qmKQb-pPQ.png)
### Bước 2: Kiểm tra các gói đã cài đặt

Sau khi cài đặt, bạn có thể kiểm tra xem chúng đã được cài đặt thành công hay chưa bằng cách sử dụng:

```bash
dpkg --get-selections | grep -E 'cowsay|fortune'
```
![](https://img001.prntscr.com/file/img001/QNXpZdPVSh6GPw4dVwLQXQ.png)
### Bước 3: Xóa các gói không cần thiết

Khi bạn đã xác định rằng các gói này không cần thiết nữa, bạn có thể sử dụng lệnh sau để xóa chúng:

```bash
sudo apt remove cowsay fortune-mod fortunes-min
```
### Bước 4: Dọn dẹp các gói không cần thiết

Sau khi xóa các gói này, bạn có thể sử dụng `autoremove` để dọn dẹp các gói phụ thuộc mà không còn cần thiết:

```bash
sudo apt autoremove
```
![](https://img001.prntscr.com/file/img001/v7kzGMQ4TR-Lj8zDT4BbUg.png)
### Bước 5: Xác nhận

Để xác nhận rằng các gói đã được xóa thành công, bạn có thể kiểm tra lại danh sách các gói đã cài đặt:

```bash
dpkg --get-selections | grep -E 'cowsay|fortune'
```
![](https://img001.prntscr.com/file/img001/PORn2dZWSNyRlto_nW3c4A.png)
Nếu không có kết quả trả về, có nghĩa là các gói đã được xóa thành công.

### Lưu ý

- Trước khi xóa bất kỳ gói nào, hãy đảm bảo rằng chúng thực sự không cần thiết cho hệ thống của bạn.

  ![](https://img001.prntscr.com/file/img001/48Rx9F0pRRmGOXUyI5hP4g.png)
