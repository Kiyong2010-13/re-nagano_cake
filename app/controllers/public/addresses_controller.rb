class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    else 
      @address = Address.new
      @addresses = current_customer.addresses
      render :index
    end
    
  end

  def update
  end

  def destroy
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end