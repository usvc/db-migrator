FROM ruby:2.6.3-alpine
LABEL \
  description = "an image containing the rails migrator" \
  maintainer="@zephinzer" \
  author="@zephinzer"
RUN apk update --no-cache
RUN apk upgrade --no-cache
RUN apk add --no-cache make
RUN apk add --no-cache build-base
RUN apk add --no-cache libxml2-dev
RUN apk add --no-cache libxslt-dev
RUN apk add --no-cache mysql-dev

RUN gem install rake
RUN gem install mysql2
RUN gem install standalone_migrations
RUN gem install faker
RUN gem install bcrypt
WORKDIR /app
