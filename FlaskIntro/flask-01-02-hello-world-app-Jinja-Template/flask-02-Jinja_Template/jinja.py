from flask import Flask, render_template
app = Flask(__name__)
@app.route('/')
def home():
    return render_template("index.html", name="*****", lastname="*****")
@app.route("/calc/<int:x>/<int:y>")
def calc(x, y):
    print(x,y)
    return render_template("body.html", x=x, y=y, sum = int(x)+int(y))

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=30000, debug=False)