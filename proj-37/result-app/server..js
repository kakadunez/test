const express = require('express');
const redis = require('redis');
const app = express();
const port = 5001;

// Kết nối tới container Redis thông qua tên dịch vụ định nghĩa trong docker-compose
const client = redis.createClient({
    url: 'redis://redis:6379'
});

client.on('error', (err) => console.log('Redis Client Error', err));

async function startApp() {
    await client.connect();

    app.get('/', async (req, res) => {
        // Lấy số lượt bình chọn từ key 'hits' mà voting-app đã tăng lên
        let count = await client.get('hits');
        if (!count) count = 0;
        
        res.send(`
            <h1>📊 Kết quả hệ thống Microservices (Result App)</h1>
            <p>Dữ liệu được đồng bộ thời gian thực từ Redis database.</p>
            <h2>Tổng số lượt vote ghi nhận: <span style="color:red">${count}</span></h2>
            <script>
                // Tự động F5 trang sau mỗi 3 giây để cập nhật kết quả mới
                setTimeout(() => { location.reload(); }, 3000);
            </script>
        `);
    });

    app.listen(port, () => {
        console.log(`Result App đang chạy ở cổng ${port}`);
    });
}

startApp();

