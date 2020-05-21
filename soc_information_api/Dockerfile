FROM ruby:2.5.3

# install package
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev

# setting for app_root directory
RUN mkdir /app
ENV APP_ROOT /app
WORKDIR $APP_ROOT

# setting for gem packages
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD . $APP_ROOT
