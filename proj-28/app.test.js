// Hàm tính toán logic của ứng dụng
function calculateSystemLoad(ramUsage) {
  if (ramUsage > 90) return "CRITICAL";
  return "STABLE";
}

// Kịch bản tự động hóa kiểm thử (Unit Test)
test('Hệ thống phải báo CRITICAL khi RAM vượt quá 90%', () => {
  expect(calculateSystemLoad(95)).toBe('CRITICAL');
});

test('Hệ thống phải báo STABLE khi RAM an toàn dưới 90%', () => {
  expect(calculateSystemLoad(70)).toBe('STABLE');
});

