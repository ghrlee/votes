# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
env :PATH, ENV['PATH']
env :GEM_PATH, ENV['GEM_PATH']

# ENV.each { |k, v| env(k, v) }

set :output, "#{path}/log/cron_log.log"

every 1.minutes do
  # runner puts "This is the really important thing"
  # runner "State.have_election"
end
