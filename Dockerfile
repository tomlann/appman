FROM python:3.7-slim

COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt
RUN pip install flask-sqlalchemy flask-login
RUN pip install Flask gunicorn


CMD gunicorn --bind :$PORT --workers 1 --threads 8 app:app
CMD python wsgi.py

