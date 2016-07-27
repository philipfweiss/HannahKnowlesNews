desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  HannahMailer.news_email("Did my rake" , "", "philipfweiss@gmail.com").deliver_now

end