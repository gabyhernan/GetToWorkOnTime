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
    @user = User.find_by(train_lines: line['name'])
    puts @user
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








