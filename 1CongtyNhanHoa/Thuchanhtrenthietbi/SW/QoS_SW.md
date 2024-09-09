[
### **1.1. QoS là gì?**

- **QoS (Quality of Service)** là một tính năng trên các thiết bị mạng giúp kiểm soát và quản lý lưu lượng mạng để đảm bảo hiệu suất mạng tối ưu. QoS được sử dụng để ưu tiên các loại lưu lượng mạng quan trọng (như VoIP, video, và các ứng dụng quan trọng) và kiểm soát băng thông sử dụng, nhằm tránh tắc nghẽn và giảm thiểu độ trễ (latency) và mất gói (packet loss).

### **1.2. Ứng dụng của QoS**

- **Giảm thiểu độ trễ:** QoS giúp quản lý độ trễ mạng, đặc biệt quan trọng với các ứng dụng thời gian thực như VoIP và video conference.
- **Kiểm soát băng thông:** Cho phép thiết lập mức băng thông tối đa cho các giao diện hoặc lưu lượng mạng cụ thể.
- **Quản lý tắc nghẽn:** QoS phân loại và ưu tiên lưu lượng, giúp tránh tình trạng tắc nghẽn mạng.

### **1.3. Các thành phần cơ bản của QoS**

1. **Classification (Phân loại):** Phân loại các loại lưu lượng khác nhau và đánh dấu chúng để áp dụng các chính sách QoS khác nhau.
2. **Marking (Đánh dấu):** Gán các giá trị QoS cho lưu lượng đã được phân loại.
3. **Policing and Shaping:** Định lượng lưu lượng và kiểm soát băng thông cho các loại lưu lượng khác nhau.
4. **Queuing (Xếp hàng) và Scheduling (Lập lịch):** Quản lý cách các gói tin được xếp hàng và xử lý trên các cổng mạng.

![](https://img001.prntscr.com/file/img001/MVk13N38Q3qHfAfN15MQzg.png)

## **2. Cấu Hình QoS trên Switch Cisco**

### **Bước 1: Kích Hoạt Tính Năng QoS**

Trước khi cấu hình QoS, ta cần kích hoạt tính năng này trên switch.

```shell
Kythuat(config)#mls qos
```

- **Giải thích:** `mls qos` là lệnh dùng để bật QoS trên switch. Khi lệnh này được bật, switch sẽ bắt đầu xử lý QoS cho tất cả các lưu lượng đi qua nó.

### **Bước 2: Tạo Extended Access List (ACL) để cho phép mọi truy cập**

Tạo một **Extended Access List** để phân loại tất cả các loại lưu lượng mạng và cho phép chúng thông qua.

```shell
Kythuat(config)#ip access-list extended ACL_3M
Kythuat(config-ext-nacl)#permit ip any any
```
- **Giải thích:**
  - `ip access-list extended ACL_3M`: Tạo một Access List extended tên là `ACL_3M`.
  - `permit ip any any`: Cho phép tất cả các gói tin IP từ bất kỳ nguồn nào đến bất kỳ đích nào.( thường thì không nên làm vậy)

### ** Bước 3: Tạo Class Map để Phân Loại Các Traffic**

Tạo một **Class Map** để phân loại lưu lượng dựa trên Access List đã tạo.

```shell
Kythuat(config)#class-map match-all CLASS_3M
Kythuat(config-cmap)#match access-group name ACL_3M
Kythuat(config-cmap)#exit
```

- **Giải thích:**
  - `class-map match-all CLASS_3M`: Tạo một Class Map tên là `CLASS_3M` để phân loại lưu lượng.
  - `match access-group name ACL_3M`: Áp dụng Access List `ACL_3M` để phân loại các gói tin.

### ** Bước 4: Tạo Policy Map để Áp Dụng Chính Sách QoS**

![](https://learnduty.com/wp-content/uploads/2023/02/image-48.png)

![](https://learnduty.com/wp-content/uploads/2023/02/image-49-2048x814.png)

Sau khi tạo Class Map, ta cần tạo một **Policy Map** để chỉ định hành động đối với các loại lưu lượng đã được phân loại.

```shell
Kythuat(config)#policy-map POLICY_3M
Kythuat(config-pmap)#class CLASS_3M
Kythuat(config-pmap-c)#police 30000 8000 exceed-action drop
Kythuat(config-pmap-c)#exit
Kythuat(config-pmap)#exit
```

- **Giải thích:**
  - `policy-map POLICY_3M`: Tạo một Policy Map tên là `POLICY_3M`.
  - `class CLASS_3M`: Áp dụng Class Map `CLASS_3M` cho Policy Map này.
  - `police 30000 8000 exceed-action drop`: Thiết lập chính sách băng thông với tốc độ 30 Kbps (0.3 Mbps) và kích thước burst là 8000 byte. Nếu vượt quá tốc độ này, các gói tin sẽ bị loại bỏ (`drop`).

### **2.5. Bước 5: Gán Policy Map cho Cổng Mạng Muốn Hạn Chế Tốc Độ**

Để áp dụng chính sách QoS đã cấu hình cho một cổng mạng cụ thể, ta cần gán **Policy Map** đó vào giao diện cổng mạng.

- **Áp dụng cho traffic đi vào (Input):**

```shell
Kythuat(config)#interface gigabitEthernet 3/0/1
Kythuat(config-if)#service-policy input POLICY_3M
```

- **Giải thích:** `service-policy input POLICY_3M` áp dụng chính sách `POLICY_3M` cho traffic đi vào (upload) qua cổng GigabitEthernet 3/0/1.

- **Áp dụng cho traffic đi ra (Output):**

```shell
Kythuat(config)#interface gigabitEthernet 3/0/1
Kythuat(config-if)#service-policy output POLICY_3M
```

- **Giải thích:** `service-policy output POLICY_3M` áp dụng chính sách `POLICY_3M` cho traffic đi ra (download) từ cổng GigabitEthernet 3/0/1.
](https://prnt.sc/UuEqmZoKa53U
https://prnt.sc/KYpSxLMntnmf


### **1.1. QoS là gì?**

- **QoS (Quality of Service)** là một tính năng trên các thiết bị mạng giúp kiểm soát và quản lý lưu lượng mạng để đảm bảo hiệu suất mạng tối ưu. QoS được sử dụng để ưu tiên các loại lưu lượng mạng quan trọng (như VoIP, video, và các ứng dụng quan trọng) và kiểm soát băng thông sử dụng, nhằm tránh tắc nghẽn và giảm thiểu độ trễ (latency) và mất gói (packet loss).

### **1.2. Ứng dụng của QoS**

- **Giảm thiểu độ trễ:** QoS giúp quản lý độ trễ mạng, đặc biệt quan trọng với các ứng dụng thời gian thực như VoIP và video conference.
- **Kiểm soát băng thông:** Cho phép thiết lập mức băng thông tối đa cho các giao diện hoặc lưu lượng mạng cụ thể.
- **Quản lý tắc nghẽn:** QoS phân loại và ưu tiên lưu lượng, giúp tránh tình trạng tắc nghẽn mạng.

### **1.3. Các thành phần cơ bản của QoS**

1. **Classification (Phân loại):** Phân loại các loại lưu lượng khác nhau và đánh dấu chúng để áp dụng các chính sách QoS khác nhau.
2. **Marking (Đánh dấu):** Gán các giá trị QoS cho lưu lượng đã được phân loại.
3. **Policing and Shaping:** Định lượng lưu lượng và kiểm soát băng thông cho các loại lưu lượng khác nhau.
4. **Queuing (Xếp hàng) và Scheduling (Lập lịch):** Quản lý cách các gói tin được xếp hàng và xử lý trên các cổng mạng.

![](https://img001.prntscr.com/file/img001/MVk13N38Q3qHfAfN15MQzg.png)

## **2. Cấu Hình QoS trên Switch Cisco**

### **Bước 1: Kích Hoạt Tính Năng QoS**

Trước khi cấu hình QoS, ta cần kích hoạt tính năng này trên switch.

```shell
Kythuat(config)#mls qos
```

- **Giải thích:** `mls qos` là lệnh dùng để bật QoS trên switch. Khi lệnh này được bật, switch sẽ bắt đầu xử lý QoS cho tất cả các lưu lượng đi qua nó.

### **Bước 2: Tạo Extended Access List (ACL) để cho phép mọi truy cập**

Tạo một **Extended Access List** để phân loại tất cả các loại lưu lượng mạng và cho phép chúng thông qua.

```shell
Kythuat(config)#ip access-list extended ACL_3M
Kythuat(config-ext-nacl)#permit ip any any
```
- **Giải thích:**
  - `ip access-list extended ACL_3M`: Tạo một Access List extended tên là `ACL_3M`.
  - `permit ip any any`: Cho phép tất cả các gói tin IP từ bất kỳ nguồn nào đến bất kỳ đích nào.( thường thì không nên làm vậy)

### ** Bước 3: Tạo Class Map để Phân Loại Các Traffic**

Tạo một **Class Map** để phân loại lưu lượng dựa trên Access List đã tạo.

```shell
Kythuat(config)#class-map match-all CLASS_3M
Kythuat(config-cmap)#match access-group name ACL_3M
Kythuat(config-cmap)#exit
```

- **Giải thích:**
  - `class-map match-all CLASS_3M`: Tạo một Class Map tên là `CLASS_3M` để phân loại lưu lượng.
  - `match access-group name ACL_3M`: Áp dụng Access List `ACL_3M` để phân loại các gói tin.

### ** Bước 4: Tạo Policy Map để Áp Dụng Chính Sách QoS**

![](https://learnduty.com/wp-content/uploads/2023/02/image-48.png)

![](https://learnduty.com/wp-content/uploads/2023/02/image-49-2048x814.png)

Sau khi tạo Class Map, ta cần tạo một **Policy Map** để chỉ định hành động đối với các loại lưu lượng đã được phân loại.

```shell
Kythuat(config)#policy-map POLICY_3M
Kythuat(config-pmap)#class CLASS_3M
Kythuat(config-pmap-c)#police 30000 8000 exceed-action drop
Kythuat(config-pmap-c)#exit
Kythuat(config-pmap)#exit
```

- **Giải thích:**
  - `policy-map POLICY_3M`: Tạo một Policy Map tên là `POLICY_3M`.
  - `class CLASS_3M`: Áp dụng Class Map `CLASS_3M` cho Policy Map này.
  - `police 30000 8000 exceed-action drop`: Thiết lập chính sách băng thông với tốc độ 30 Kbps (0.3 Mbps) và kích thước burst là 8000 byte. Nếu vượt quá tốc độ này, các gói tin sẽ bị loại bỏ (`drop`).

### **2.5. Bước 5: Gán Policy Map cho Cổng Mạng Muốn Hạn Chế Tốc Độ**

Để áp dụng chính sách QoS đã cấu hình cho một cổng mạng cụ thể, ta cần gán **Policy Map** đó vào giao diện cổng mạng.

- **Áp dụng cho traffic đi vào (Input):**

```shell
Kythuat(config)#interface gigabitEthernet 3/0/1
Kythuat(config-if)#service-policy input POLICY_3M
```

- **Giải thích:** `service-policy input POLICY_3M` áp dụng chính sách `POLICY_3M` cho traffic đi vào (upload) qua cổng GigabitEthernet 3/0/1.

- **Áp dụng cho traffic đi ra (Output):**

```shell
Kythuat(config)#interface gigabitEthernet 3/0/1
Kythuat(config-if)#service-policy output POLICY_3M
```

- **Giải thích:** `service-policy output POLICY_3M` áp dụng chính sách `POLICY_3M` cho traffic đi ra (download) từ cổng GigabitEthernet 3/0/1.


Dưới đây là tốc độ thực tế  khi  chưa áp dụng chính sách QoS
![](https://img001.prntscr.com/file/img001/81AxUfLOSdygxB-kErgmUQ.png)
Dưới đây là tốc độ thực tế sau khi  áp dụng chính sách QoS
![](https://img001.prntscr.com/file/img001/a0d35TQ2QLWbyvOArs6CeA.png)
)
