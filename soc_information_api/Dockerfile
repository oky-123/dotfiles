FROM ruby:2.6.5
ENV LANG C.UTF-8

# install libraries
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# install bundler
RUN gem install bundler -v 2.0.2
RUN gem install bundler

# setting for app_root directory
RUN mkdir /app
ENV APP_ROOT /app
WORKDIR $APP_ROOT

# setting for gem packages
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock
RUN bundle install

ADD . $APP_ROOT
CMD /bin/sh -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'"
