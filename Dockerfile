FROM python:3.7-slim

COPY . /application
WORKDIR /application

RUN pip install -r requirements.txt
RUN pip install flask-sqlalchemy flask-login
RUN pip install Flask gunicorn

CMD ["python","wsgi.py"]
ENTRYPOINT ["gunicorn"]
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 app:app
