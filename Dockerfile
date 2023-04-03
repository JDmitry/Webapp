# syntax=docker/dockerfile:1

FROM python:3.6-slim-buster
WORKDIR /flaskex
COPY requirements.txt requirements.txt
RUN apt update && pip install --upgrade pip && pip3 install -r requirements.txt
COPY . .
CMD [ "python3", "-m", "flask", "run","--host=0.0.0.0"]
EXPOSE 5000