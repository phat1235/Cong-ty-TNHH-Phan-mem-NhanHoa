
### 1. Cấu hình `TMOUT` trong `/etc/profile`
- Mở file `/etc/profile` với `vi`:
  ```bash
  sudo vi /etc/profile
  ```

- Thêm dòng sau vào cuối file:
  ```bash
  TMOUT=9
 
  ```
![](https://img001.prntscr.com/file/img001/vd4H7ZROQ4C0AyVN9nhaXg.png)
### 2. Áp dụng thay đổi
```bash
source /etc/profile
```

![](	https://img001.prntscr.com/file/img001/2V9IeM_wQb68RS4105LVZg.png)
