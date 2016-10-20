# Clears old canceled orders at 11pm dayly.
every :day, at: '11pm' do
  rake "order_cleaner"
  rake "review_cleaner"
end

# Learn more: http://github.com/javan/whenever
# Heroku http://stackoverflow.com/questions/8619754/whenever-gem-running-cron-jobs-on-heroku
