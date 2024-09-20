Các bước cấu hình SSH trên Rockey Linux
Đầu tiên ta bật  SSH lên bằng những câu câu lệnh:
```
systemctl enable sshd
systemctl start sshd
```
Check status SSH
`systemctl status sshd`:
![](https://img001.prntscr.com/file/img001/FsN4VQUYR7Wu5ftiyy-iHw.png)

### Ta cũng enable firewall lên:
![](https://img001.prntscr.com/file/img001/4B1XT7fkRECobVbsuM3K8w.png)
### Ta vào file `sshd_config` để chỉnh sửa Port thành 22999
![](https://img001.prntscr.com/file/img001/bb5Fl8EpTr-PcxZqzCm7Zw.png)
### Ta cấm luôn không cho root đăng nhập SSH
![](https://img001.prntscr.com/file/img001/lh2DdO9jQMC811167MkOmQ.png)
![](https://img001.prntscr.com/file/img001/RG42rs-zSGGxAd7cc2JGlw.png)

5.	![](https://img001.prntscr.com/file/img001/UVFzXcKGQs-bLezfyFSMvQ.png)
### cdcc


10.	![](https://img001.prntscr.com/file/img001/YytNK63pTBSfTlZYiqh8PA.png)
### Ta lại vào file `sshd_config` để chỉnh sửa 

![](https://img001.prntscr.com/file/img001/-wQ4ZkL1SN-w8-qhbP2Ywg.png)
### Cho phép root đăng nhâp bằng ip có địa chỉ `172.16.2.200`
13.	![](https://img001.prntscr.com/file/img001/DkoGrawdQNO3W4SycL2rxQ.png)
### 
15.	![](https://img001.prntscr.com/file/img001/NJxn8FsrQ0CfVyzNBtAIEg.png)
###	Tôi đã thử thay đổi địa chỉ ip khác 172.16.2.200 và đã bị cấm truy cập bằng tài khoản root
	Nhưng vẫn đăng nhập bằng tài khoản khác được!
### Đã bị cấm khi root đăng nhập bới IP khác
16.	![](https://img001.prntscr.com/file/img001/TUNY_jTGRnO4ZlynAPDQUQ.png)
