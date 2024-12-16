### Cách Cài Đặt Nhiều Phiên Bản PHP Trên Ubuntu 22.04  

#### **Giới thiệu về PHP**  
PHP là một ngôn ngữ lập trình được sử dụng để phát triển ứng dụng web. Bạn cần cài đặt các gói PHP trên hệ thống Ubuntu để chạy các ứng dụng được viết bằng PHP. Thông thường, PHP được dùng để xây dựng các trang thương mại điện tử, blog và ứng dụng API.  



Chúng ta sẽ sử dụng **Ondřej PPA**, một kho lưu trữ phổ biến dành cho PHP, để cài đặt các phiên bản PHP như PHP 8.1, 8.0, 7.4, 7.3, 7.2, 7.1, 7.0 và 5.6. Bạn có thể cài đặt bất kỳ phiên bản nào phù hợp với ứng dụng của mình. Tuy nhiên, các nhà phát triển mới nên sử dụng phiên bản mới nhất, PHP 8.1.  

### **Hướng dẫn từng bước cài đặt PHP trên Ubuntu 22.04**  

#### **Bước 1: Cập nhật hệ thống**  
Đầu tiên, đăng nhập vào hệ thống Ubuntu 22.04 qua terminal và cập nhật danh sách gói bằng lệnh:  
```bash
sudo apt-get update
sudo apt-get upgrade
```  
Khi được hỏi, nhấn `y` để xác nhận nâng cấp các gói.  

---

#### **Bước 2: Cài đặt nhiều phiên bản PHP**  
Cách đơn giản nhất để cài đặt nhiều phiên bản PHP là sử dụng PPA từ Ondřej Surý.  

1. **Thêm kho lưu trữ Ondřej PPA**  
   Đầu tiên, cài đặt gói `software-properties-common` (nếu chưa có) và thêm Ondřej PPA:  
   ```bash
   sudo apt install software-properties-common
   sudo add-apt-repository ppa:ondrej/php
   sudo apt update
   ```  

2. **Cài đặt từng phiên bản PHP**  
   - **PHP 8.1**:  
     ```bash
     sudo apt-get install php8.1 php8.1-fpm
     sudo apt-get install php8.1-mysql php8.1-mbstring php8.1-xml php8.1-gd php8.1-curl
     ```  
   - **PHP 8.0**:  
     ```bash
     sudo apt-get install php8.0 php8.0-fpm
     sudo apt-get install php8.0-mysql php8.0-mbstring php8.0-xml php8.0-gd php8.0-curl
     ```  
   - **PHP 7.4**:  
     ```bash
     sudo apt-get install php7.4 php7.4-fpm
     sudo apt-get install php7.4-mysql php7.4-mbstring php7.4-xml php7.4-gd php7.4-curl
     ```  
   - **PHP 7.3**:  
     ```bash
     sudo apt-get install php7.3 php7.3-fpm
     sudo apt-get install php7.3-mysql php7.3-mbstring php7.3-xml php7.3-gd php7.3-curl
     ```  
   - **PHP 7.2**:  
     ```bash
     sudo apt-get install php7.2 php7.2-fpm
     sudo apt-get install php7.2-mysql php7.2-mbstring php7.2-xml php7.2-gd php7.2-curl
     ```  
   - **PHP 7.1**:  
     ```bash
     sudo apt-get install php7.1 php7.1-fpm
     sudo apt-get install php7.1-mysql php7.1-mbstring php7.1-xml php7.1-gd php7.1-curl
     ```  
   - **PHP 5.6**:  
     ```bash
     sudo apt-get install php5.6 php5.6-fpm
     sudo apt-get install php5.6-mysql php5.6-mbstring php5.6-xml php5.6-gd php5.6-curl
     ```  

Khi được hỏi, nhấn `y` để xác nhận cài đặt.  

---

#### **Bước 3: Kiểm tra phiên bản PHP đang hoạt động**  
Sau khi cài đặt, kiểm tra phiên bản PHP đang được sử dụng bằng lệnh:  
```bash
php -v
```  

Ví dụ đầu ra:  
```
PHP 8.1.8 (cli) (built: Jul 11 2022 08:30:39) (NTS)
```

---

#### **Bước 4: Chuyển đổi phiên bản PHP mặc định**  
Nếu bạn cài đặt nhiều phiên bản PHP, bạn có thể chuyển đổi phiên bản mặc định bằng lệnh:  
```bash
sudo update-alternatives --config php
```  

Lệnh này sẽ hiển thị danh sách các phiên bản PHP có sẵn. Nhập số tương ứng với phiên bản bạn muốn đặt làm mặc định, sau đó nhấn ENTER.  

Ví dụ, để chọn PHP 7.4:  
```bash
sudo update-alternatives --set php /usr/bin/php7.4
```  

Kiểm tra lại phiên bản PHP đang hoạt động:  
```bash
php -v
```  

---

#### **Bước 5: Gỡ cài đặt các phiên bản PHP không cần thiết**  
Nếu không còn cần một phiên bản PHP nào đó, bạn có thể gỡ bỏ nó:  
```bash
sudo apt-get remove php5.6
```  
Đồng thời, gỡ bỏ tất cả module liên quan:  
```bash
sudo apt-get remove php5.6-*
```  

---

### **Kết luận**  
Bằng cách sử dụng Ondřej PPA, bạn có thể dễ dàng cài đặt và quản lý nhiều phiên bản PHP trên Ubuntu 22.04. Điều này đặc biệt hữu ích nếu bạn cần chạy nhiều ứng dụng yêu cầu các phiên bản PHP khác nhau.
