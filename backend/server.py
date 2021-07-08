from flask import *
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route("/api/user/login", methods = ["POST"])
def login(request):

    return jsonify({"id": "@testuser", "name": "テストユーザー"})

if __name__ == "__main__":
    app.run(port = 8000, debug = "true")