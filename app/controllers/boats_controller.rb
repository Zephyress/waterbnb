class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
    redirect_to boats_path
  end
end
