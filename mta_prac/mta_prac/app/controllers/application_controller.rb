class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception


end

#ApplicationJob.perform_now #Calling Recurring Job
