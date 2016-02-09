class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :flash_attack

def after_sign_in_path_for(resource)
  topics_path
end

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    
  end
  
  def flash_attack
    #@posts = Post.find(params[:id])
    flash[:notice] = "This is a flash notice."
    #redirect_to @post
  end
end
