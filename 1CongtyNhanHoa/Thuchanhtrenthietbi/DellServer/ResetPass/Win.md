Bước 1 – Chuẩn bị 1 USB có sẵn hệ điều hành Windows Server 2019

Boot hệ điều hành Windows Server vào USB

Bước 2 – Khởi động Server và vào Menu Boot

Server Dell : Bấm F11

Bước 3 – Vào giao diện Setup

Bấm Next để tiếp tục
![](https://img001.prntscr.com/file/img001/6Rmv9MHaQQe7lW-tH4uHqA.png)
Bước 4 – Vào giao diện “Repair your computer”

Chọn “repair your computer” ở phía dưới màn hình.
![](https://img001.prntscr.com/file/img001/7nR2zl1fSUCZbxSQS4KUdg.png)
Bước 5 – Vào giao diện  “Troubleshoot”

Chọn “Troubleshoot” như trên hình.
![](https://img001.prntscr.com/file/img001/bcSVMZRrTE-1ZM2MdavGXQ.png)
Bước 6 – Vào giao diện“Command Prompt”

Chọn “command prompt”.
![](https://img001.prntscr.com/file/img001/zrJDN72hReKFRc82-Wm8MA.png)
Bước 7 – Thực hiện gõ các lệnh trong CMD

Vui vòng gõ các dòng lệnh sau
```C:
cd Windows
cd System32
move utilman.exe utilman.exe.bak
copy cmd.exe utilman.exe
net user administrator /active:yes
shutdown -r -t 0
``` 
Bước 8 – Đặt Password mới
Sau khi khỏi động lại Server, tại gia diện đăng nhập, vui lòng bấm phím Win+U

Bên trong CMD gõ các lệnh sau

```
net user Administrator your-new-password
exit
```
![](https://img001.prntscr.com/file/img001/ErLTMtAWQ-ePx0jOm5y8Og.png)

Bước 9 – Rollback
Mật khẩu của bạn đã được thiết lập lại. Tuy nhiên, bạn cần khôi phục các thay đổi của mình bằng utilman.exe.
Chỉ cần khởi động lại máy chủ của bạn và lặp lại hướng dẫn này. Bên trong cửa sổ CMD ở chế độ Windows Recovery, hãy gõ:

```C:
cd Windows
cd System32
del utilman.exe ren utilman.exe.bak utilman.exe
shutdown -r -t 0
```
![](https://img001.prntscr.com/file/img001/03E34g2WR8uHyjTMF3KLrQ.png)

Ta đăng nhập lại nào

![](https://img001.prntscr.com/file/img001/iN-tyh8XS5KRgFHC_CkVwQ.png)
![](https://img001.prntscr.com/file/img001/NObDGuE3RYO5ZmbBKVCgJw.png)

C2: Sử dụng phần mềm

![](https://img001.prntscr.com/file/img001/qwOjgh5_QQGorWwPbrCQ2Q.png)
![](https://img001.prntscr.com/file/img001/L8BNGjgyQOK8r8YW0S5nug.png)
![](https://img001.prntscr.com/file/img001/K-zqkFOKTxmnFd2uNwm8Qw.png)
![](https://img001.prntscr.com/file/img001/P-eYFFjISzWePL1hyFUiqA.png)
![](https://img001.prntscr.com/file/img001/Lpv6BALfQA2X-Ex4YbJn-A.png)
![](https://img001.prntscr.com/file/img001/LnLpEOK0RvG86M2p3hN0jA.png)
![](https://img001.prntscr.com/file/img001/cAif_IRmRea51ec8fM7FwQ.png)
![](https://img001.prntscr.com/file/img001/OUlSOQZ9TbyWyoC7iVQSPg.png)
![](https://img001.prntscr.com/file/img001/iER4-LotT9G8v3BRzPORUg.png)
![](https://img001.prntscr.com/file/img001/rV_Oj0LGQM-1qiT1p7v7Og.png)
