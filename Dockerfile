FROM ruby:2.6.4

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
COPY . .