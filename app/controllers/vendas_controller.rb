class VendasController < ApplicationController
  before_action :set_dependencias, only: [:new]
  

  def new
    @venda = Venda.new
    @remedios = Remedio.all

    # Filtragem pela busca
    if params[:search].present?
      @remedios = @remedios.where("remediocol LIKE ?", "%#{params[:search]}%")
    end
  end

  def create
    if params[:venda].nil? || params[:venda][:items].nil? || params[:venda][:items].empty?
      flash[:error] = "Não é possível registrar uma venda sem itens."
      redirect_to new_venda_path
      return
    end

    if params[:venda][:items].blank? || params[:venda][:items].all? { |item| item[:remedio_id].blank? || item[:quantidade].blank? }
      flash[:error] = "Não é possível registrar uma venda sem itens."
      redirect_to new_venda_path
      return
    end
    
    @venda = Venda.new
    venda_items = venda_params[:items]
  
    # Processando todos os itens
    venda_items.each do |item|
      remedio = Remedio.find(item[:remedio_id])
      
      # Garantindo que o valor total seja calculado corretamente
      valor_total = remedio.preco * item[:quantidade].to_i
  
      # Criar a venda para cada item
      venda = Venda.new(
        remedio_id: item[:remedio_id],
        atendente_id: current_user.id, # Assuming you're using Devise
        quantidade: item[:quantidade],
        valor: valor_total
      )
  
      # Salvar a venda
      if venda.save
        flash[:notice] = "Venda registrada com sucesso!"
      else
        flash[:alert] = "Erro ao registrar a venda."
      end
    end
  
    redirect_to new_venda_path # Redireciona para a lista de vendas
  end
  

  private

  def venda_params
    params.require(:venda).permit(items: [:remedio_id, :quantidade])
  end

  def set_dependencias
    @remedios = Remedio.all
  end
end
