FROM python:3.8

WORKDIR /flask-app

RUN pip install flask

COPY hello.py .

ENV FLASK_APP=hello

CMD ["flask", "run", "--host=0.0.0.0"]
