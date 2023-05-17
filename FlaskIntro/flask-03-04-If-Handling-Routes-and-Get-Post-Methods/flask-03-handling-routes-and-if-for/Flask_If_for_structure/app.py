from flask import Flask, render_template

app = Flask(__name__)

#macjg happen here :)

@app.route('/')
def displayMessage():
    return render_template("index.html", message="Hi from the server side!... What are you looking for :)")

@app.route('/location')
def sametkHQ():
    eqs = ["USA","Pennsylvania"]
    return render_template("body.html", object=eqs)



if __name__=="__main__":
    app.run(host="0.0.0.0", port=3000, debug=False)