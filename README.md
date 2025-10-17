# BioFarma - Sistema de Gerenciamento de Farmácia

## 💊 Descrição

O **BioFarma** é um sistema de gestão para farmácias desenvolvido em Ruby on Rails. Ele permite o gerenciamento completo de remédios, atendentes e vendas, oferecendo uma solução robusta para o controle de operações farmacêuticas.

O sistema conta com funcionalidades essenciais como cadastro de produtos, autenticação de usuários e geração de relatórios em formatos PDF e CSV.

## ✨ Funcionalidades Principais

-   **Gerenciamento de Remédios:**
    -   CRUD (Criação, Leitura, Atualização e Deleção) de remédios.
    -   Upload de imagens para cada produto.
    -   Geração de um relatório em PDF com a lista completa de remédios.

-   **Gerenciamento de Atendentes:**
    -   CRUD completo para os registros dos atendentes.

-   **Gerenciamento de Vendas:**
    -   Registro de novas vendas, associando remédios e atendentes.
    -   Listagem e consulta do histórico de vendas.
    -   Exportação dos dados de vendas para arquivos CSV.

-   **Autenticação de Usuários:**
    -   Sistema seguro de login e cadastro de usuários utilizando a gem **Devise**.

-   **Carrinho de Compras:**
    -   Funcionalidade para adicionar múltiplos remédios a um carrinho antes de finalizar a compra.

## 🛠️ Tecnologias Utilizadas

-   **Backend:** Ruby on Rails
-   **Frontend:** HTML, CSS, JavaScript, Bootstrap
-   **Banco de Dados:** MySQL
-   **Autenticação:** Devise
-   **Upload de Arquivos:** CarrierWave
-   **Geração de PDF:** Prawn
-   **Paginação:** Kaminari
-   **Servidor Web:** Puma
