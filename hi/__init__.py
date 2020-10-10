from flask import Flask

def create_app(test_config=None):
    app = Flask(__name__, instance_relative_config=True)
    from . import main
    app.register_blueprint(main.bp)
    return app

def run():
    app = create_app()
    app.run(host='0.0.0.0')
