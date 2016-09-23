class ApplicationController < ActionController::Base
attr_accessor :email, :password, :full_name, :phone_number, :train_lines, :commute_time, :schedule, :zipcode

  protect_from_forgery with: :exception


end

ApplicationJob.perform_now #Calling Recurring Job
