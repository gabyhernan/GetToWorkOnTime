class UsersController < ApplicationController

def index
end

def show
  end

# GET /users/new
def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  @user.password = params[:password]
  @user.save!
  redirect_to 'index'
end

private
# Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:full_name, :email, :password, :phone_number, :train_lines, :commute_time, :schedule, :zipcode)
    end

end
