```
!
! Last configuration change at 09:13:47 CST Wed Aug 28 2024 by phat
! NVRAM config last updated at 09:13:55 CST Wed Aug 28 2024 by phat
!
version 12.2
no service pad
service timestamps debug datetime msec
service timestamps log datetime msec
no service password-encryption
!
hostname Kythuat
!
boot-start-marker
boot-end-marker
!
enable password phat2003
!
username admin privilege 15 secret 5 $1$L.3U$RfsvjwW6nvVQ.yiN0CF4a/
username phat password 0 1234
!
!
no aaa new-model
clock timezone CST 7
switch 3 provision ws-c3750g-48ts
system mtu routing 1500
ip domain-name google.com
ip name-server 8.8.8.8
!
!
!
!
crypto pki trustpoint TP-self-signed-120814336
 enrollment selfsigned
 subject-name cn=IOS-Self-Signed-Certificate-120814336
 revocation-check none
 rsakeypair TP-self-signed-120814336
!
!
crypto pki certificate chain TP-self-signed-120814336
 certificate self-signed 01 nvram:IOS-Self-Sig#3636.cer
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!
vlan internal allocation policy ascending
!
ip ssh version 1
!
!
!
interface GigabitEthernet3/0/1
 switchport access vlan 100
 switchport mode access
!
interface GigabitEthernet3/0/2
 switchport mode access
!
interface GigabitEthernet3/0/3
 switchport mode access
!
interface GigabitEthernet3/0/4
 switchport mode access
!
interface GigabitEthernet3/0/5
 switchport mode access
!
interface GigabitEthernet3/0/6
!
interface GigabitEthernet3/0/7
!
interface GigabitEthernet3/0/8
!
interface GigabitEthernet3/0/9
!
interface GigabitEthernet3/0/10
!
interface GigabitEthernet3/0/11
!
interface GigabitEthernet3/0/12
!
interface GigabitEthernet3/0/13
!
interface GigabitEthernet3/0/14
!
interface GigabitEthernet3/0/15
!
interface GigabitEthernet3/0/16
!
interface GigabitEthernet3/0/17
!
interface GigabitEthernet3/0/18
!
interface GigabitEthernet3/0/19
!
interface GigabitEthernet3/0/20
!
interface GigabitEthernet3/0/21
!
interface GigabitEthernet3/0/22
!
interface GigabitEthernet3/0/23
!
interface GigabitEthernet3/0/24
!
interface GigabitEthernet3/0/25
!
interface GigabitEthernet3/0/26
!
interface GigabitEthernet3/0/27
!
interface GigabitEthernet3/0/28
!
interface GigabitEthernet3/0/29
!
interface GigabitEthernet3/0/30
!
interface GigabitEthernet3/0/31
!
interface GigabitEthernet3/0/32
!
interface GigabitEthernet3/0/33
!
interface GigabitEthernet3/0/34
!
interface GigabitEthernet3/0/35
!
interface GigabitEthernet3/0/36
!
interface GigabitEthernet3/0/37
!
interface GigabitEthernet3/0/38
!
interface GigabitEthernet3/0/39
!
interface GigabitEthernet3/0/40
!
interface GigabitEthernet3/0/41
!
interface GigabitEthernet3/0/42
!
interface GigabitEthernet3/0/43
!
interface GigabitEthernet3/0/44
!
interface GigabitEthernet3/0/45
!
interface GigabitEthernet3/0/46
!
interface GigabitEthernet3/0/47
!
interface GigabitEthernet3/0/48
!
interface GigabitEthernet3/0/49
!
interface GigabitEthernet3/0/50
!
interface GigabitEthernet3/0/51
!
interface GigabitEthernet3/0/52
!
interface Vlan1
 no ip address
!
interface Vlan100
 ip address 172.16.2.245 255.255.240.0
!
ip default-gateway 172.16.10.1
ip classless
ip http server
ip http secure-server
!
!
kron occurrence backupminute in 2 recurring
 policy-list backupconfig
!
kron occurrence backupstarupminute in 1 recurring
 policy-list backupstartup-config
!
kron occurrence restore in 3 recurring
 policy-list restorerunning-config
!
kron policy-list backupconfig
 cli show run | redirect tftp://172.16.2.165/Kythuat-shrun.cfg
 cli copy running-config tftp://172.16.2.165/running-config-SWkythuat.cfg
!
kron policy-list backupstartup-config
 cli copy startup-config tftp://172.16.2.165/Sw-startup.cfg
!
kron policy-list restorerunning-config
 cli copy tftp://172.16.2.165/running-config-SWkythuat.cfg running-config
!
!
!
!
line con 0
 password phat20033
 login
line vty 0 1
 password phat123
 login local
 transport input ssh
line vty 2 4
 login local
 transport input ssh
line vty 5 15
 login
!
ntp clock-period 36029114
ntp server 194.225.150.25
ntp server 129.250.35.251
end
```
