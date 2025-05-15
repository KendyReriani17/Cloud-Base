from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return "Welcome to my Cloud project built in Python using Terraform!"

if __name__ == '__main__':
    app.run(debug=True)
