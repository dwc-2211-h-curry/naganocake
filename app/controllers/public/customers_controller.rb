class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end


  def customer_params
     params.require(:customer).permit(:last_name, :email, :encrypted_password)
  end
end
