import os

from flask import Flask

app = Flask(__name__)


@app.route("/")
def hello_world():
    return "Hello, World!"


if __name__ == "__main__":
    is_development = os.getenv("APP_ENV", "production") == "development"

    app.run(
        host="0.0.0.0",
        port=5000,
        debug=is_development,
        use_reloader=False,
    )
