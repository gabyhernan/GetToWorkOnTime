class ApplicationJob < ActiveJob::Base
  queue_as :default

  before_perform do #|variables| Might be needed
    # invoke another job at your time of choice
    ApplicationJob.set(wait: 20.seconds).perform_later
  end

  def perform(*args) #Might be needed


 response = HTTParty.get("http://mtastat.us/api/trains")
 binding.pry
  body = JSON.parse(response.body)
  body.each do |line| puts line['name'] end

  # data.each do |train|
  # puts train["name"]
  # puts train["status"]
  # end
    #byebug #debugging
    # Do something later
    puts "Hello There "
    puts body
  end



end








