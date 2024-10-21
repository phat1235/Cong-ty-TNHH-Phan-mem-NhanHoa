### Hướng dẫn PFSense OpenVPN mode TAP

![](https://img001.prntscr.com/file/img001/PIJODub6SXyR2i5V1p1w5A.png)
### Thực hiện trên PFSense
### Tạo User và Certificate

- Tại tab System/Certificate Manager/CA, tạo CA cho OpenVPN, CA này sẽ xác thực tất cả các certificate của server VPN và user VPN khi kết nối tới PFSense OpenVPN

![](https://img001.prntscr.com/file/img001/lPFBIT8VTXi0Jil8nyOcyA.png)
![](https://img001.prntscr.com/file/img001/sJA5rVfKQ1CIUFmYa5tP5w.png)
 Tại tab System/Certificate Manager/Certificate, tạo certificate cho server VPN
![](https://img001.prntscr.com/file/img001/zKuEM1prTj6zYa-0Rg1HIw.png)

![](https://img001.prntscr.com/file/img001/Hpy_5G-RSFKCQZJhUG6BDA.png)
![](https://img001.prntscr.com/file/img001/PDVGY6qKS1qxer4U23__8w.png)
![](https://img001.prntscr.com/file/img001/Voxt1MHURUGZBTjYw_hA0A.png)
![](https://img001.prntscr.com/file/img001/hOH7K1IETX2JwJZNBkhIjQ.png)
![](https://img001.prntscr.com/file/img001/RYXcLExBRayyVr5DWjZSyw.png)
- Tiếp tục tạo certificate cho user
-  Tại tab System/UserManager, tạo user được VPN
-  -Sau khi user được tạo, click vào nút "Edit user"
![](https://img001.prntscr.com/file/img001/rLDD_KqsTMCYKQaYg13fxw.png)
- Edit user vừa tạo, add certificate cho user đó
![](https://img001.prntscr.com/file/img001/njVY1oT4R1e2ZFx6LrCv3w.png)
 Chọn cert vừa tạo ở trên
![](https://img001.prntscr.com/file/img001/4PbYR8SwT5eWugfW7kRkXQ.png)
### Tạo VPN Server
- Tại tab System/Package Manager, cài đặt Plugin openvpn-client-export
-  Tại tab VPN/OpenVPN/Servers, click "Add" để tạo VPN server
![](https://img001.prntscr.com/file/img001/RItu0VYsSIaf3PNxDcJOkw.png)
-  Khai báo các thông tin về mode kết nối:
  - Server mode: Remote Access (SSL/TLS + User Auth)
  - Device mode: tap
  - Interface: WAN
  - Local port: 1194   
![](https://img001.prntscr.com/file/img001/gi7b_lfkTL2DKwt9SnMMEg.png)
 - Khai báo các thông tin về mã hóa
  - TLS Configuration: chọn sử dụng TLS key
  - Peer Certificate Authority: chọn CA cho hệ thống đã tạo trước đó (server-ca)
  - Server certificate: chọn cert cho server được tạo (server-cert)
 
  - Auth digest algorithm: lựa chọn giải thuật xác thực kênh truyền là SHA256
![](https://img001.prntscr.com/file/img001/rZ2TK9xoR0OAk9mgI6OgYg.png)
 - Khai báo các thông tin về tap
  - Bridge DHCP: cho phép client nhận IP trong LAN thông qua DHCP Server
  - Bridge Interface: lựa chọn LAN được kết nối qua VPN
  - IPv4 local Network: khai báo dải mạng được truy cập thông qua VPN (LAN2)
  - Concurrent Connection: khai báo số lượng client được kết nối VPN đồng thời
![](https://img001.prntscr.com/file/img001/dT103bPyTC6qGVTjeA2NFg.png)

### Cấu hình Interface
- Tại tab Interfaces/InterfaceAssignments, add thêm network port của VPN, đặt tên là vpnlab
![](https://img001.prntscr.com/file/img001/p58NcsQLR_ucAoLD58WeeQ.png)
- Sửa lại các option của interface vpnlab như sau
![](https://img001.prntscr.com/file/img001/ONMWK4srSbKVYjBa_Gtxkw.png)

- Tại tab Interfaces/Bridges, tạo bridge mới và add 2 interface VPNLAB và LAN2 vào bridge
![](https://img001.prntscr.com/file/img001/GUSARCN6SGyz2RUbqWmzFw.png)

### Export OpenVPN config
- Tại tab VPN/OpenVPN/ClientExport, khai báo các thông số:
- Remote Access Server: lựa chọn OpenVPN server
- Hostname Resolution: lựa chọn khai báo IP của WAN
![](https://img001.prntscr.com/file/img001/gZ6gmQG7SoOUvaYI_P3DUw.png)

- Tải gói cài đặt Openvpn config cho windows, có tên ""
![](https://img001.prntscr.com/file/img001/EiQk8dkzSj6v9eq8vg18yQ.png)
![](https://img001.prntscr.com/file/img001/xhFJpyhLS1GVNc76o0Nqsw.png)
![](https://img001.prntscr.com/file/img001/p99FPSg1Q_qHs4PKxJCu4Q.png)
![](https://img001.prntscr.com/file/img001/Ulo684XnR5KGPQwE4ijjqg.png)
![](https://img001.prntscr.com/file/img001/CuQy7l-WTqmJaIzbZKEICg.png)
![](https://img001.prntscr.com/file/img001/CBB47mcpTj-oSCdS4BGo0g.png)

![](https://img001.prntscr.com/file/img001/7kaFVRFaQduWRoogPNQ7nw.png)
