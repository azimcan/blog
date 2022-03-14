class ApplicationController < ActionController::Base
  helper_method :current_user, :signed_in?
  before_action :post_count

  def login(user_id)
    session[:user_id] = user_id
  end

  def current_user
    # @current_user nil veya false değerdeyse User.find(session[:user_id]) değerini alacaktır.
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      @current_user = 'Anonymous'
    end
  end

  def signed_in?
    current_user == 'Anonymous' ? nil : current_user
  end

  def allowed?
    redirect_to root_path, notice: 'You are not authorized to do this.' if current_user.nil?
  end

  def post_count
    @post_count = Post.count
  end
end
