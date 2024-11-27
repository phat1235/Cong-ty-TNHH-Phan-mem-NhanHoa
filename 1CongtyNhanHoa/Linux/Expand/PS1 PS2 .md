### 2.6. Thay đổi nội dung dấu nhắc shell

Trong Linux có hai loại dấu nhắc: dấu nhắc cấp một (dấu nhắc shell) xuất hiện khi nhập lệnh và dấu nhắc cấp hai (dấu nhắc nhập liệu) xuất hiện khi lệnh cần có dữ liệu được nhập từ bàn phím và tương ứng với hai biến nhắc tên là PS1 và PS2.

  PS1 là biến hệ thống tương ứng với dấu nhắc cấp 1: Giá trị của PS1 chính là nội dung hiển thị của dấu nhắc shell. Để nhận biết thông tin hệ thống hiện tại, một nhu cầu đặt ra là cần thay đổi giá trị của các biến hệ thống PS1 và PS2.

Linux cho phép thay đổi giá trị của biến hệ thống PS1 bằng lệnh gán trị mới cho nó. Lệnh này có dạng:
### PS1='<dãy ký tự'
Năm (5) ký tự đầu tiên của lệnh gán trên đây (PS1=") phải được viết liên tiếp nhau. Dãy ký tự nằm giữa cặp hai dấu nhảy đơn (có thể sử dụng cặp hai dấu kép ") và không được phép chứa dấu nháy. Dãy ký tự này bao gồm các cặp ký tự điều khiển và các ký tự khác, cho phép có thể có dấu cách. Cặp ký tự điều khiển gồm hai ký tự, ký tự đầu tiên là dấu xổ xuôi "", còn ký tự thứ hai nhận một trong các trường hợp liệt kê trong bàng dưới đây. 

Bảng 2.1 giới thiệu một số cặp ký tự điều khiển có thể được sử dụng khi muốn thay đổi dấu nhắc lệnh.
![](https://img001.prntscr.com/file/img001/B-Ead_QvTLKLOHlIIA1gdQ.png)


Ví dụ, hiện thời dấu nhắc shell có dạng:
root@may1 /hda1] #
Sau khi gõ lệnh
root@may1 /hdal] # PS1='[\h@\u \w: \d]\$'
thi dấu nhắc shell được thay đổi là:
[may1@root /mnt/hdal: Fri Oct 27 1#
Ngoài việc đổi thứ tự giữa tên người dùng, máy còn cho biết thêm về ngày hệ thống quản lý và tên đầy đủ của thư mục hiện thời.
Linux cung cấp cách thức hoàn toàn tương tự như đối với biến PS1 để thay đổi giá trị biến hệ thống PS2 tương ứng với dấu nhắc cấp hai.
