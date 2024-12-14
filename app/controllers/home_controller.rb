class HomeController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @remedios = Remedio.page(params[:page]).per(5)# Carrega todos os remédios
  end

end
