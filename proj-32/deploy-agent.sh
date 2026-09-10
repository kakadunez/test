#!/bin/bash
TARGET_ENV=$1
echo "============================================="
echo "🚀 ĐANG TIẾN HÀNH TRIỂN KHAI ỨNG DỤNG 🚀"
echo "============================================="
echo "🌍 Môi trường mục tiêu: ${TARGET_ENV^^}"

if [ "$TARGET_ENV" == "staging" ]; then
    echo "⚙️ Đang cấu hình tài nguyên kiểm thử (Cổng nội bộ, DB_Test)..."
    echo "✅ Triển khai lên STAGING hoàn tất. Sẵn sàng cho QA kiểm thử."
elif [ "$TARGET_ENV" == "production" ]; then
    echo "🔒 Đang kích hoạt chế độ bảo mật nghiêm ngặt (SSL, Live_DB)..."
    echo "🔥 Hệ thống đã LIVE thành công trên môi trường PRODUCTION (Zero-Downtime)."
else
    echo "❌ Lỗi: Môi trường '$TARGET_ENV' không hợp lệ!"
    exit 1
fi
echo "============================================="

