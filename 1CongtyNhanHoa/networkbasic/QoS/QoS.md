
### B1. Kích hoạt tính năng QoS

  
    Kythuat(config)#mls qos


### B2. Tạo Extended Access cho phép mọi truy cập

        
   
    Kythuat(config)#ip access-list extended ACL_3M
    Kythuat(config-ext-nacl)#PERMIT IP ANY ANY
    
    

### B3. Tạo class map để phân loại các traffic


    Kythuat(config)#class-map match-all CLASS_3M
    Kythuat(config-cmap)#match  access-group  name ACL_3M
    Kythuat(config-cmap)#EX

### B4. Tạo Policy
    
    Kythuat(config)#policy-map POLICY_3M
    Kythuat(config-pmap)#class CLASS_3M
    Kythuat(config-pmap-c)#police 30000 8000 exceed-action drop
    Kythuat(config-pmap-c)#exit
    Kythuat(config-pmap)#ex


- Trong đó: 30000 là tốc độ tính bằng bit/s, 30000 bit/s = 0.3Mbps, đây là tốc độ mà bạn muốn gán cho cổng mạng.

- 8000 là burst size tính bằng byte, vấy đề là chọn burst size sao cho không ảnh hưởng đến hiệu suất của mạng.
- Thông thường độ trể cho phép của một mạng từ 1 đến 600 ms. Trong ví dụ này mình chọn đỗ trể là 50ms=0.05s, mình sẽ tính ra tốc độ burst size theo công thức như sau: burst size = 2 * (8000000bps/8) * 0.05s = 100000byte

### B5. Gán Policy cho cổng mạng muốn hạn chế tốc độ


    Kythuat(config)#int gigabitEthernet 3/0/1
    Kythuat(config-if)#service-policy input POLICY_3M

- Trong ví dụ này input là chiều đi vào cổng mạng (Client upload dữ liệu lên mạng)
```
    Kythuat(config)#int gigabitEthernet 3/0/1
    Kythuat(config-if)#service-policy output POLICY_3M
```
- Trường hợp ngược lại ouput là chiều đi ra khỏi cổng mạng (Client download dữ liệu về máy)
