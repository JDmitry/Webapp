# syntax=docker/dockerfile:1

FROM python:3.6-slim-buster AS compile-image
RUN apt update && pip install --upgrade pip
COPY . /flaskex
WORKDIR /flaskex
RUN pip3 install -r requirements.txt

FROM python:3.6-slim-buster
COPY --from=compile-image /flaskex/ /flaskex
COPY --from=compile-image /usr/local/lib/python3.6 /usr/local/lib/python3.6
WORKDIR /flaskex
EXPOSE 5000
ENTRYPOINT [ "python3", "-m", "flask", "run","--host=0.0.0.0"]