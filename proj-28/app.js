function calculateSystemLoad(ramUsage) {
  if (ramUsage > 90) return "CRITICAL";
  return "STABLE";
}

module.exports = { calculateSystemLoad };

