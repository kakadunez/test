// Gọi hàm logic từ file app.js độc lập vào để kiểm thử
const { calculateSystemLoad } = require('./app');

// Kịch bản tự động hóa kiểm thử (Unit Test)
test('Hệ thống phải báo CRITICAL khi RAM vượt quá 90%', () => {
  expect(calculateSystemLoad(95)).toBe('CRITICAL');
});

test('Hệ thống phải báo STABLE khi RAM an toàn dưới 90%', () => {
  expect(calculateSystemLoad(70)).toBe('STABLE');
});

