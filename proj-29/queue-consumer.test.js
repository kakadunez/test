const { createMessage } = require('./queue-producer');

// Hàm giả lập Consumer xử lý gói tin mất 100ms (Bất đồng bộ)
async function processQueueMessage(message) {
  return new Promise((resolve) => {
    setTimeout(() => {
      message.payload.status = "SUCCESS_PROCESSED";
      resolve(message.payload);
    }, 100);
  });
}

test('Hàng đợi bất đồng bộ phải truyền và xử lý chính xác gói tin payload', async () => {
  const mockMessage = createMessage("ORD-999", 250000);
  
  // Kiểm tra gói tin lúc sinh ra trong hàng đợi
  expect(mockMessage.payload.status).toBe("PENDING_PROCESSING");
  
  // Consumer tiến hành nhận và xử lý bất đồng bộ
  const processedPayload = await processQueueMessage(mockMessage);
  
  // Kiểm tra trạng thái cuối cùng sau khi ra khỏi hàng đợi
  expect(processedPayload.status).toBe("SUCCESS_PROCESSED");
  expect(processedPayload.orderId).toBe("ORD-999");
});

