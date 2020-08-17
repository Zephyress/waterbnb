class BoatsController < ApplicationController
  before_action :find_boat, only:[:edit, :update]

  def edit
  end

  def update
    @boat.update(boat_params)
    redirect_to boats_path
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :description, :category, :price)
  end

  def find_boat
    @Boat = Boat.find(params[:id])
  end
end
