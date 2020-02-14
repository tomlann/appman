FROM python:3.7-slim
WORKDIR /app
COPY . /app
RUN pip install Flask gunicorn
RUN pip install -r requirements.txt
RUN pip install flask-sqlalchemy flask-login
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 
CMD [ "wsgi.py" ]
