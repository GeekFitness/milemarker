class RunsController < ApplicationController
  
  
  def new
    @run = Run.new
  end

  def show
  end
  
  def index
    @runs = Run.paginate(page: params[:page], per_page: 4)
  end

  def create
    @run = Run.new(shoe_params)
    @run.runner = current_user
    
    if @run.save
      flash[:success] = "You successfully added a run to your shoe! Yay!"
      redirect_to shoes_path
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @run.update(run_params)
      flash[:success] = "You updated your run successfully! Yay!"
      redirect_to shoe_path(@shoe)
    else
      render :edit
    end
  end


  
  
private
  
  def run_params
    params.require(:run).permit(:name, :summary, :description, :picture)
  end
    
  def set_run
    @shoe = Run.find(params[:id])
  end
    
  def require_same_user
    if current_user != @run.runner
      flash[:danger] = "You can only edit your own runs!"
      redirect_to shoes_path
    end
  end

  
end
