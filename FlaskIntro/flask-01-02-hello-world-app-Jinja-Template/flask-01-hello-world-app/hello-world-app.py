from flask import Flask

app = Flask(__name__)
@app.route("/")
def home():
    return "Hello world"

@app.route('/support')
def support():
    return "<h1 style='color: red'>Support Team email is support@example.com</h1>"

@app.route("/profile/<username>")
def profile(username):
    return f'Welcome {username}'

@app.route('/calculate/<int:x>/<int:y>')
def calculate(x,y):
    return f'Sum of {x} and {y} is {x + y}'

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3000, debug=False)


