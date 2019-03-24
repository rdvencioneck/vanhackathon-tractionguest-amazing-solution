FROM ruby:2.6

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD rails server -b 'ssl://0.0.0.0:3000?key=certs/privkey.pem&cert=certs/cert.pem'