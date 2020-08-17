class BoatsController < ApplicationController
def new
    @boat = Boat.new
  end

  def create
      @boat = Boat.new(boat_params)
      @boat.user = current_user
    if @boat.save
      redirect_to new_boat_path
    else
      render :new
    end
  end

  private

  def boat_params
    params.require(:boat).permit(:title, :category, :description)
  end
end
