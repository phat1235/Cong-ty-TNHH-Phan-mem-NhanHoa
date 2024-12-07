
File system hiểu đợn giản đó là cách tập tin được tổ chức trên ổ đĩa (ssd, hdd), dùng để quản lý cách mà dữ liệu được đọc và lưu trữ trên thiết bị. File system có thể dùng để chỉ một phân vùng hoặc một ổ đĩa dùng để lưu trữ các tập tin và hệ thống tập tin.(hình fsx.png)

## MBR
![](https://img001.prntscr.com/file/img001/v6sWvtmBQdiaZxvTlIhMNA.png)
Được giới thiệu vào năm 1983. MBR chứa thông tin về cách phân vùng logical và các hệ thống tệp tin được sắp xếp trên đĩa và chứa Bootloader (bộ tải khởi động) được cài đặt trên hệ điều hành. MBR hỗ trợ tối đa bốn phân vùng chính nếu muốn nhiều phân vùng hơn bạn phải thực hiện chuyển đổi 1 trong những phân vùng chính thành "extended partition" (phân vùng mở rộng) và tạo phân vùng Logical bên trong phân vùng đó, mbr sử dụng 32 bit để lưu trữ các địa chỉ khối và đối với các ổ đĩa cứng có các sector 512 byte mbr chỉ xử lý tối đa 2TB. Trên ổ đĩa MBR, dữ liệu phân vùng và dữ liệu khởi động được lưu trữ ở một vị trí. Nếu dữ liệu này bị ghi đè hoặc bị hỏng thì coi như bạn gặp rắc rối rồi đó.


## GPT
GPT viết tắt GUID (globally unique identifier ) partition table là chuẩn mới đang dần thay thế MBR. GPT liên quan với UEFI - UEFI thay thế cho BIOS, UEFI có giao diện và tính năng hiện đại hơn , và GPT cũng thay thế các hệ thống phân vùng MBR xa xưa bằng các tính năng, giao diện hiện đại hơn.
GPT có thể có 128 phân vùng. GPT sử dụng 64 bit cho địa chỉ khối và cho các đĩa cứng có các sector 512 byte, kích thước tối đa là 9,4 ZB (9,4 × 10^21 byte) hoặc 8ZiB. 
GPT cho phép một số lượng không giới hạn các phân vùng, và giới hạn này sẽ là hệ điều hành của bạn - Windows cho phép lên đến 128 phân vùng trên một ổ đĩa GPT, và bạn không cần phải tạo Extended partition (phân vùng mở rộng).

![](https://images.viblo.asia/5aebcb8e-d759-45a4-a599-1a01942596b7.png)


GPT lưu trữ nhiều bản sao của các dữ liệu này trên đĩa, do đó bạn có thể khôi phục các dữ liệu nếu các dữ liệu này bị lỗi.
GPT cũng lưu trữ các giá trị Cyclic Redundancy Check (CRC) để kiểm tra xem các dữ liệu này còn nguyên vẹn hay không. Nếu dữ liệu này bị lỗi, GPT sẽ phát hiện được vấn đề và cố gắng khôi phục các dữ liệu bị hư hỏng từ một vị trí khác trên ổ đĩa.



### Quá trình boot
Sau khi ấn nút power on thì BIOS (Basic input/output system) là chương trình khởi chạy đầu tiên BIOS thực hiện  quá trình POST (Power-on Self-test) kiểm tra các thông số phần cứng trên máy tính, Quá trình POST kết thúc thành công, BIOS sẽ tìm kiếm và khởi chạy một hệ điều hành được chứa trong các thiết bị lưu trữ như ổ cứng. Hệ điều hành Linux được cài trên ổ cứng thì BIOS sẽ tìm đến MBR (Master Boot Record) để nạp vào bộ nhớ một chương trình. Chương trình này sẽ định vị và khởi động bootloader – đây là chương trình chịu trách nhiệm cho việc tìm và nạp nhân của hệ điều hành. Linux có 2 boot loader phổ biến trên Linux là GRUB và ISOLINUX. Chương trình này có mục đích: cho phép lựa chọn hệ điều hành có trên máy tính để khởi động, sau đó chúng sẽ nạp kernel của hệ điều hành đó vào bộ nhớ và chuyển quyền điều khiển máy tính cho kernel này.
![](https://img001.prntscr.com/file/img001/E0mJvIkMRA6IkaEJvhd-Vg.png)

Hệ thống sử dụng phương pháp BIOS/MBR, bộ tải khởi động nằm ở khu vực đầu tiên của đĩa cứng. Kích thước của MBR chỉ là 512 byte. Trong giai đoạn này, bộ nạp khởi động kiểm tra bảng phân vùng và tìm một phân vùng có khả năng khởi động. Nó tìm thấy một phân vùng có khả năng khởi động,

nó sẽ tìm kiếm bộ tải khởi động giai đoạn thứ hai. Với hệ thống sử dụng phương pháp EFI / UEFI, phần mềm UEFI đọc dữ liệu trình quản lý khởi động để xác định ứng dụng UEFI nào sẽ được khởi chạy và từ nơi nào.

Linux kernel được nạp và khởi chạy. Boot loader nạp một phiên bản dạng nén của Linux kernel. Nó tự giải nén và tự cài đặt lên bộ nhớ hệ thống nơi mà nó sẽ ở đó cho tới khi tắt máy. Kernel được khởi chạy xong, nó sẽ gọi duy nhất một chương trình tên là init.

Gần cuối quá trình khởi động, init sẽ bắt đầu một chế độ đăng nhập text mode. Nhập tên người dùng và mật khẩu của bạn để đăng nhập và xuất hiện các dấu nhắc lệnh shell. 

Bước cuối cùng là đăng nhập vào hệ thống
![](https://img001.prntscr.com/file/img001/UnZ2Ko54SKmgMshLRlYxNg.png)

![](https://img001.prntscr.com/file/img001/W7qOw3q6RZyMnBpid2xEbA.png)

![](https://img001.prntscr.com/file/img001/OSDOmH1CTP6zmumpeuZk_Q.png)
