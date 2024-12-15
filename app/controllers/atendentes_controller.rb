class AtendentesController < ApplicationController
  before_action :authenticate_user!

  def create
    @atendente = current_user.build_atendente(atendente_params)

    if @atendente.save
      redirect_to home_index_path, notice: 'Atendente cadastrado com sucesso.'
    else
      render 'home/new'
    end
  end

  private

  def atendente_params
    params.require(:atendente).permit(:Nome, :CPF, :dt_nasce)
  end
end
