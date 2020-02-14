FROM python:3.7-slim
COPY . /app
WORKDIR /app
RUN pip install Flask gunicorn
RUN pip install -r requirements.txt
RUN pip install flask-sqlalchemy flask-login
ENTRYPOINT ["python"]
CMD ["wsgi.py"]
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8
