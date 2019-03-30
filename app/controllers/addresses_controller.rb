class AddressesController < ApplicationController
  def create
    @address = Address.new(allowed_params)
    if @address.save
      redirect_to @addressable, notice: 'Address created'
    end
  end

  private
  def allowed_params
    params.require(:address).permit(:city, :postal_code, :street_name, :street_no, :addressable_type, :addressable_id)
  end
end
