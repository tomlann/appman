FROM python:3.7-slim

COPY . /app
WORKDIR /app

RUN pip install Flask gunicorn
RUN pip install flask-sqlalchemy flask-login
RUN pip install -r requirements.txt
CMD exec gunicorn -b 0.0.0.0:8080 wsgi.py
