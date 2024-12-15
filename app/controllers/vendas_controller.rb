class VendasController < ApplicationController
  before_action :set_dependencias, only: [:new]

  def new
    @venda = Venda.new
  end

  def create
    @venda = Venda.new(venda_params)
    @venda.valor = @venda.preco_total # Calcula o valor total da venda

    if @venda.save
      redirect_to new_venda_path, notice: "Venda registrada com sucesso!"
    else
      set_dependencias
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_dependencias
    @atendentes = Atendente.all
    @remedios = Remedio.all
  end

  def venda_params
    params.require(:venda).permit(:remedio_id, :atendente_id, :quantidade)
  end
end
