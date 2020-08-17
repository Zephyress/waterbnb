class BoatsController < ApplicationController
  before_action :find_boat, only: [:edit, :update]

  def edit
  end

  def update
    @boat.update(boat_params)
    redirect_to boats_path
  end

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
    params.require(:boat).permit(:title, :description, :category, :price)
  end

  def find_boat
    @Boat = Boat.find(params[:id])
  end
end
