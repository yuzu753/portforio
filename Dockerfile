FROM ruby:2.5.7
RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp
#RUN bundle exec rails assets:precompile RAILS_ENV=production
#RUN bundle exec rake db:migrate RAILS_ENV=production
