		
### renumber
- Hiện tại nó đang là `sw 2` và có tên à `GigabitEthernet2/0/x`
- ôi sẽ thay đổi nó thành `sw 1` và sẽ có tên là `Gigabitethernet1/0/x`
![](https://img001.prntscr.com/file/img001/rHDc-JgySwe6v-XYPRzqIg.png)
- Câu lệnh ` switch 2 renumber 1`
- sau đó reload lại thì sẽ có kết quả như dưới đây 
![](https://img001.prntscr.com/file/img001/ytZkdnHwR3aZTaUcDSohvA.png)
- Relload
![](https://img001.prntscr.com/file/img001/oBzUJZx9QzaYLM_i3kqbiw.png)

- Dưới đây là kết quả
![](https://img001.prntscr.com/file/img001/qPSYnqA9SgCL8tcbMzQvlQ.png)


### restore

- Hiện tại tôi đang có 3 VLAN có ID 10 20 30
![](https://img001.prntscr.com/file/img001/qPSYnqA9SgCL8tcbMzQvlQ.png)
- Tôi backup file VLAN.DAT và running-config
![](https://img001.prntscr.com/file/img001/_-3PSH2STgqfuttvDqyIHQ.png)

- Sau khi đã backup
- Tôi tạo VLAN 50
- Tôi cũng thay đổi hostname từ backup1 -> error1
![](https://img001.prntscr.com/file/img001/9-qkhj0NTaOWoFvwQSjxyg.png)
- Thành công tạo VLAN 50 và hostname cũng đã thay đổi
![](https://img001.prntscr.com/file/img001/b2wUrZEOSsGrNO6zuZj0uw.png)
- Tôi restore lại cấu hình vừa nãy đã backup xem xem, VLAN + Hostname sẽ quay trở lại đúng như lúc ban đầu
![](https://img001.prntscr.com/file/img001/G5TBrI0TSy-YO0jGGdUJwA.png)
- OK
![](https://img001.prntscr.com/file/img001/73-Bmv5mSIaqyR53NR_llA.png)

- Kết quả: 
- Đã xóa VLAN 50

- hostname cũng đã thay đổi lại

- ![](https://img001.prntscr.com/file/img001/O3CCzz_4Tj-Yo3j4Sz35vg.png)
		
