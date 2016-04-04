class ShoesController < ApplicationController
  before_action :set_shoe, only: [:edit, :update, :show, :like]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update]
  

  def index
    @shoes = Shoe.paginate(page: params[:page], per_page: 4)
  end


  def show
  end

  def new
    @shoe = Shoe.new
  end
  
  def create
    @shoe = Shoe.new(shoe_params)
    @shoe.runner = current_user
    
    if @shoe.save
      flash[:success] = "Your shoe was created successfully! Yay!"
      redirect_to shoes_path
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @shoe.update(shoe_params)
      flash[:success] = "Your shoe was updated successfully! Yay!"
      redirect_to shoe_path(@shoe)
    else
      render :edit
    end
  end

  def like
    like = Like.create(like: params[:like], runner: current_user, shoe: @shoe)
    if like.valid?
      flash[:success] = "You like this shoe! You've got good taste!"
      redirect_to :back
    else
      flash[:danger] = "No way, Jose! You can only vote on a shoe once!"
      redirect_to :back
    end
  end
  


  private
  
    def shoe_params
      params.require(:shoe).permit(:name, :summary, :description, :picture)
    end
    
    def set_shoe
      @shoe = Shoe.find(params[:id])
    end
    
    def require_same_user
      if current_user != @shoe.runner
        flash[:danger] = "You can only edit your own shoes!"
        redirect_to shoes_path
      end
    end
end