FROM node:16
WORKDIR /app
RUN npm init -y && npm install express
COPY . .
EXPOSE 3000
CMD ["node", "app.js"]

