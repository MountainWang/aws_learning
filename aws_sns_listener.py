from flask import Flask, request
import json

app = Flask(__name__)


@app.route('/', methods=['POST'])
def process():
    try:
        data = json.loads(request.data)
        print(data)
    except:
        print(request.data)
    return 'process done'

if __name__ == '__main__':
    app.run('0.0.0.0', port=9999)
