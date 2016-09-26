class ApplicationJob < ActiveJob::Base
  queue_as :default

  before_perform do #|variables| Might be needed
    # invoke another job at your time of choice
    ApplicationJob.set(wait: 60.seconds).perform_later
  end

  def perform(*args) #Might be needed
 response = HTTParty.get("http://mtastat.us/api/trains")
 full_sanitizer = Rails::Html::FullSanitizer.new
 no_tags  = full_sanitizer.sanitize(response)

  body = JSON.parse(no_tags)
  train_change = []

  trains = body.each do |line|
   #name = puts line['name']
   #status = puts line['status']
    if line['status'] != "all good."
      train_change.push(line)
    end
  end

  train_change.each do |line|
    # time fixin
    @user = User.where("train_lines LIKE ?  AND  #{Time.now.strftime("%A").downcase} != ''
      AND strftime('%s',#{Time.now.strftime("%A").downcase}) < strftime('%s','09:05')"
       ,'%'+line['name']+'%' ).all

   @user.each do |sheep|
    puts sheep['id'].to_s + sheep['phone_number'].to_s + line['name'] + line['status']
    #call twilio in this loop
  end
end

  puts trains.count
  puts train_change.count
    #byebug #debugging
   # Do something later

   #@users = Users.all
    #puts "Hello There "
    #puts trains

  end
end








