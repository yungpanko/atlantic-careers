class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_cart


  def current_cart
    session[:cart] ||= []
  end

  def cart_items
    session[:cart].map do |item_id|
      Item.find_by(id:item_id)
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    session[:return_to] = request.url
    redirect_to login_path unless logged_in?
  end

  def require_admin
    unless current_user.try(:admin)
      flash[:danger] = "You must be an admin for that action."
      redirect_to root_path
    end
  end

  def redirect_back_or_default(default_path)
    redirect_to(session[:return_to] || default_path)
    session[:return_to] = nil
  end

end
