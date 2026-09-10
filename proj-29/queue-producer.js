function createMessage(orderId, amount) {
  return {
    eventId: `EVT-${Math.floor(Math.random() * 10000)}`,
    timestamp: new Date().toISOString(),
    payload: { orderId, amount, status: "PENDING_PROCESSING" }
  };
}

module.exports = { createMessage };

