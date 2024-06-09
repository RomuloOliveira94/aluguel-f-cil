class EquipamentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_equipament, only: %i[show edit update destroy]

  def index
    @equipaments = Equipament.order(:name, :serial_number)
    authorize @equipaments
  end

  def search
    period_start = params[:period_start]&.presence
    period_end = params[:period_end]&.presence

    @q = if period_start && period_end
           Equipament.availables(period_start, period_end).ransack(name_cont: params[:q])
         else
           Equipament.none
         end

    @equipaments = @q.result(distinct: true)

    render layout: false
  end

  def show
    authorize @equipament
  end

  def new
    @equipament = Equipament.new
    authorize @equipament
  end

  def create
    @equipament = Equipament.new(equipament_params)
    if @equipament.save
      redirect_to equipaments_path, notice: 'Equipament created successfully'
    else
      render :new, status: :unprocessable_entity
    end
    authorize @equipament
  end

  def edit
    authorize @equipament
  end

  def update
    if @equipament.update(equipament_params)
      redirect_to equipaments_path, notice: 'Equipament updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
    authorize @equipament
  end

  def destroy
    if @equipament.destroy
      redirect_to equipaments_path, notice: 'Equipament deleted successfully'
    else
      redirect_to equipaments_path, notice: 'Equipament could not be deleted'
    end
    authorize @equipament
  end

  private

  def equipament_params
    params.require(:equipament).permit(:name, :serial_number)
  end

  def load_equipament
    @equipament = Equipament.find(params[:id]) if params[:id]
  end
end
