from flask import Flask, request, render_template, jsonify
from utils.crawler import *
from utils.graph import *
from utils.utils import *

app = Flask(__name__)

@app.route('/')
def index():
    make_graph(22)
    return render_template('graph.html')

@app.route('/send_url', methods=['POST'])
def send_url():
    data = request.get_json()
    current_url = data.get('url')
    
    # 터미널에 데이터 출력
    print(f'Received URL: {current_url}')  

    return jsonify(message=f'{current_url}')


if __name__ == '__main__':
    app.run('0.0.0.0',5000,debug=True)
