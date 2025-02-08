### I, **Hướng Dẫn Đổi Mật Khẩu Email Người Dùng Trên Zimbra Admin**  Dùng Giao Diện Đồ Họa

## **1. Tài khoản Admin trong Zimbra là gì?**  

Trong Zimbra, tài khoản admin có quyền đăng nhập vào **Administration Console** – giao diện quản trị trung tâm giúp quản lý tất cả các máy chủ và tài khoản người dùng. Quản trị viên có thể thực hiện các tác vụ như quản lý tài khoản, cấu hình hệ thống và thay đổi mật khẩu.  

Có hai loại tài khoản admin trong Zimbra:  

- **Global Admin**:  
  - Có đầy đủ quyền quản trị hệ thống, bao gồm quản lý máy chủ, cài đặt chung, miền (domain) và tài khoản người dùng.  
  - Có thể thực hiện tác vụ quản trị thông qua **Admin Console** hoặc **dòng lệnh Zimbra (CLI)**.  
  - Khi cài đặt Zimbra lần đầu, một tài khoản Global Admin mặc định được tạo ra.  

- **Domain Admin**:  
  - Quản lý tài khoản trong một miền cụ thể.  
  - Không có quyền thay đổi cài đặt chung của hệ thống hoặc các miền khác.  

Quyền quản trị của tài khoản admin được thiết lập ngay khi tài khoản được tạo.  

---

## **2. Khi nào nên đổi mật khẩu?**  

Bạn nên đổi mật khẩu admin Zimbra trong các trường hợp sau:  

🔹 **Sau khi xảy ra vi phạm an ninh**  
Nếu hệ thống bị tấn công hoặc có nguy cơ rò rỉ dữ liệu, cần đặt lại mật khẩu ngay lập tức để bảo vệ tài khoản.  

🔹 **Nghi ngờ có truy cập trái phép**  
Nếu bạn nhận được thông báo về đăng nhập bất thường hoặc nghi ngờ có ai đó đang cố truy cập vào tài khoản, hãy nhanh chóng thay đổi mật khẩu.  

🔹 **Khi tài khoản đã chia sẻ với người khác**  
Nếu bạn từng chia sẻ thông tin đăng nhập với người khác nhưng hiện không còn liên lạc, hãy đổi mật khẩu ngay để đảm bảo an toàn.  

🔹 **Quên mật khẩu hiện tại**  
Trong trường hợp quên mật khẩu, bạn cần thực hiện thao tác đặt lại để có thể tiếp tục quản trị hệ thống.  

---

## **3. Cách tăng cường bảo mật cho tài khoản admin**  

### ✅ **Sử dụng mật khẩu mạnh và thay đổi định kỳ**  
- Độ dài mật khẩu nên từ **12 ký tự trở lên**.  
- Sử dụng kết hợp **chữ hoa, chữ thường, số và ký tự đặc biệt** để tăng độ phức tạp.  
- Không sử dụng các mật khẩu dễ đoán như **123456, admin, password**…  

### ✅ **Không dùng chung mật khẩu giữa các tài khoản**  
Nếu bạn dùng một mật khẩu cho nhiều tài khoản, khi một tài khoản bị xâm nhập, tất cả các tài khoản khác cũng gặp rủi ro.  

### ✅ **Yêu cầu nhân viên cập nhật mật khẩu định kỳ**  
Các tài khoản admin cần đặt lại mật khẩu sau một khoảng thời gian nhất định (ví dụ: **3-6 tháng/lần**) để tránh nguy cơ bị khai thác.  

### ✅ **Bật xác minh hai bước (2FA)**  
- **Two-Factor Authentication (2FA)** giúp tăng cường bảo mật bằng cách yêu cầu một bước xác thực bổ sung, chẳng hạn như mã OTP gửi qua SMS hoặc ứng dụng xác thực (Google Authenticator).  

### ✅ **Thiết lập cơ chế khóa tài khoản khi nhập sai mật khẩu nhiều lần**  


- Cấu hình giới hạn số lần đăng nhập thất bại giúp ngăn chặn các cuộc tấn công brute-force.  
---

## **1. Truy cập Zimbra Admin**  
Mở trình duyệt và truy cập vào trang quản trị Zimbra Admin:  

🔗 **https://domain.com:7071**  

🛑 **Lưu ý:** Bạn cần đăng nhập bằng tài khoản Admin do nhà cung cấp dịch vụ cung cấp.  
![](https://img001.prntscr.com/file/img001/oZK6yyMnROuLjCChEEV57g.png)
---

## **2. Chọn Quản Lý Người Dùng**  
Sau khi đăng nhập thành công vào Zimbra Admin, chọn **"Manage"** để quản lý danh sách người dùng. ![](https://img001.prntscr.com/file/img001/xL64XUNjTh2AOBHZQwKoMA.png) 

---

## **3. Chọn Tài Khoản Cần Đổi Mật Khẩu**  
Duyệt danh sách và tìm tài khoản email cần thay đổi mật khẩu, sau đó nhấp vào tài khoản đó.  

---

## **4. Tiến Hành Đổi Mật Khẩu**  
- Chọn tab **"General Information"**  
- Tìm ô **"Password"**  
- Nhập **mật khẩu mới** theo yêu cầu bảo mật  
- Nhấn **"Save"** để lưu lại thay đổi  
![](https://img001.prntscr.com/file/img001/LSwcMtmdR5e8jhlsb0Lw6Q.png)
---

## **5. Hoàn Tất**  
Sau khi nhấn **Save**, mật khẩu mới sẽ có hiệu lực ngay lập tức. Người dùng có thể sử dụng mật khẩu mới để đăng nhập vào email của mình.  

💡 **Mẹo bảo mật:**  
✔ Sử dụng mật khẩu mạnh (ít nhất 8 ký tự, gồm chữ hoa, chữ thường, số và ký tự đặc biệt).  
✔ Không sử dụng mật khẩu dễ đoán như "123456", "password", "admin"...  
✔ Đổi mật khẩu định kỳ để tăng cường bảo mật.  

Chúc bạn thực hiện thành công! 🚀

# II **Hướng Dẫn Đổi Mật Khẩu Tài Khoản Admin Zimbra**  Dùng CLI

Việc đổi mật khẩu tài khoản admin trong Zimbra có đôi chút khác biệt so với việc đặt lại mật khẩu thông thường. Bài viết này sẽ hướng dẫn chi tiết cách thực hiện để đảm bảo quá trình đổi mật khẩu diễn ra thuận lợi.  

## **. Hướng Dẫn Đổi Mật Khẩu Admin Trong Zimbra**  

Sau khi cài đặt Zimbra, hệ thống sẽ tự động tạo một tài khoản admin mặc định. Nếu cần thay đổi mật khẩu, hãy làm theo các bước sau:  

### **🔹 Bước 1: Truy cập vào Server Zimbra qua SSH**  
Trên máy chủ Zimbra, đăng nhập bằng SSH và chuyển sang tài khoản Zimbra:  

```bash
su - zimbra
```

### **🔹 Bước 2: Kiểm tra danh sách tài khoản admin**  
Chạy lệnh sau để hiển thị danh sách các tài khoản có quyền admin:  

```bash
zmprov gaaa
```

### **🔹 Bước 3: Đổi mật khẩu tài khoản admin**  
Sử dụng lệnh sau để thay đổi mật khẩu cho tài khoản admin:  

```bash
zmprov sp <admin-email> <new-password>
```

Ví dụ, nếu tài khoản admin là **admin@hvn.space**, và bạn muốn đặt mật khẩu mới là **Newpassword123!**, hãy chạy lệnh:  

```bash
zmprov sp admin@hvn.space Newpassword123!
```
![](https://img001.prntscr.com/file/img001/RKCg1tWnQH-Eb7EocZKxXg.png)

🚨 **Lưu ý:**  
- Mật khẩu mới phải có ít nhất **8 ký tự**, bao gồm **chữ hoa, chữ thường, số và ký tự đặc biệt** để đảm bảo an toàn.  

### **🔹 Bước 4: Đăng nhập và kiểm tra lại**  
Sau khi đổi mật khẩu, đăng nhập vào **Zimbra Admin Console** để kiểm tra xem tài khoản đã hoạt động bình thường chưa.  

---

## **5. Kết Luận**  

Việc đổi mật khẩu admin Zimbra là một thao tác quan trọng giúp bảo vệ hệ thống email của bạn khỏi các mối đe dọa bảo mật. Để đảm bảo an toàn, hãy sử dụng mật khẩu mạnh, thay đổi mật khẩu định kỳ và kích hoạt các biện pháp bảo mật như **2FA** hoặc **giới hạn số lần đăng nhập sai**.  

Hy vọng bài viết này giúp bạn dễ dàng đổi mật khẩu admin trong Zimbra. 🚀
