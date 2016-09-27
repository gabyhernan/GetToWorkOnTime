class UsersController < ApplicationController

def index
  @user = User.find_by_id session[:user_id]
end

def show
  @user = User.find(params[:id])
  end

# GET /users/new
def new
  @user = User.new
end

def edit
  @user = User.find(params[:id])
  end

def create
   user = User.create user_params
  user.password = params[:password_digest]
  session[:user_id] = user.id
    #@user.save!/
    flash[:sucess] = "Welcome"
  redirect_to '/index'

  #@user.password = params[:password]
  # if @user.save!
  #   sessions[:user_id] = @user.id
    # flash[:success] = "Welcome #{@user.full_name}!"
  # else
  #   render 'new'
  # end
end

private
# Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password_digest, :full_name, :phone_number, :train_lines, :commute_time, :zipcode,
        :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
    end

end
