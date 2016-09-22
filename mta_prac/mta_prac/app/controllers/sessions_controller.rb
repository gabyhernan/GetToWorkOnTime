class SessionsController < ApplicationController

def new
  @user = User.new
end

def create # hit this route with a form_tag from .erb
  user = User.find_by(email: params[:email]) # search the database by email
  if user
  session[:user_id] = user.id
  redirect_to "/users"
  else # if no user is found in db, redirect or Flash an error
  end

end

def destroy
  session[:user_id] = nil
  redirect_to 'users/signin'
end


private
def user_params
      params.require(:user).permit(:name, :email, :password_digest, :school, :school_address)
    end


end
