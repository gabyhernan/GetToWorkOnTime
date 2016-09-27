class ApplicationJob < ActiveJob::Base
  queue_as :default

  before_perform do #|variables| Might be needed
    # invoke another job at your time of choice
    ApplicationJob.set(wait: 300.seconds).perform_later
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

weekday = Time.now.strftime("%A").downcase
  train_change.each do |line|
    # time fixin
    @user = User.where("train_lines LIKE '%#{line['name']}%'  AND  #{weekday} != '' AND #{Time.now.hour}*60+#{Time.now.min} BETWEEN strftime('%H',#{weekday})*60+strftime('%M',#{weekday})-60-commute_time AND strftime('%H',#{weekday})*60+strftime('%M',#{weekday})-45-commute_time  ").all

   @user.each do |sheep|
    #puts  Time.now.hour.to_s+Time.now.min.to_s+sheep['id'].to_s + " " + sheep['phone_number'].to_s + " " + line['name'] + " " + line['status']
    client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
    client.messages.create :to => sheep['phone_number'],
    :from => ENV["TWILIO_NUMBER"],
    :body => "Hey there" + " " + sheep['full_name']+"  just wanted to let you know there is a change on Line "+line['name']+ " it's " + line['status']

  end
end
  #puts trains.count
  #puts train_change.count
    #byebug #debugging
   # Do something later
  end
end

