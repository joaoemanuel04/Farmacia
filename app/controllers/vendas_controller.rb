class VendasController < ApplicationController
  def finalizar
    venda_params = params.require(:venda).permit(:total, :atendente_id, remedios_ids: [])

    # Verificar se os ids dos remédios não estão vazios
    if venda_params[:remedios_ids].blank?
      render json: { success: false, message: "Nenhum remédio selecionado." }
      return
    end

    # Criar a venda e associar os remédios
    venda = Venda.new(valor: venda_params[:total], atendente_id: venda_params[:atendente_id])

    # Encontre os remédios
    remedios = Remedio.find(venda_params[:remedios_ids])

    # Associar os remédios à venda
    venda.remedios = remedios

    # Salvar a venda
    if venda.save
      render json: { success: true, message: "Compra finalizada com sucesso!" }
    else
      render json: { success: false, message: "Erro ao finalizar a compra." }
    end
  end
end
