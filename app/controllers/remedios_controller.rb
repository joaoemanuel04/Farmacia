class RemediosController < ApplicationController
  before_action :set_remedio, only: [:show, :edit, :update, :destroy]

  # Lista todos os remédios com paginação
  def index
    @remedios = Remedio.page(params[:page]).per(5)
  end

  # Exibe os detalhes de um único remedio
  def show
  end

  # Exibe o formulário para criação de um novo remedio
  def new
    @remedio = Remedio.new
  end

  # Cria um novo remedio
  def create
    @remedio = Remedio.new(remedio_params)
    if @remedio.save
      redirect_to @remedio, notice: 'Remédio criado com sucesso!'
    else
      render :new
    end
  end

  # Exibe o formulário para editar um remedio
  def edit
  end

  # Atualiza as informações de um remedio existente
  def update
    if @remedio.update(remedio_params)
      redirect_to @remedio, notice: 'Remédio atualizado com sucesso!'
    else
      render :edit
    end
  end

  # Exclui um remedio
  def destroy
    @remedio = Remedio.find(params[:id])
    @remedio.destroy
    redirect_to remedios_path, notice: 'Remédio excluído com sucesso!'
  end
  

  private

  # Configura o Remédio encontrado com base no ID
  def set_remedio
    @remedio = Remedio.find(params[:id])
  end

  # Permite os parâmetros do remedio
  private

  def remedio_params
    params.require(:remedio).permit(:Remediocol, :fabricante, :tipo, :preco, :imagem)  # Permitir todos os campos
  end
end
