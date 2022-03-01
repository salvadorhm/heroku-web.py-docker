FROM python:3.8-alpine3.15
#FROM ubuntu:18.04

#RUN apt-get update
#RUN apt-get upgrade -y
#RUN apt-get install -y python3
#RUN apt-get install -y python3-pip
#RUN apt-get clean

WORKDIR /webapp
COPY webapp/ . /webapp/

#RUN useradd -m myuser
#USER myuser

RUN python -m pip install --upgrade pip

RUN pip install -r requirements.txt

# Heroku container
CMD gunicorn --bind 0.0.0.0:$PORT app:wsgiapp 
# Try local
#CMD gunicorn --bind 0.0.0.0:8080 app:wsgiapp 