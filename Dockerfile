FROM python:3.8-alpine
MAINTAINER Oyshik Moitra

RUN adduser -D user
RUN mkdir /app
RUN chown -R user:user /app
USER user

ENV PYTHONUNBUFFERED 1

ENV PATH /home/user/.local/bin:$PATH
COPY ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt
WORKDIR /app
COPY ./app /app





