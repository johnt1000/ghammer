FROM ruby:2.5.1

RUN apt-get update -qq && \
    apt-get install -y curl \
      libcurl3 libcurl3-gnutls \
      libcurl4-openssl-dev \
      tor privoxy

RUN mkdir /myapp
WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
# COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

COPY . /myapp

# EXPOSE 3000
# EXPOSE 1080
