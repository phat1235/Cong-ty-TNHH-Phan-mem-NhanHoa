#!/bin/bash
# Script thay doi title Zimbra Web Client, Webmail Client va Web Admin
# Cac coment ho tro UTF-8 khong dau, tranh loi hien thi
# OS + VerZimbra Release 8.8.15.GA.4179.UBUNTU20.64 UBUNTU20_64 FOSS edition, Patch 8.8.15_P45.
# Kiem tra user, chi cho phep chay duoi root
if [[ $EUID -ne 0 ]]; then
   echo "Vui long chay script voi quyen root!" 
   exit 1
fi

# Nhap tieu de moi
read -p "Nhap tieu de moi cho trang dang nhap User (Login Client): " title_login_client
read -p "Nhap tieu de moi sau khi dang nhap Webmail Client: " title_webmail_client
read -p "Nhap tieu de moi cho trang dang nhap Admin (Admin Console): " title_admin

# Dinh nghia cac tep can chinh sua 
# 16
FILE_LOGlN_CLIENT="/opt/zimbra/jetty/webapps/zimbra/WEB-INF/classes/messages/ZmMsg.properties"
FILE_WEBMAIL_CLIENT="/opt/zimbra/jetty/webapps/zimbra/WEB-INF/classes/messages/ZmMsg.properties"
FILE_ADMIN="/opt/zimbra/jetty_base/webapps/zimbraAdmin/WEB-INF/classes/messages/ZabMsg.properties"

# Thay doi tieu de trang dang nhap User
if grep -q "zimbraLoginTitle" "$FILE_LOGIN_CLIENT"; then
    sed -i "s/^zimbraLoginTitle.*/zimbraLoginTitle = $title_login_client/" "$FILE_LOGIN_CLIENT"
    echo "Da cap nhat tieu de trang dang nhap User."
else
    echo "Khong tim thay dong chua 'zimbraLoginTitle' trong $FILE_LOGIN_CLIENT!"
fi

# Thay doi tieu de Webmail Client sau khi dang nhap
if grep -q "zimbraTitle" "$FILE_WEBMAIL_CLIENT"; then
    sed -i "s/^zimbraTitle.*/zimbraTitle = $title_webmail_client/" "$FILE_WEBMAIL_CLIENT"
    echo " Da cap nhat tieu de Webmail Client."
else
    echo " Khong tim thay dong chua 'zimbraTitle' trong $FILE_WEBMAIL_CLIENT!"
fi

# Thay doi tieu de trang dang nhap Admin
if grep -q "zimbraAdminTitle" "$FILE_ADMIN"; then
    sed -i "s/^zimbraAdminTitle.*/zimbraAdminTitle = $title_admin/" "$FILE_ADMIN"
    echo " Da cap nhat tieu de trang dang nhap Admin."
else
    echo "Khong tim thay dong chua 'zimbraAdminTitle' trong $FILE_ADMIN!"
fi

# Restart dich vu de ap dung thay doi
echo " Khoi dong lai dich vu Zimbra..."
su - zimbra -c "zmmailboxdctl restart"
echo " Dich vu da duoc khoi dong lai."

# Nhac nho nguoi dung xoa cache trinh duyet
echo "Luu y: Xoa cache trinh duyet de hien thi thay doi chinh xac!"
