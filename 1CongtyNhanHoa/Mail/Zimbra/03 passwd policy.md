# [Zimbra] – Hướng dẫn thiết lập chính sách về mật khẩu Account Email

## Thiết lập chính sách về mật khẩu Account Email

Thiết lập chính sách về mật khẩu Account Email là thao tác quan trọng đối với độ an toàn của tài khoản người dùng. Những con số bạn thiết lập trong chính sách sẽ thúc đẩy người dùng đặt những mật khẩu mạnh mẽ và an toàn hơn. Bài viết này sẽ hướng dẫn chi tiết cách thực hiện trong nền tảng Zimbra.

---

## Chính sách về mật khẩu là gì?

Chính sách về mật khẩu là một bộ quy tắc được thiết kế để tăng cường bảo mật tài khoản email bằng cách khuyến khích tạo và triển khai mật khẩu mạnh hơn. Chính sách này bao gồm toàn bộ vòng đời của mật khẩu, cách tạo, các yêu cầu về độ phức tạp, lưu trữ an toàn và giám sát liên tục.

Mặt khác, chính sách về mật khẩu chỉ thực sự có hiệu lực khi được tất cả hoặc ít nhất là các nhân viên chủ chốt của doanh nghiệp tuân thủ nghiêm ngặt. Tuy nhiên, đôi lúc người dùng sẽ quên hoặc cố gắng tạo mật khẩu dễ nhớ, điều này có thể làm giảm tính bảo mật của tài khoản email. Do đó, chính sách này có sự áp dụng của các phương pháp kỹ thuật khác nhau để hỗ trợ khắc phục vấn đề.

---

## Chính sách về mật khẩu có quan trọng không?

Với sự phát triển nhanh chóng của công nghệ, tình trạng tội phạm mạng ngày càng gia tăng với mức độ tinh vi hơn. Do đó, các biện pháp bảo mật tài khoản trên không gian mạng là điều cần thiết và cần được chú trọng.

### Lợi ích của chính sách mật khẩu:
- **Ngăn chặn vi phạm dữ liệu:** Bảo vệ dữ liệu doanh nghiệp và thông tin khách hàng là điều quan trọng. Chỉ với một kẽ hở nhỏ, kẻ tấn công có thể lợi dụng để đánh cắp dữ liệu.
- **Duy trì trật tự:** Chính sách mật khẩu giúp thiết lập hệ thống quản lý tài khoản hiệu quả trong doanh nghiệp.
- **Nâng cao nhận thức về an ninh mạng:** Nếu người dùng hiểu rõ về các mối đe dọa trên mạng và cách phòng tránh, nguy cơ tấn công mạng sẽ giảm đi đáng kể.

---

## Xây dựng chính sách về mật khẩu hiệu quả

### 1. Sử dụng mật khẩu dài

Tin tặc có nhiều phương pháp để bẻ khóa mật khẩu, trong đó có việc thử tất cả các tổ hợp có thể có của chữ cái, số và ký hiệu. Mỗi ký tự bổ sung sẽ tăng độ khó bẻ khóa theo cấp số nhân. Do đó, cần đặt mật khẩu có độ dài tối thiểu đủ lớn để đảm bảo an toàn.

### 2. Không sử dụng lại mật khẩu

Khi xảy ra vi phạm dữ liệu, email và mật khẩu thường bị rò rỉ trực tuyến. Nếu bạn sử dụng lại thông tin đăng nhập trên nhiều tài khoản, hacker có thể dễ dàng xâm nhập vào các tài khoản khác của bạn.

### 3. Thay đổi mật khẩu khi bị xâm phạm

Người dùng cần thay đổi mật khẩu ngay lập tức nếu có dấu hiệu bị truy cập trái phép. Nếu mật khẩu đã bị lộ, hacker có thể khai thác để thực hiện các cuộc tấn công mạng khác.

---

## Các yếu tố cần thiết lập với chính sách về mật khẩu trong Zimbra

Để xây dựng chính sách mật khẩu hợp lý, bạn cần biết các yếu tố có thể tùy chỉnh trong Zimbra:

- **Độ dài mật khẩu:** Đặt độ dài tối thiểu và tối đa cho mật khẩu (Mặc định: tối thiểu 6 ký tự, tối đa 64 ký tự).
- **Thời hạn mật khẩu:** Xác định thời gian sử dụng mật khẩu trước khi cần thay đổi.
- **Ký tự viết hoa tối thiểu:** Yêu cầu số ký tự viết hoa tối thiểu.
- **Ký tự chữ thường tối thiểu:** Yêu cầu số ký tự chữ thường tối thiểu.
- **Ký tự số tối thiểu:** Yêu cầu số ký tự số tối thiểu.
- **Ký tự đặc biệt tối thiểu:** Yêu cầu số ký tự đặc biệt tối thiểu.
- **Lịch sử mật khẩu:** Quy định số mật khẩu cần nhớ để tránh trùng lặp.
- **Mật khẩu bị khóa:** Ngăn người dùng thay đổi mật khẩu tùy ý.
- **Bật khóa đăng nhập sau nhiều lần thất bại:** Định cấu hình hệ thống khóa tài khoản nếu nhập sai mật khẩu nhiều lần.

---

## Cách thiết lập chính sách về mật khẩu trong Zimbra

Sau khi cài đặt email server Zimbra, chính sách về mật khẩu mặc định thường ở mức cơ bản với độ dài tối thiểu 6 ký tự và tối đa 64 ký tự. Việc thiết lập lại chính sách mật khẩu giúp nâng cao bảo mật và ngăn chặn các cuộc tấn công.

### Bước 1: Đăng nhập vào giao diện quản trị web

Truy cập giao diện web admin của Zimbra bằng tài khoản quản trị viên.
![](https://img001.prntscr.com/file/img001/yE5xwSnZS8msRvqa6t9UAQ.png)
---
![](https://img001.prntscr.com/file/img001/q8gKQEz8QiaHUra5yiSlFg.png)
### Bước 2: Thiết lập chính sách về mật khẩu

1. **Truy cập phần Cấu hình:**
Nhấp vào **Trang chủ** → **Cấu hình** → **Double click Default**

![](https://img001.prntscr.com/file/img001/Byx17DPcRZ6NZ_6Gd76gEw.png)
2. **Thiết lập chính sách mật khẩu:**
   - Chuyển đến tab **Nâng cao** → **Mật khẩu**
   - Cấu hình các tham số mật khẩu như sau:
     - **Độ dài mật khẩu tối thiểu:** 8 ký tự
     - **Độ dài mật khẩu tối đa:** 64 ký tự
     - **Ký tự viết hoa tối thiểu:** 1 ký tự
     - **Ký tự thường tối thiểu:** 1 ký tự
     - **Ký tự số tối thiểu:** 1 ký tự
     - **Ký tự đặc biệt tối thiểu:** 1 ký tự

3. **Lưu lại những thay đổi**

Sau khi hoàn tất các thiết lập, nhấn **Lưu lại** để áp dụng chính sách mới.
## Test

#### Ta thử tạo tài khoản có mật khẩu không phù hợp với chính sách xem thông báo lỗi như nào.
![](https://img001.prntscr.com/file/img001/qkXy1xuZQceq1D2D7qlPcw.png)
---

## Kết luận

Việc thiết lập chính sách mật khẩu trên Zimbra giúp tăng cường bảo mật cho tài khoản email, giảm nguy cơ bị tấn công và bảo vệ dữ liệu quan trọng của doanh nghiệp. Hãy thực hiện các bước trên để đảm bảo hệ thống email luôn an toàn!

---


