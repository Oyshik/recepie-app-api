FROM python:3.8-alpine
MAINTAINER Oyshik Moitra

ENV PYTHONUNBUFFERED 1

RUN adduser -D user && mkdir /app && chown -R user:user /app && apk add --update  --no-cache postgresql-client &&  \
    apk add --update --no-cache --virtual .tmp-build-deps gcc libc-dev linux-headers postgresql-dev



# ENV PATH /home/user/.local/bin:$PATH
COPY ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt && apk del .tmp-build-deps

USER user

WORKDIR /app
COPY ./app /app







