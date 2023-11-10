from flask import Flask, request, render_template, jsonify
from utils.crawler import *
from utils.graph import *
from utils.utils import *
from utils.weight import *

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('graph.html')

@app.route('/send_url', methods=['POST'])
def send_url():
    data = request.get_json()
    current_url = data.get('url')
    
    print(f'Received URL: {current_url}')  
    
    new_url_info = crawler(current_url) # get title, user, img, text
    new_idx = update_url(new_url_info) # add new text (update ./data/url.csv
    print(f'The {new_idx}th link added')
    update_weight() # re-calculate TF-IDF and update ./data/weights.csv
    make_graph(new_idx) # update ./templates/graph.html


if __name__ == '__main__':
    app.run('0.0.0.0',5000,debug=True)
