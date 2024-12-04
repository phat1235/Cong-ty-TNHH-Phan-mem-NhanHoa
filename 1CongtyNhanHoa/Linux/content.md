**Biểu thức chính quy (Regular Expression)**  

**Định nghĩa:**  
Biểu thức chính quy là chuỗi các ký tự, ký hiệu biểu diễn một khuôn mẫu xâu ký tự. Nó được dùng để kiểm tra định dạng chuỗi hoặc tìm kiếm văn bản. Trong lập trình, biểu thức này hỗ trợ các thao tác như tìm và thay thế chuỗi, kiểm tra tính hợp lệ dữ liệu, hoặc trích xuất chuỗi con. Hầu hết ngôn ngữ lập trình như C++, Java, PHP đều hỗ trợ regex, đồng thời regex cũng phổ biến trong các công cụ như IDE hay URL rewrite.  

**Ví dụ:**  
Nếu yêu cầu tên tuân theo quy tắc: (1) Chỉ chứa chữ, số, dấu gạch dưới (_), dấu gạch ngang (-); (2) Độ dài từ 3 đến 15 ký tự, biểu thức chính quy sẽ là:  
`^[a-z0-9_-]{3,15}$`  
- `^`: Bắt đầu dòng.  
- `[a-z0-9_-]`: Chấp nhận chữ thường, số, dấu `_`, `-`.  
- `{3,15}`: Độ dài từ 3 đến 15 ký tự.  
- `$`: Kết thúc dòng.  

**Các ký tự Meta (Meta Characters):**  
- `.`: Bất kỳ ký tự nào trừ xuống dòng.  
- `[ ]`: Tập hợp ký tự.  
- `[^ ]`: Phủ định tập hợp.  
- `*`: Lặp 0 hoặc nhiều lần.  
- `+`: Lặp 1 hoặc nhiều lần.  
- `?`: Có hoặc không có mẫu trước đó.  
- `{n,m}`: Lặp từ n đến m lần.  
- `(xyz)`: Nhóm ký tự.  
- `|`: Phép OR.  
- `\`: Ký tự đặc biệt.  
- `^`: Bắt đầu dòng.  
- `$`: Kết thúc dòng.  

**Ví dụ cụ thể:**  
- `.*`: Bất kỳ chuỗi nào.  
- `[0-9]{2,3}`: Từ 2 đến 3 ký tự số liên tiếp.  
- `\s*mình\s*`: Bắt đầu/kết thúc bằng khoảng trắng, chứa từ "mình".  

**Ký hiệu viết tắt:**  
- `\w`: Chữ, số, `_`.  
- `\W`: Không phải chữ, số, `_`.  
- `\d`: Số (0-9).  
- `\D`: Không phải số.  
- `\s`: Ký tự trắng.  
- `\S`: Không phải ký tự trắng.  
- `\b`: Ranh giới từ.  

**Tham khảo:**  
[C++ Regex Reference](https://www.cplusplus.com/reference/regex/ECMAScript/)
