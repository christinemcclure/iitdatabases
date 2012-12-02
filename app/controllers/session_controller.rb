class SessionController < ApplicationController

  def new
    @terms = Term.all_iit_subjects
  end
  
  def create
    session[:password] = params[:password]
    if admin?
      flash[:notice] = "logged in"
    end
    redirect_to root_path
  end

  def destroy
    reset_session
    flash[:notice] = "guest"
    redirect_to root_path
  end
end
