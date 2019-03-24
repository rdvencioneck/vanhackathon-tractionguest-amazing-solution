FROM ruby:2.6

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY ./ .

ENV VEHICLE-RESEARCH_DATABASE_HOST=35.202.90.41
ENV VEHICLE-RESEARCH_DATABASE_USERNAME=dbadmin
ENV VEHICLE-RESEARCH_DATABASE_PASSWORD=P4s_W0rD9
ENV VEHICLE-RESEARCH_DATABASE=userinfo

USER root
RUN apt-get update && apt-get install default-libmysqlclient-dev

CMD rails server -b 'ssl://0.0.0.0:3000?key=certs/privkey.pem&cert=certs/cert.pem'