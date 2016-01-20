class SessionsController < ApplicationController

  def new
  end

  def create
    #test credentials
    #initialize session hash
  end

  def destroy
    #empty session hash
    redirect_to items_path
  end

  private
  def session_params
    params.require(:session).permit(:user_id, :hashed_password)
  end

end
