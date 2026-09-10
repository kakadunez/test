#!/bin/bash
echo "============================================="
echo "🗄️ KHỞI CHẠY TỰ ĐỘNG HÓA DATABASE MIGRATION 🗄️"
echo "============================================="

DB_FILE="./proj-34/production.db"

# Xóa database cũ nếu có để test sạch từ đầu
rm -f "$DB_FILE"

# Duyệt qua từng file SQL theo thứ tự đặt tên
for sql_file in ./proj-34/migrations/*.sql; do
    echo "⚙️ Chạy file thay đổi cấu trúc: $(basename "$sql_file")..."
    sqlite3 "$DB_FILE" < "$sql_file"
done

echo "✅ Kiểm tra cấu trúc Database sau khi nâng cấp:"
sqlite3 "$DB_FILE" ".schema users"
echo "============================================="

