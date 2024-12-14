class RemediosController < ApplicationController
  def index
    @remedios = Remedio.page(params[:page]).per(5)
  end

  def remedio_params
    params.require(:remedio).permit(:Remediocol, :preco, :imagem)
  end

  def finalizar
    # Obter os dados do carrinho (você pode querer validar e ajustar os dados antes de salvar)
    venda_params = params.require(:venda).permit(:total, :atendente_id, remedios_ids: [])

    # Criar a venda
    venda = Venda.new(valor: venda_params[:total], atendente_id: venda_params[:atendente_id])

    # Assumindo que remedios_ids seja um array de ids de remédios
    remedios = Remedio.find(venda_params[:remedios_ids])
    venda.remedios = remedios

    # Salvar a venda
    if venda.save
      # Se a venda for salva com sucesso, enviar resposta
      render json: { success: true, message: "Compra finalizada com sucesso!" }
    else
      # Se ocorrer um erro ao salvar, enviar erro
      render json: { success: false, message: "Erro ao finalizar a compra." }
    end
  end
end
