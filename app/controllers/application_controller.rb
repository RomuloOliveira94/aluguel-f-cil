class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError do
    redirect_to root_path, alert: 'Você não tem permissão para acessar essa página.'
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end
end
