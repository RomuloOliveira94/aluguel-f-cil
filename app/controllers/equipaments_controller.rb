class EquipamentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_equipament, only: %i[show edit update destroy]

  def index
    authorize @equipaments
    @equipaments = Equipament.order(:name, :serial_number)
  end

  def show
    authorize @equipament
  end

  def new
    authorize @equipament
    @equipament = Equipament.new
  end

  def create
    authorize @equipament
    @equipament = Equipament.new(equipament_params)
    if @equipament.save
      redirect_to equipaments_path, notice: 'Equipament created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @equipament
  end

  def update
    authorize @equipament
    if @equipament.update(equipament_params)
      redirect_to equipaments_path, notice: 'Equipament updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @equipament
    if @equipament.destroy
      redirect_to equipaments_path, notice: 'Equipament deleted successfully'
    else
      redirect_to equipaments_path, notice: 'Equipament could not be deleted'
    end
  end

  private

  def equipament_params
    params.require(:equipament).permit(:name, :serial_number)
  end

  def load_equipament
    @equipament = Equipament.find(params[:id]) if params[:id]
  end
end
