FROM python:3.7-slim
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./
ENV FLASK_APP wsgi.py
ENV FLASK_DEBUG True
RUN pip install Flask gunicorn
RUN pip install -r requirements.txt
RUN pip install flask-sqlalchemy flask-login
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 app:app
