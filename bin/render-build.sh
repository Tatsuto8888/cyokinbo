#!/usr/bin/env bash
# exit on error
set -o errexit


bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
# 本番環境のデータを一度リセットしてくれるコマンド（下記コマンド）
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:migrate:reset