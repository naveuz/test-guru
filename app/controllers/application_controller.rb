class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_root_path
    else
      super
    end
  end
end
