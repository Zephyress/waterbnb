class BoatsController < ApplicationController
  before_action :find_boat, only: [:edit, :update, :show]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @boats = Boat.all
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    if @boat.save
      redirect_to boats_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    @boat.update(boat_params)
    redirect_to boat_path
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
    redirect_to boats_path
  end

  private

  def boat_params
    params.require(:boat).permit(:title, :description, :category, :price, :photo, :address)
  end

  def find_boat
    @boat = Boat.find(params[:id])
  end
end
