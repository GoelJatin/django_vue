FROM python:3.8.3-slim-buster

RUN apt-get update && \
    apt-get install -y libpq5 postgresql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV BIND_ADDR 0.0.0.0

EXPOSE 3000

WORKDIR /src

COPY . .

CMD [ "python", "manage.py", "runserver" ]
