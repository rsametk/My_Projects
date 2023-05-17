from flask import Flask, render_template, redirect, url_for


app =  Flask (__name__)

@app.route('/evens')
def evens():
    return render_template("evens.html")

@app.route('/greet')
def greet():
    return render_template("greet.html", name="SametK")

@app.route('/list')
def list():
    return render_template("list10.html")

@app.route('/google')
def redirect_google():
    return redirect("https://www.google.com")

@app.route('/login')
def login():
    return("<h1> You are not allowwed to do this action, please login</h1>")


@app.route('/redirect')
def redirected():
    return redirect(url_for("login"))


if __name__=="__main__":
    app.run(host='0.0.0.0',port=3000)