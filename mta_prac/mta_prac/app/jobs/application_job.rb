class ApplicationJob < ActiveJob::Base
  queue_as :default

  before_perform do #|variables| Might be needed
    # invoke another job at your time of choice
    ApplicationJob.set(wait: 20.seconds).perform_later
  end

  def perform(*args) #Might be needed


 response = HTTParty.get("http://mtastat.us/api/trains")
 full_sanitizer = Rails::Html::FullSanitizer.new
 no_tags  = full_sanitizer.sanitize(response)

  body = JSON.parse(no_tags)
  trains = body.each do |line|
    puts line['name']
    puts line['status']
  end


  # data.each do |train|
  # puts train["name"]
  # puts train["status"]
  # end
    #byebug #debugging
    # Do something later
    puts "Hello There "
    puts trains
  end



end








