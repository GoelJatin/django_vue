FROM python:3.8.3-slim-buster

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends curl; \
    curl -sL https://deb.nodesource.com/setup_10.x | bash -; \
    apt-get install -y --no-install-recommends \
    apt-utils \
    libpq5 \
    postgresql-client \
    nodejs; \
    pip install --no-cache-dir pipenv; \
    npm install -g @vue/cli; \
    # npm install; \
    # npm install --save auth0-js \
    # eventemitter3 \
    # axios; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /src

COPY Pipfile Pipfile.lock ./

RUN pipenv install

ENV BIND_ADDR 0.0.0.0

EXPOSE 8000

COPY ./src .

CMD [ "python", "manage.py", "runserver" ]
