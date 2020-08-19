Rails.application.routes.draw do
  
  get 'quotes/:search_tag', controller: 'quotes', action: 'show'
  post "login", to: "sessions#create"
  
end