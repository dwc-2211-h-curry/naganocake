class ApplicationController < ActionController::Base

  private

  def login_confirm
    unless customer_signed_in?
      flash[:alert] = "ログインしてください。"
      redirect_to customer_session_path
    end
  end
end
