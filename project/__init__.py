import os 

from flask import Flask, g
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager

db = sqlalchemy.create_engine(
# Equivalent URL:
# mysql+pymysql://<db_user>:<db_pass>@/<db_name>?unix_socket=/cloudsql/<cloud_sql_instance_name>
    sqlalchemy.engine.url.URL(
        drivername="mysql+pymysql",
        username=bigbro,
        password=bigbro27,
        database=pymodel10,
        query={"unix_socket": "/cloudsql/{}".format(prefab-envoy-267720:us-central1:hopethisworks)},
    ),
    # ... Specify additional properties here.
    # ...
)

# init SQLAlchemy so we can use it later in our models
def create_app():
    app = Flask(__name__)

    db.init_app(app)
    login_manager = LoginManager()
    login_manager.login_view = 'auth.login'
    login_manager.init_app(app)

    from .models import User
    
    @login_manager.user_loader
    def load_user(user_id):
        # since the user_id is just the primary key of our user table, use it in the query for the user
        return User.query.get(int(user_id))
    
    # blueprint for auth routes in our app
    from .auth import auth as auth_blueprint
    app.register_blueprint(auth_blueprint)

    # blueprint for non-auth parts of app
    from .main import main as main_blueprint
    app.register_blueprint(main_blueprint)

    return app
