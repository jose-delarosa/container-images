import time
import redis
import os
import socket
from flask import Flask

app = Flask(__name__)
redishost=os.getenv('REDIS_SERVICE_SERVICE_HOST')
redisport=os.getenv('REDIS_SERVICE_SERVICE_PORT')
cache = redis.Redis(redishost, redisport)

def get_hit_count():
    retries = 5
    while True:
        try:
            return cache.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)

@app.route('/')
def hello():
    count = get_hit_count()
    return 'Host: %s, Count: %s\n' % (socket.gethostname(), count)

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
