
- Cho phép remote connections to this computer
15.	![](https://img001.prntscr.com/file/img001/Vd1pIwaPR-WQGfJQChoCSg.png)
16.	![](https://img001.prntscr.com/file/img001/_SuduSmSRvW94Ol2KE_P_w.png)
- Ta cài địa chỉ ip tĩnh cho server
17.	![](https://img001.prntscr.com/file/img001/HlYeOV9ITP2qW_rRcpbX2Q.png)
- Ta thêm 1 vài account
18.	![](https://img001.prntscr.com/file/img001/C0BuaiOIQp-2FyWIYFNvEw.png)
19.	![](https://img001.prntscr.com/file/img001/-1pikC-3RdKrWTwNkJmdcQ.png)
- Ta thêm 1 vài account
- Ần Windows + R và ghi gpedit.msc sau đó mở lên
- Đi đến Computer Configuration > Administrative Templates > Windows Components > Remote Desktop Services > Remote Desktop Session Host > Connections.

20.	![](https://img001.prntscr.com/file/img001/Es0-1aAgRIqGroDh6yp2lw.png)
21.	![](https://img001.prntscr.com/file/img001/20sa2HaNQ3O_GHxUIG6djQ.png)
- Double click Limit number of connections và set the RD Maximum Connections allowed thành 2
22.	![](https://img001.prntscr.com/file/img001/NOwJ1im4SqSoI-tH5fe2aQ.png)
- Double click Limit number of connections và set the RD Maximum Connections allowed thành 2
23.	![](https://img001.prntscr.com/file/img001/l7JUsqIvThOl9nABsBkUWQ.png)
- Set Restrict Remote Desktop Services user to a single Remote Desktop Services session thành Disabled.
24.	![](https://img001.prntscr.com/file/img001/dsZhIpvBTmCl6o4eFO4Gyg.png)
- Set Restrict Remote Desktop Services user to a single Remote Desktop Services session thành Disabled.
25.	![](https://img001.prntscr.com/file/img001/XejWkubKRRytJeZvj2RV1A.png)
- Tiếp theo là change port từ 3389 thành 8888
- ***Bước 1:*** Mở Registry Editor. Có khả nhiều cách mở Registry Editor và cách đơn giản nhất là nhấn `Windows + R` để mở Run sau đó gõ regedit và nhấn Enter. Bạn cũng có thể mở Start menu sau đó gõ regedit rồi nhấp vào kết quả tìm kiếm đầu tiên
- **Bước 2: Truy cập vào thư mục:**
- `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp`
- **Bước 3:** Tìm kiếm key PortNumber trong thư mục RDP-Tcp rồi nhấn đúp chuột vào nó
26.	![](https://img001.prntscr.com/file/img001/hommvqeTRvCQJwI8UZakBw.png)
- Sau khi thay đổi port thành 8888
27.	![](https://img001.prntscr.com/file/img001/0IeLDkACTceiluPBXZAoWQ.png)
- Ta mở cmd gõ lệnh `gpupdate/force` để cập nhật tất cả các thay đổi ở `policy` 
- Ta restart lại máy tính để áp dụng all setting.
19.	![](https://img001.prntscr.com/file/img001/zm8ZLzohTHaBPCYs6QgScQ.png)
- Thế là ta đã multi remote + change portnumber 
- Bây giờ ta cần tạo allow trên firewall để có thể remote bằng cổng 888
- À, ở dưới tôi có cấu hình để chỉ có thể remote từ 1 hoặc những địa chỉ được cho phép nữa
28.	![](https://img001.prntscr.com/file/img001/9PTplwwmS9SKpxHChlkjPg.png)
- Lựa chọn Inbound Rules
- Và lựa chọn New rule
29.	![](https://img001.prntscr.com/file/img001/04_d5qFnQu6UHmzxKlGajQ.png)
30.	![](httpss://img001.prntscr.com/file/img001/cHIRLwdTSYeSWj05PLTyTA.png)
- Ta thêm port 8888 vào và click next
30.	![](https://img001.prntscr.com/file/img001/J82AMeuuQxiCQim98aadkA.png)
![](httpss://img001.prntscr.com/file/img001/eEeDjVdkQgOD08OEAj6v2Q.png)
- Click next
![](httpss://img001.prntscr.com/file/img001/WinleFFaTx-8nlhqZHTAPQ.png)
	![](https://img001.prntscr.com/file/img001/zEycRZ21TJ-eRv9dxmoIMw.png)
- Ta thực hiện remote bằng địa chỉ ip : port
31.	![](https://img001.prntscr.com/file/img001/tv2juyTASIWt7ozfpzVGfg.png)
- Cho phép một số địa chỉ ip remote tới máy chủ
- Ta đổi địa chỉ ip sang .107 

![](https://img001.prntscr.com/file/img001/Ed7TD5s7TEKsyjiRUUCPBQ.png)
- Ta chỉ cho phép ip  .105 - .106 remote tới server

33.	![](https://img001.prntscr.com/file/img001/4-fPNvSHSyqBGMF7z17MOA.png)

![](https://img001.prntscr.com/file/img001/qbvqG_x2Qu2GWdlIndh6Kw.png)
- Ta thực hiện connect lại xem
34.	![](https://img001.prntscr.com/file/img001/2yIXZA3wTFOf--3Ldj-BCw.png)
- Và đã chặn thành công, vì tôi đã đổi địa chỉ ip của máy tôi sang IP khác
35.	![](https://img001.prntscr.com/file/img001/TgKHOOZMReyy-9Oc8ptVqQ.png)
