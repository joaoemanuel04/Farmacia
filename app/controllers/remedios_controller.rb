class RemediosController < ApplicationController
  before_action :set_remedio, only: [:show, :edit, :update, :destroy]

  def gerar_pdf
    # Busca os remédios ativos
    @remedios = Remedio.where(status: 'ativo')
  
    # Cria um novo documento PDF
    pdf = Prawn::Document.new
    pdf.text 'Lista de Remédios', size: 20, style: :bold, align: :center
    pdf.move_down 20
  
    # Cria a estrutura de dados para a tabela
    dados = [
      ["Nome", "Fabricante", "Tipo", "Preço"]
    ]
    
    # Adiciona as informações dos remédios à tabela
    @remedios.each do |remedio|
      dados << [
        remedio.Remediocol,        # Nome do remédio
        remedio.fabricante,        # Fabricante
        remedio.tipo,              # Tipo do remédio
        "R$ #{'%.2f' % remedio.preco}"  # Preço formatado
      ]
    end
  
    # Cria a tabela no PDF
    pdf.table(dados, header: true, width: pdf.bounds.width) do |t|
      t.row(0).font_style = :bold     # Deixa o cabeçalho em negrito
      t.row(0).background_color = 'cccccc' # Cor de fundo do cabeçalho
      t.cells.padding = 8             # Padding das células
      t.cells.border_width = 0       # Remove a borda das células
  
      # Cor de fundo alternada para as linhas
      t.rows(1..-1).background_color = 'f0f0f0'  
    end
  
    # Envia o PDF gerado para o navegador
    send_data(pdf.render, filename: "remedios.pdf", type: "application/pdf", disposition: "inline")
  end
  

  # Lista todos os remédios com paginação
  def index
    if params[:search].present?
      @remedios = Remedio.where('Remediocol LIKE ? AND status = ?', "%#{params[:search]}%", 'ativo').page(params[:page]).per(5)
    else
      # Caso contrário, exibe todos os remédios
      @remedios = Remedio.where(status: 'ativo').page(params[:page]).per(5)
    end

    #@remedios = Remedio.where(status: 'ativo').page(params[:page]).per(5)
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
    if @remedio.update(status: 'inativo')
      redirect_to remedios_path, notice: 'Remédio foi marcado como inativo com sucesso.'
    else
      redirect_to remedios_path, alert: 'Não foi possível atualizar o status do remédio.'
    end
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
