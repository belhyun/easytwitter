# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "/home/www/rails_app/mifd/log/cron_log.log"
#
set :environment, 'production'
every 1.hours do
#   command "/usr/bin/some_great_command"
   runner "Tweet.create_tweet"
#   rake "some:great:rake:task"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
