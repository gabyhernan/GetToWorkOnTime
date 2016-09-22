class SessionsController < ApplicationController

def create # hit this route with a form_tag from .erb
  @user = User.find_by(email: params[:email]) # search the database by email
  if @user # if a user is found in db
  session[:user_id] = user.id
  else # if no user is found in db, redirect or Flash an error
  end
  redirect_to "/users"
end

def destroy
  session[:user_id] = nil
  redirect_to 'users/signin'
end


private
def user_params
      params.require(:user).permit(:name, :email, :password_hash, :school, :school_address)
    end


end
