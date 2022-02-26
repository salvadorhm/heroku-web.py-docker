FROM ubuntu:20.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get clean


WORKDIR /webapp
COPY webapp/ . /webapp/

RUN pip3 install -r requirements.txt

RUN useradd -m myuser
USER myuser

# Heroku container
CMD gunicorn --bind 0.0.0.0:$PORT app:wsgiapp 
