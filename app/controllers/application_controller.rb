class ApplicationController < ActionController::Base

  private

  def customer_login_confirm
    unless customer_signed_in?
      flash[:alert] = "ログインしてください。"
      redirect_to new_customer_session_path
    end
  end

  def admin_login_confirm
    unless admin_signed_in?
      flash[:alert] = "ログインしてください。"
      redirect_to new_admin_session_path
    end
  end
end
