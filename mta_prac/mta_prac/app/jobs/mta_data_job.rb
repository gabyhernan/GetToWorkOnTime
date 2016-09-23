
class MtaDataJob < ApplicationJob
  #self.queue_adapter = :async

#######

  # after_perform do |job|
  #   # invoke another job at your time of choice
  #   job.set(wait: 15.seconds).perform_later
  # end

  # mta = MtaDataJob.new
  # mta.perform_now

end
