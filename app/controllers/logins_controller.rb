class LoginsController < ApplicationController
  
  def new
    
  end
  
  def create
    runner = Runner.find_by(email: params[:email])
    if runner && runner.authenticate(params[:password])
      session[:runner_id] = runner.id
      flash[:success] = "Awesome! You're logged in!"
      redirect_to shoes_path
    else
      flash.now[:danger] = "Yikes! Your email or password isn't correct."
      render 'new'
    end
    
  end
    
  def destroy
    session[:runner_id] = nil
    flash[:success] = "You've been logged out. Sorry to see you go!"
    redirect_to root_path
  end
  
    
end