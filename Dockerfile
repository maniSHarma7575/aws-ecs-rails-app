FROM ruby:3.2.2

RUN apt-get clean all && apt-get update -qq && apt-get install -y build-essential libpq-dev \
    curl gnupg2 apt-utils default-libmysqlclient-dev git libcurl3-dev cmake \
    libssl-dev pkg-config openssl imagemagick file nodejs yarn

RUN mkdir /rails-app
WORKDIR /rails-app

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

COPY . /rails-app

COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
