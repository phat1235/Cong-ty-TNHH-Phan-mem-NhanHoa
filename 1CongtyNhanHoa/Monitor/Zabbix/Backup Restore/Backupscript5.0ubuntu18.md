#!/bin/bash
# Dinh nghia bien
BACKUP_DIR="/backup/zabbix"
DATE=$(date +"%Y%m%d_%H%M%S")
ZABBIX_CONF="/etc/zabbix"
ZABBIX_FRONTEND="/usr/share/zabbix"
DB_TYPE="mysql"  # Chon: mysql hoac postgresql
DB_NAME="zabbix"
# Xac dinh thu muc cau hinh Apache, neu dung nginx thi thay the duong danh
if [ -d "/etc/apache2" ]; then
    APACHE_CONF="/etc/apache2"
elif [ -d "/etc/httpd" ]; then
    APACHE_CONF="/etc/httpd"
else
    echo "Khong tim thay thu muc cau hinh Apache!"
    exit 1
fi

# Tao thu muc backup neu chua ton tai
mkdir -p "$BACKUP_DIR"

echo "========== BAT DAU BACKUP ZABBIX SERVER =========="

# Backup cau hinh Zabbix
tar -czf "$BACKUP_DIR/zabbix_config_$DATE.tar.gz" "$ZABBIX_CONF"
echo "Da backup cau hinh Zabbix"

# Backup frontend Zabbix
tar -czf "$BACKUP_DIR/zabbix_frontend_$DATE.tar.gz" "$ZABBIX_FRONTEND"
echo "Da backup frontend Zabbix"

# Backup cau hinh Apache
tar -czf "$BACKUP_DIR/apache_config_$DATE.tar.gz" "$APACHE_CONF"
echo "Da backup cau hinh Apache"

# Backup database
if [ "$DB_TYPE" == "mysql" ]; then
    mysqldump --defaults-file=/root/.my.cnf --no-tablespaces --single-transaction --quick --lock-tables=false "$DB_NAME" > "$BACKUP_DIR/zabbix_db_$DATE.sql"
    echo "Da backup database MySQL/MariaDB"
elif [ "$DB_TYPE" == "postgresql" ]; then
    PGPASSWORD="your_password" pg_dump -U zabbix -d "$DB_NAME" -F c -f "$BACKUP_DIR/zabbix_db_$DATE.pgdump"
    echo "Da backup database PostgreSQL"
else
    echo "HQTCSDL khong duoc ho tro!"
    exit 1
fi

#Hien thi danh sach file backup
echo "========== DANH SACH FILE BACKUP =========="
ls -lh "$BACKUP_DIR"
echo "Backup hoan tat!"
