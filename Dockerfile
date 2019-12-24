FROM ruby:2.5.7
RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
COPY . /myapp
RUN bundle install --path vendor/bundle --without test development
RUN bundle exec rake assets:precompile DATABASE_URL=nulldb://localhost
#RUN bundle exec rails assets:precompile RAILS_ENV=production
#RUN bundle exec rake db:migrate RAILS_ENV=production
