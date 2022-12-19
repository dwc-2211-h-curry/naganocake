# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  
  def after_sign_in_path_for(current_customer)
    my_page_customers_path
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  def reject_customer
    @customer = User.find_by(email: params[:customer][:email])
      if @customer
        if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true)
          flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
          redirect_to new_customer_registration
        else
          flash[:notice] = "項目を入力してください"
        end
      end
  end
  
end
