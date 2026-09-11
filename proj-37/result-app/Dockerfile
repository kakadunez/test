FROM node:18-alpine
WORKDIR /app

# Khởi tạo dự án và cài đặt trực tiếp 2 thư viện cần thiết
RUN npm init -y && npm install express redis

COPY . .
EXPOSE 5001
CMD ["node", "server.js"]

