FROM python:3.7-alpine
ENV PYTHONUNBUFFERED 1

RUN mkdir /code
WORKDIR /code
COPY . /code/

COPY requirements.txt /code/
RUN pip install -r requirements.txt

RUN apk add --no-cache tzdata
ENV TZ America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
