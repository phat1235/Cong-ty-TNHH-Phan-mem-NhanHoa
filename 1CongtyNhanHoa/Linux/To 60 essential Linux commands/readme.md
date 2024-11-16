

### Bảng lệnh `vi` nâng cao

| Lệnh   | Mô tả                                                                 |
|--------|------------------------------------------------------------------------|
| **Di chuyển con trỏ**                                                          |
| `0`    | Đặt vị trí con trỏ tại đầu dòng.                                      |
| `$`    | Đặt vị trí con trỏ ở cuối dòng.                                     |
| `w`    | Đặt vị trí con trỏ ở từ tiếp theo.                                    |
| `b`    | Đặt vị trí con trỏ ở từ trước.                                      |
| `{`    | Di chuyển tới đoạn văn sau.                                          |
| `}`    | Di chuyển về đoạn văn trước.                                            |
| `n \`   | Di chuyển tới cột `n` trong dòng hiện tại.                             |
| `1G`   | Di chuyển tới dòng đầu tiên của file.                                  |
| `G`    | Di chuyển tới dòng cuối cùng của file.                                 |
| `nG`   | Di chuyển tới dòng thứ `n` của file.                                   |
| `H`    | Di chuyển tới đầu của màn hình.                                        |
| `nH`   | Di chuyển tới dòng thứ `n` tính từ đầu của màn hình.                   |
| `M`    | Di chuyển tới giữa màn hình.                                           |
| `L`    | Di chuyển tới cuối màn hình.                                           |
| `nL`   | Di chuyển tới dòng thứ `n` tính từ cuối cùng của màn hình.             |
| **Xóa và chỉnh sửa**                                                                 |
| `dd`   | Xóa dòng mà con trỏ hiện tại đang ở trên.                               |
| `D`    | Xóa từ vị trí con trỏ hiện tại tới phần cuối của dòng hiện tại.         |
| `x`    | Xóa ký tự tại vị trí con trỏ.                                           |
| `X`    | Xóa ký tự trước vị trí con trỏ.                                         |
| `c`    | Thay thế toàn bộ nội dung của dòng.                                     |
| `C`    | Thay thế phần còn lại của dòng từ vị trí con trỏ.                       |
| **Sao chép và dán**                                                                 |
| `yy`   | Sao chép dòng hiện tại.                                                |
| `yw`   | Sao chép từ vị trí con trỏ hiện tại tới phần cuối của từ.               |
| `p`    | Dán bản sao sau vị trí con trỏ.                                         |
| `P`    | Dán bản sao trước vị trí con trỏ.                                       |
| `Y`    | Sao chép toàn bộ dòng (tương tự như `yy`).                             |
| **Hoàn tác và làm lại thay đổi**                                                    |
| `u`    | Undo các thay đổi vừa thực hiện với file. Nhập `u` lần nữa sẽ redo sự thay đổi. |
| `Ctrl + r` | Làm lại các thay đổi đã undo (Redo).                                    |
| **Tìm kiếm và thay thế**                                                            |
| `/pattern` | Tìm kiếm `pattern` trong file.                                           |
| `?pattern` | Tìm kiếm ngược lại `pattern` trong file.                                |
| `n`    | Tiến tới kết quả tiếp theo khi tìm kiếm.                                 |
| `N`    | Quay lại kết quả trước khi tìm kiếm.                                     |
| `:%s/old/new/g` | Thay thế tất cả các từ `old` bằng `new` trong file.                       |
| `:s/old/new/g` | Thay thế tất cả các từ `old` bằng `new` trong dòng hiện tại.             |
| **Chế độ hiển thị và tùy chỉnh**                                                   |
| `:set number` | Hiển thị số dòng.                                                     |
| `:set nonumber` | Tắt hiển thị số dòng.                                                |
| `:set showmatch` | Hiển thị dấu ngoặc khi con trỏ ở gần chúng.                           |
| `:set autoindent` | Tự động thụt lề khi gõ.                                             |
| `:set tabstop=4` | Đặt độ rộng tab là 4 ký tự.                                           |
| **Thoát và lưu**                                                                    |
| `:w`    | Lưu file hiện tại.                                                     |
| `:wq`   | Lưu và thoát.                                                           |
| `:q`    | Thoát nếu không có thay đổi.                                            |
| `:q!`   | Thoát mà không lưu các thay đổi.                                        |
| `:x`    | Lưu và thoát (tương tự `:wq`).                                          |

