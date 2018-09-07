class MachinesController < ApplicationController
  def index
    @owner = Owner.find(params[:owner_id])
  end

  def show
    @machine = Machine.find(params[:id])
    @snacks = Snack.all
    @snacks_avg = Snack.average
  end
end
