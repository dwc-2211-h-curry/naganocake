class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end


  def customer_params
     params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :postcode, :address, :phone_number, :encrypted_password)
  end
end
