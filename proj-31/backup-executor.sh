#!/bin/bash
echo "============================================="
echo "🗄️ BẮT ĐẦU QUY TRÌNH SAO LƯU DỮ LIỆU DỰ PHÒNG 🗄️"
echo "============================================="

# Tạo thư mục chứa sản phẩm sao lưu
mkdir -p ./proj-31/dist_backups

# Lấy thời gian hiện tại để đặt tên file
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="db_backup_${TIMESTAMP}.tar.gz"

echo "📦 Đang nén tệp tin dữ liệu: sample-database.db..."
tar -czf "./proj-31/dist_backups/${BACKUP_NAME}" -C ./proj-31 sample-database.db

echo "✅ Quy trình hoàn tất thành công!"
echo "📂 Tệp tin dự phòng lưu tại: ./proj-31/dist_backups/${BACKUP_NAME}"
echo "============================================="

