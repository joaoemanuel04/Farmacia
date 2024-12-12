# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "controllers/hello_controller", to: "controllers/hello_controller.js"
pin "controllers/index", to: "controllers/index.js"
pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
pin "bootstrap-icons", to: "https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"



