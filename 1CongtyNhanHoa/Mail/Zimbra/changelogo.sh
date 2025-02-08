#!/bin/bash
# Script đổi logo Zimbra cho bất kỳ domain nào
# Tác giả: @nhanhoa2000.com

# Yêu cầu nhập thông tin logo và domain
read -p "Nhập vào link Logo App (Size: 283x32): " logoapp
read -p "Nhập vào link Logo Login (Size: 350x48): " logologin
read -p "Nhập vào domain Zimbra: " domain

# Xác nhận thông tin
echo "Đang cập nhật logo cho domain: $domain..."
echo "Logo App: $logoapp"
echo "Logo Login: $logologin"

# Cập nhật logo trong Zimbra
su - zimbra -c "zmprov md $domain zimbraSkinLogoURL '$logoapp'"
su - zimbra -c "zmprov md $domain zimbraSkinLogoLoginBanner '$logologin'"
su - zimbra -c "zmprov md $domain zimbraSkinLogoAppBanner '$logoapp'"

# Khởi động lại dịch vụ để áp dụng thay đổi
echo "Khởi động lại dịch vụ Zimbra..."
su - zimbra -c "zmmailboxdctl restart"

echo "Cập nhật logo hoàn tất! Vui lòng xóa cache trình duyệt và kiểm tra lại."
