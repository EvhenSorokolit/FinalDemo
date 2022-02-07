FROM alpine:3.14

#ARG bot_token
#ENV TOKEN=$bot_token

#ARG api_key
#ENV API_KEY=$api_key

#ARG pghost
#ENV PGHOST=$pghost

#ARG pg_port
#ENV PG_PORT=$pg_port

#ARG pg_user
#ENV PG_USER=$pg_user

#ARG pg_pass
#ENV PG_PASS=$pg_pass

#ARG db_name
#ENV DB_NAME=$db_name

#RUN echo $TOKEN
#RUN echo $API_KEY
#RUN echo $PGHOST
#RUN echo $PG_PORT
#RUN echo $PG_USER
#RUN echo $PG_PASS
#RUN echo $DB_NAME


RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

WORKDIR /usr/src/app/
# copy project
COPY . /usr/src/app/
# install dependencies
RUN pip install -r ./requirements.txt
# run app
CMD ["python", "app.py"]
