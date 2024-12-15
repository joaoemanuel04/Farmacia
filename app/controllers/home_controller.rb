class HomeController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @remedios = Remedio.page(params[:page]).per(5)# Carrega todos os remédios
  end

  def new
    # Verifica se o usuário já tem um atendente. Se não, cria um objeto Atendente para o formulário
    @atendente = current_user.atendente || current_user.build_atendente
  end

end
