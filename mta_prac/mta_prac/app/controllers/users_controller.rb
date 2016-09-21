class UsersController < ApplicationController

   #attr_accessor :email, :password, :full_name, :phone_number, :train_lines, :commute_time, :schedule, :zipcode

def index
  #@user = User.find(params[:id])
end

def show
  @user = User.find(params[:id])
  end

# GET /users/new
def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  #@user.password = params[:password]
  if @user.save!
    flash[:success] = "Welcome #{@user.full_name}!"
    redirect_to 'index'
  else
    #render 'new'
  end
end

private
# Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :full_name, :phone_number, :train_lines, :commute_time, :schedule, :zipcode)
    end

end
