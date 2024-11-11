**Giới thiệu**

Linux đi kèm với nhiều loại shell khác nhau. Mặc dù một bản phân phối có shell mặc định, người dùng có thể thay đổi hoặc cài đặt shell mới.

Nếu bạn muốn thay đổi shell mặc định, việc hiểu các loại shell có sẵn sẽ giúp bạn có cái nhìn tổng quan về các lựa chọn.

**8 Loại Shell của Linux**  
**Shell trong Linux là gì và Tại sao nó Quan trọng?**  
Shell là một chương trình thông dịch dòng lệnh, phân tích và gửi lệnh đến hệ điều hành. Đây là giao diện tương tác của hệ điều hành và là lớp ngoài cùng của kernel (hoặc "shell"). Shell cho phép người dùng và các chương trình gửi tín hiệu và truy cập các tiện ích cấp thấp của hệ điều hành.
![](https://img001.prntscr.com/file/img001/tkbfzGuOSB6iBY21f-W7bQ.png)
**Giao tiếp các lớp của hệ điều hành**  
Chương trình terminal (hoặc trình giả lập terminal) cho phép tương tác với các tiện ích của hệ thống. Khi chạy bất kỳ lệnh nào trong terminal, như ls hoặc cat, shell sẽ phân tích, đánh giá, tìm kiếm và thực thi chương trình tương ứng nếu tìm thấy.

**Các Loại Shell của Linux**  
Linux cung cấp các loại shell khác nhau để giải quyết nhiều vấn đề thông qua các tính năng độc đáo. Các shell được phát triển cùng Unix thường mượn các tính năng của nhau trong quá trình phát triển.

Dưới đây là tổng quan ngắn gọn về các loại shell và tính năng của chúng.

1. **Bourne Shell (sh)**  
Bourne shell là shell mặc định đầu tiên trên hệ thống Unix, ra mắt vào năm 1979. Tên chương trình là sh, nằm ở /bin/sh. 

![](https://img001.prntscr.com/file/img001/JPOkUG8UTxq4SB-BPKWcfQ.png)
Dấu nhắc lệnh là $, trong khi dấu nhắc root là #.

Shell Bourne nổi tiếng vì gọn nhẹ và nhanh chóng, nhưng thiếu một số tính năng chuẩn như:
- Phép toán logic và số học.
- Lịch sử lệnh.
- Các tính năng khác như tự động hoàn thành.
![](https://img001.prntscr.com/file/img001/Mivz0X1VSdSj3UUfHAGUQw.png)
2. **C Shell (csh)**  
C shell (csh) ra đời vào cuối những năm 1970 nhằm cải thiện tính tương tác và mô phỏng ngôn ngữ C. Tập tin thực thi C shell là /bin/csh. 


![](https://img001.prntscr.com/file/img001/qWM83wtnS7qSGShEsbAKtg.png)
Dấu nhắc lệnh cho người dùng là % và cho root là #.

Các tính năng tương tác mới bao gồm:
- Lịch sử lệnh trước đó.
- Định nghĩa alias cho các chương trình.
- Thư mục home tương đối (~).
- Ngữ pháp biểu thức tích hợp.

3. **TENEX C Shell (tcsh)**  
TENEX C shell (tcsh) là bản mở rộng của C shell, kết hợp vào đầu những năm 1980, tương thích ngược với csh và bổ sung các tính năng từ hệ điều hành TENEX.
![](https://phoenixnap.com/kb/wp-content/uploads/2022/10/tenex-c-shell-tcsh-example-commands.png)
Đường dẫn thực thi của tcsh là /bin/tcsh. 

-   Dấu nhắc cho người dùng là hostname:directory>, còn cho root là hostname:directory#.

4. **KornShell (ksh)**  
KornShell (ksh) là một shell Unix dựa trên Bourne shell, ra mắt vào đầu thập niên 1980. Nó nằm ở /bin/ksh hoặc /bin/ksh93, với dấu nhắc giống như Bourne shell ($ cho người dùng và # cho root).


![](https://phoenixnap.com/kb/wp-content/uploads/2022/10/korn-shell-ksh-example-commands.png)
KornShell bổ sung các tính năng như:
- Các hàm toán học tích hợp và số học dấu phẩy động.
- Lập trình hướng đối tượng.
- Mở rộng các lệnh tích hợp.

5. **Debian Almquist Shell (dash)**  
Debian Almquist Shell (dash) là một shell Unix phát triển từ Almquist shell (ash) và được chuyển sang Debian. 

![](https://phoenixnap.com/kb/wp-content/uploads/2022/10/debian-almquist-shell-dash-example-commands.png)
Dash là shell mặc định cho Ubuntu và Debian, phù hợp cho các script khởi động hệ điều hành nhờ tuân thủ POSIX và yêu cầu tài nguyên tối thiểu.

6. **Bourne Again Shell (bash)**  
Bourne Again Shell là một shell Unix và ngôn ngữ lệnh mở rộng từ Bourne shell, ra đời năm 1989 và là shell mặc định cho nhiều bản phân phối Linux. Tên gọi của shell là bash, nằm ở /bin/bash.
![](https://phoenixnap.com/kb/wp-content/uploads/2022/10/bourne-again-shell-bash-example-commands.png)
Bash bổ sung các tính năng như:
- Mở rộng dấu ngoặc.
- Hoàn thành lệnh.
- Lịch sử lệnh và xử lý tín hiệu.

7. **Z Shell (zsh)**  
Z shell (zsh) là một shell Unix ra đời vào đầu thập niên 1990, mở rộng từ Bourne shell. Đường dẫn thực thi là /bin/zsh. Z shell là shell mặc định của Kali Linux và Mac OS.
![](https://phoenixnap.com/kb/wp-content/uploads/2022/10/z-shell-zsh-example-commands.png)
Các tính năng mới trong zsh bao gồm:
- Lịch sử chia sẻ giữa các phiên shell đang chạy.
- Chỉnh sửa chính tả và tự động hoàn thành tên lệnh.
- Khả năng mở rộng thông qua các plugin.

8. **Friendly Interactive Shell (fish)**  
Friendly Interactive Shell (fish) là một shell Unix phát hành vào giữa những năm 2000, tập trung vào tính thân thiện với người dùng. 

Đường dẫn thực thi mặc định là /usr/bin/fish. 

Dấu nhắc lệnh cho người dùng là user@hostname location>,

còn cho root là root@hostname location#.
![](https://phoenixnap.com/kb/wp-content/uploads/2022/10/friendly-interactive-shell-fish-example-commands.png)
Fish có các tính năng như:
- Gợi ý nâng cao và hoàn thành lệnh dựa trên lịch sử.
- Tô sáng cú pháp và thông báo lỗi mô tả.

**Kết luận**

bạn đã có cái nhìn tổng quan về các loại shell khác nhau trong Linux, mỗi loại giải quyết các vấn đề khác nhau và phù hợp cho các trường hợp sử dụng cụ thể.
