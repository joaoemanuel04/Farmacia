# frozen_string_literal: true

Kaminari.configure do |config|
  config.default_per_page = 10  # Itens por página
  config.max_per_page = 100     # Máximo de itens por página
  config.window = 4             # Número de páginas ao redor da página atual
  config.outer_window = 0       # Número de páginas no início e no final
  config.left = 0               # Páginas à esquerda da página atual
  config.right = 0              # Páginas à direita da página atual
end
