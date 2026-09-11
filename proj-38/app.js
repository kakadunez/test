const express = require('express');
const app = express();
app.get('/', (req, res) => res.send('Dự án chạy hoàn toàn tại Local, không cần AWS!'));
app.listen(3000, () => console.log('Ứng dụng đang chạy ở cổng 3000'));

