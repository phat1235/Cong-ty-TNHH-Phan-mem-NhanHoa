### Khôi Phục Snapshots

Để trả lại máy ảo về trạng thái ban đầu hoặc quay lại một snapshot khác trong cấu trúc phân cấp của snapshot, bạn có thể khôi phục một snapshot. Khi bạn khôi phục một snapshot, bạn sẽ đưa bộ nhớ, cài đặt và trạng thái của đĩa máy ảo về trạng thái mà chúng đã có tại thời điểm bạn chụp ảnh. Nếu bạn muốn máy ảo được tạm dừng, bật hoặc tắt khi bạn khởi động nó, hãy đảm bảo rằng máy ảo ở trạng thái đúng khi bạn chụp ảnh.

#### Các phương thức khôi phục snapshot:
- **Revert to Latest Snapshot**  
  Khôi phục snapshot cha, tức là một cấp độ cao hơn trong cấu trúc phân cấp so với trạng thái "You are Here". Tùy chọn này kích hoạt snapshot cha của trạng thái hiện tại của máy ảo.
![](https://img001.prntscr.com/file/img001/K4H1gcunTSS7Clb3368f0Q.png)
- **Revert To**  
  Cho phép bạn khôi phục bất kỳ snapshot nào trong cây snapshot và làm cho snapshot đó trở thành snapshot cha của trạng thái hiện tại của máy ảo. Các snapshot tiếp theo từ điểm này sẽ tạo ra một nhánh mới trong cây snapshot.

#### Các hiệu ứng khi khôi phục snapshot:
- Trạng thái đĩa và bộ nhớ hiện tại sẽ bị bỏ qua, và máy ảo sẽ quay trở lại trạng thái đĩa và bộ nhớ của snapshot cha.
- Các snapshot hiện có không bị xóa. Bạn có thể khôi phục những snapshot đó bất cứ lúc nào.
- Nếu snapshot bao gồm trạng thái bộ nhớ, máy ảo sẽ ở cùng trạng thái nguồn như khi bạn tạo snapshot.

#### Bảng 1. Trạng thái Nguồn của Máy Ảo Sau Khi Khôi Phục Snapshot
| Trạng Thái Máy Ảo Khi Snapshot Cha Được Lấy | Trạng Thái Máy Ảo Sau Khi Khôi Phục |
|----------------------------------------------|-------------------------------------|
| Bật (bao gồm bộ nhớ)                        | Quay về snapshot cha, và máy ảo được bật và đang chạy. |
| Bật (không bao gồm bộ nhớ)                  | Quay về snapshot cha và máy ảo tắt. |
| Tắt (không bao gồm bộ nhớ)                  | Quay về snapshot cha và máy ảo tắt. |

Máy ảo chạy các loại workload nhất định có thể mất vài phút để phục hồi khả năng phản hồi sau khi quay lại từ một snapshot.
