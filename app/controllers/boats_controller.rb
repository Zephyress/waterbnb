class BoatsController < ApplicationController
  def edit
    @boat = Boat.find(params)
  end

  def update
    @boat = Boat.find(params[:id])
    @boat.update(task_params)
    redirect_to boats_path
  end
end
