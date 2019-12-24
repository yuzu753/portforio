FROM ruby:2.5.7
RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev nodejs
# node
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y yarn
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp
#RUN bundle exec rails assets:precompile RAILS_ENV=production
#RUN bundle exec rake db:migrate RAILS_ENV=production
