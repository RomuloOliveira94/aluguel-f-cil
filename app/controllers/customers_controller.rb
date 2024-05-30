class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_customer, only: %i[show edit update destroy]

  def index
    @customers = Customer.order(:name)
    authorize @customers
  end

  def show
    authorize @customer
  end

  def new
    @customer = Customer.new
    authorize @customer
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path, notice: 'Customer created successfully'
    else
      render :new, status: :unprocessable_entity
    end
    authorize @customer
  end

  def edit
    authorize @customer
  end

  def update
    authorize @customer
    if @customer.update(customer_params)
      redirect_to customers_path, notice: 'Customer updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @customer
    if @customer.destroy
      redirect_to customers_path, notice: 'Customer deleted successfully'
    else
      redirect_to customers_path, notice: 'Customer could not be deleted'
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :dob, :mobile_phone)
  end

  def load_customer
    @customer = Customer.find(params[:id]) if params[:id]
  end
end
