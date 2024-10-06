### 21.1. Hiển thị tất cả các cổng đang lắng nghe:
- Cài đặt gói `net-tools`:
```
sudo apt-get install net-tools
```
- Hiển thị tất cả các cổng đang lắng nghe:
```
sudo netstat -tuln
```
- Trong đó:
  - `-t`: Hiển thị các kết nối TCP
  - `-u`: Hiển thị các kết nối UDP
  - `-l`: Hiển thị các cổng đang lắng nghe
  - `-n`: Hiển thị địa chỉ IP và cổng dưới dạng số (thay vì tên miền và tên dịch vụ).

![image](https://github.com/user-attachments/assets/626d750a-d967-4069-a89a-f47681e661ae)

### 21.2. Kiểm tra các tiến trình đang lắng nghe trên các cổng:
```
sudo netstat -ltnp
```
- `-p`: Hiển thị PID và tên tiến trình sử dụng
![image](https://github.com/user-attachments/assets/96254b31-5faa-497b-b126-63ff42e4e4c9)

### 21.3. Lọc kết quả theo cổng cụ thể (ví dụ cổng 22):
```
sudo netstat -ltnp | grep ':22'
```
![image](https://github.com/user-attachments/assets/8e262170-b81e-43fc-a3e8-fd042d698a92)

### 21.4. Hiển thị tất cả các kết nối đang hoạt động:
```
sudo netstat -an
```
- Trong đó:
  - `-a`: Hiển thị tất cả các kết nối và cổng đang lắng nghe
  - `-n`: Hiển thị địa chỉ và cổng dưới dạng số
![image](https://github.com/user-attachments/assets/523ca873-5633-4f8a-b22f-951816660b44)

### 21.5. Kiểm tra các kết nối TCP đang hoạt động:
```
sudo netstat -tn
```
![image](https://github.com/user-attachments/assets/5da6b515-8105-4d57-a85e-e28ee1975c98)
