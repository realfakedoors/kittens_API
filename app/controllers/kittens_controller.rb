class KittensController < ApplicationController
  def new
    @kitten = Kitten.new()
  end
  
  def edit
    @kitten = Kitten.find(params[:id])
  end
  
  def show
    @kitten = Kitten.find(params[:id])
  end
  
  def index
    @kittens = Kitten.all
  end
  
  def create
    @kitten = Kitten.new(kitten_params)
    
    if @kitten.save
      flash[:notice] = "Kitten successfully created!"
      redirect_to @kitten
    else
      flash[:alert] = "Whoops! You somehow failed to submit the form! Try again!"
      render 'new'
    end
  end
  
  def update
    @kitten = Kitten.find(params[:id])
    
    if @kitten.update_attributes(kitten_params)
      flash[:notice] = "Kitten updated!"
      redirect_to @kitten
    else
      render 'edit'
    end
  end
  
  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    
    flash[:alert] = "You killed #{@kitten.name}! You monster!"
    redirect_to root_path
  end
  
  private
  
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
