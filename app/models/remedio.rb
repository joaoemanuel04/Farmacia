class Remedio < ApplicationRecord
  self.primary_key = 'idRemedio'
  validates :Remediocol, presence: true
  validates :fabricante, presence: true
  validates :tipo, presence: true
  validates :preco, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true
  mount_uploader :imagem, ImagemUploader
end

