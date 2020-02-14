FROM python:3.7-slim
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./
RUN pip install Flask gunicorn
RUN pip install flask-sqlalchemy flask-login
RUN pip install -r requirements.txt
CMD gunicorn -b 0.0.0.0:8080 --workers=1 --threads=8 wsgi 
