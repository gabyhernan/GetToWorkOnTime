class ApplicationJob < ActiveJob::Base
  queue_as :default

  before_perform do #|variables| Might be needed
    # invoke another job at your time of choice
    ApplicationJob.set(wait: 1.seconds).perform_later
  end

  def perform#(vars) Might be needed

    #byebug #debugging

    # Do something later
    puts "Hello There "
  end


end








