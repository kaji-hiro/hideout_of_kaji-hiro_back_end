FROM ruby:3.0.1
RUN apt-get update -qq && apt-get install -y postgresql-client
WORKDIR /hideout
COPY Gemfile /hideout/Gemfile
COPY Gemfile.lock /hideout/Gemfile.lock
RUN bundle install
COPY . /hideout

# コンテナー起動時に毎回実行されるスクリプトを追加
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# メインプロセスの起動
CMD ["rails", "server", "-b", "0.0.0.0"]
