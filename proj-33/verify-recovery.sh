#!/bin/bash
echo "============================================="
echo "🔍 ĐANG KIỂM TRA TÍNH TOÀN VẸN FILE PHỤ CỒI 🔍"
echo "============================================="

FILE_TARGET="./proj-33/extracted/sample-database.db"

if [ -f "$FILE_TARGET" ]; then
    echo "✅ Đã tìm thấy file phục hồi thành công."
    
    # Kiểm tra xem có chứa từ khóa bảo mật "USR-001" từ bài 31 không
    if grep -q "USR-001" "$FILE_TARGET"; then
        echo "🛡️ Chuỗi dữ liệu: HỢP LỆ (Không có dấu hiệu mất mát)."
        echo "============================================="
        exit 0
    else
        echo "❌ Lỗi: Cấu trúc dữ liệu bên trong bị sai lệch!"
        echo "============================================="
        exit 1
    fi
else
    echo "❌ Lỗi: Không tìm thấy file dữ liệu sau giải nén!"
    echo "============================================="
    exit 1
fi

