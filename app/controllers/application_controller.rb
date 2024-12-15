class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def after_sign_up_path_for(resource)
    home_new_path # Redireciona para a página de login
  end

  def after_sign_in_path_for(resource)
    if resource.atendente.nil?
      # Se o usuário não tem um atendente, redireciona para a página de cadastro do atendente
      home_new_path
    else
      # Caso contrário, redireciona para a página inicial do sistema
      home_index_path
    end
  end

  # Redirecionar após logout
  def after_sign_out_path_for(resource_or_scope)
    unauthenticated_root_path
  end

  #before_action :authenticate_user!

end
