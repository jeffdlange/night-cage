# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "jquery" # @3.6.0
pin "bootstrap", to: 'bootstrap.min.js', preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

# unused
# pin "@rails/actioncable", to: "@rails--actioncable.js" # @6.0.5
# pin "trix"
# pin "@rails/actiontext", to: "@rails--actiontext.js" # @6.0.5
# pin "@rails/activestorage", to: "@rails--activestorage.js" # @6.0.5
