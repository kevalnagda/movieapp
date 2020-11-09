import requests
from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def movieapp():
    url = "http://movie-quotes-2.herokuapp.com/api/v1/quotes/random"    
    response = requests.get(url).json()

    return render_template("index.html", film=response['film'], quote=response['content'])

if __name__ == '__main__':
    app.run(debug=False, host='0.0.0.0')