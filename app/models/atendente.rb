class Atendente < ApplicationRecord
  validates :Nome, presence: true
  validates :CPF, presence: true, uniqueness: true
  validates :dt_nasce, presence: true

  has_many :vendas
  belongs_to :user
end
