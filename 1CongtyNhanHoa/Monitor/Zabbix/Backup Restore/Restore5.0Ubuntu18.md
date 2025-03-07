#!/bin/bash
# Dinh nghia bien
BACKUP_DIR="/backup/zabbix"
DATE_LATEST=$(ls -t $BACKUP_DIR | grep -oP '\d{8}_\d{6}' | head -1)
DB_TYPE="mysql"  # Chon: mysql hoac postgresql
DB_NAME="zabbix"

# Xac dinh thu muc cau hinh Apache
if [ -d "/etc/apache2" ]; then
    APACHE_CONF="/etc/apache2"
elif [ -d "/etc/httpd" ]; then
    APACHE_CONF="/etc/httpd"
else
    echo "Khong tim thay thu muc cau hinh Apache!"
    exit 1
fi

# Kiem tra neu khong tim thay backup
if [ -z "$DATE_LATEST" ]; then
    echo "Khong tim thay file backup trong thu muc $BACKUP_DIR!"
    exit 1
fi

echo "========== BAT DAU KHOI PHUC ZABBIX SERVER =========="
echo "Khoi phuc tu ban backup ngay: $DATE_LATEST"

# Khoi phuc cau hinh Zabbix
tar -xzf "$BACKUP_DIR/zabbix_config_$DATE_LATEST.tar.gz" -C /
echo "Da khoi phuc cau hinh Zabbix"

# Khoi phuc frontend Zabbix
tar -xzf "$BACKUP_DIR/zabbix_frontend_$DATE_LATEST.tar.gz" -C /
echo "Da khoi phuc frontend Zabbix"

# Khoi phuc cau hinh Apache
tar -xzf "$BACKUP_DIR/apache_config_$DATE_LATEST.tar.gz" -C /
echo "Da khoi phuc cau hinh Apache"

# Khoi phuc database
if [ "$DB_TYPE" == "mysql" ]; then
    mysql --defaults-file=/root/.my.cnf "$DB_NAME" < "$BACKUP_DIR/zabbix_db_$DATE_LATEST.sql"
    echo "Da khoi phuc database MySQL/MariaDB"
elif [ "$DB_TYPE" == "postgresql" ]; then
    PGPASSWORD="your_password" pg_restore -U zabbix -d "$DB_NAME" -F c "$BACKUP_DIR/zabbix_db_$DATE_LATEST.pgdump"
    echo "Da khoi phuc database PostgreSQL"
else
    echo "He quan tri co so du lieu khong duoc ho tro!"
    exit 1
fi

# Khoi dong lai dich vu Apache & Zabbix
systemctl restart zabbix-server
systemctl restart apache2 || systemctl restart httpd
echo "Da khoi dong lai Zabbix Server va Apache"
echo "Khoi phuc hoan tat!"
