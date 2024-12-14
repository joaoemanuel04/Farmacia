class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def index
    @remedios = Remedio.page(params[:page]).per(5)# Carrega todos os remédios
  end

end
