### ID mailbox là gì?
ID mailbox hay ID email đơn giản là số nhận dạng kết nối email của người dùng với thông tin đăng nhập. Khi hoàn thành việc lấy lại địa chỉ email của mình, bạn có thể sử dụng nó ở bất cứ nơi đâu. Nó được sử dụng để phân biệt hộp thư này với hộp thư khác và thường được tạo tự động bởi máy chủ Zimbra trong quá trình tạo tài khoản.

**ID mailbox** trong email Zimbra thường là sự kết hợp của các chữ cái, số và ký hiệu, tuy nhiên thường không hiển thị đối với người dùng cuối. Thay vào đó, người dùng thường đăng nhập tài khoản bằng địa chỉ email và mật khẩu.

Tuy nhiên, ID mailbox có thể được máy chủ sử dụng nội bộ cho nhiều mục đích khác nhau, chẳng hạn như quản lý tài nguyên và quyền.

- Ví dụ, khi máy chủ Zimbra nhận được một email, nó sẽ sử dụng ID mailbox để xác định hộp thư của người dùng sẽ gửi thư đến. Tương tự, máy chủ có thể sử dụng ID này cho việc kiểm soát quyền truy cập vào các thư mục hoặc tính năng cụ thể trong từng tài khoản email.

### Vì sao nên tìm ID mailbox trong email Zimbra?
ID mailbox là mã định danh duy nhất được gán cho mỗi hộp thư trong hệ thống. Việc tiến hành tìm ID trong email Zimbra cần được thực hiện vì một số lý do chính gồm:

- Khắc phục sự cố: Nếu có sự cố xảy ra với một mailbox cụ thể nào đó, việc biết ID mailbox có thể giúp admin khắc phục sự cố và chẩn đoán nguyên nhân một cách dễ dàng hơn.
- Chuyển đổi dữ liệu: Khi di chuyển hộp thư từ server này sang một server khác, điều quan trọng là phải biết ID của từng mailbox để có thể chuyển đổi chính xác, toàn vẹn trên máy chủ mới.
Việc tìm ID mailbox account trong nền tảng email Zimbra là một nhiệm vụ quan trọng của quản trị viên hệ thống – người có nghĩa vụ quản lý hệ thống email và đảm bảo tính chính xác, toàn vẹn dữ liệu của người dùng.
### Cách tìm ID mailbox account trong Zimbra
Mỗi account trong email server Zimbra được đại diện bởi một ID, tuy nhiên ID này được tạo ra không theo thứ tự từ nhỏ đến lớn mà theo hướng ngẫu nhiên. Việc tìm được chính xác ID mailbox cho tài khoản email có thể được ứng dụng trong trường hợp restore lại mailbox của một tài khoản nào đó.

Trong Zimbra, mỗi mailbox account có một **Mailbox ID** (còn gọi là `mboxid`), giúp quản trị viên dễ dàng quản lý và thực hiện các tác vụ liên quan đến mailbox. Dưới đây là cách tìm ID mailbox của một tài khoản email trong Zimbra.

---

### 🔍 **Cách tìm Mailbox ID trong Zimbra**

#### 1️⃣ **Sử dụng `zmprov` để tìm Mailbox ID**
Lệnh sau sẽ giúp bạn lấy thông tin chi tiết của tài khoản, bao gồm `Mailbox ID`:

```sh
zmprov gmi user@example.com
```
📌 **Kết quả sẽ hiển thị như sau:**
```

mailboxId: 123
quotaUsed: 10485760
quotaLimit: 1073741824
```
Trong đó, **`mailboxId: 123`** là ID của mailbox tài khoản `user@example.com`.
![](https://img001.prntscr.com/file/img001/jSVTk__lS4u0tLnaWJtTfA.png)
---

#### 2️⃣ **Sử dụng `mysql` để tìm Mailbox ID**
Nếu bạn có quyền truy cập vào cơ sở dữ liệu của Zimbra, bạn có thể chạy lệnh sau để lấy ID:

```sh
mysql -e "SELECT id, comment FROM zimbra.mailbox WHERE comment='user@example.com';" -u zimbra -p
```
📌 **Kết quả sẽ hiển thị như sau:**
```
+----+----------------+
| id | comment        |
+----+----------------+
| 123 | user@example.com |
+----+----------------+
```
Ở đây, `id` chính là **Mailbox ID**.


### ✅ **Khi nào cần tìm Mailbox ID?**
- Khi bạn cần **khôi phục dữ liệu** từ backup.
- Khi bạn muốn **xóa mailbox bị lỗi** bằng lệnh.
- Khi bạn cần **debug và kiểm tra trạng thái mailbox** trong hệ thống.
