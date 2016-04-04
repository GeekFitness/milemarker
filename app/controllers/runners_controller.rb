class RunnersController < ApplicationController
  before_action :set_runner, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]
  

  def index
    @runners = Runner.paginate(page: params[:page], per_page: 3)
  end
  
  def new
    @runner = Runner.new
  end

  def create
    @runner = Runner.new(runner_params)
      if @runner.save
        flash[:success] = "You're now a Runner! Hooray!"
        session[:runner_id] = @runner.id
        redirect_to shoes_path
      else
        render 'new'
      end
  end
  
  def edit
  end
  
  def update
      if @runner.update(runner_params)
        flash[:success] = "Your profile has been successfully updated!"
        redirect_to runner_path(@runner)
      else
        render 'edit'
      end
  end
  
  def show
    @shoes = @runner.shoes.paginate(page: params[:page], per_page: 3)
  end
  
  private
  
  def runner_params
    params.require(:runner).permit(:runnername, :email, :password)
  end
  
  def set_runner
    @runner = Runner.find(params[:id])
  end
  
  def require_same_user
    if current_user != @runner
      flash[:danger] = "You can only edit your own profile"
      redirect_to root_path
    end
  end
end
