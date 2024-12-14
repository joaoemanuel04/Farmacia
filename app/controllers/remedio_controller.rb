class RemediosController < ApplicationController
  before_action :set_remedio, only: %i[show edit update destroy]

  # GET /remedios
  def index
    @remedios = Remedio.all
  end

  # GET /remedios/new
  def new
    @remedio = Remedio.new
  end

  # POST /remedios
  def create
    @remedio = Remedio.new(remedio_params)
    if @remedio.save
      redirect_to remedios_path, notice: 'Remédio criado com sucesso.'
    else
      render :new
    end
  end

  # GET /remedios/:id/edit
  def edit
  end

  # PATCH/PUT /remedios/:id
  def update
    if @remedio.update(remedio_params)
      redirect_to remedios_path, notice: 'Remédio atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /remedios/:id
  def destroy
    @remedio.destroy
    redirect_to remedios_path, notice: 'Remédio excluído com sucesso.'
  end

  private

  # Define the parameters for remédios
  def remedio_params
    params.require(:remedio).permit(:Remediocol, :fabricante, :tipo, :preco)
  end

  # Set remedio for edit, update, destroy actions
  def set_remedio
    @remedio = Remedio.find(params[:id])
  end
end
