from flask import Flask, render_template_string
import redis

app = Flask(__name__)
# Kết nối tới container redis thông qua tên dịch vụ trong docker-compose
r = redis.Redis(host='redis', port=6379)

@app.route('/')
def hello():
    r.incr('hits')
    count = r.get('hits').decode('utf-8')
    return render_template_string('<h1>Dự án 37: Hệ thống Voting Microservices!</h1><p>Số lượt bình chọn hiện tại: {{count}}</p>', count=count)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

