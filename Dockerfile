FROM ruby:2.6.1-alpine3.9
LABEL maintainer="Artem Yegorov <yegorov0725@yandex.ru>"
RUN gem install yadisk
WORKDIR /yadisk
CMD sh
