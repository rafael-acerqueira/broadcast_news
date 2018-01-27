set :output, "#{path}/log/cron.log"

every '* 12 * * *' do
  command "ruby #{path}/run.rb"
end
