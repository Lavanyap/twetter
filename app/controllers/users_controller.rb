class UsersController < ApplicationController
	# All actions in this controller require the presence of an authenticated user.
  before_filter :authenticate_user!

def show
	@user = User.find_by_username(params[:id])
	#if User.exists?(:id => current_user.username)
  		#do nothing
    #else
     # flash[:error] = "user id doesn't exists"
  
	#end
	#@user = User.find_by_name(params[:usename])
end
def index
end



end