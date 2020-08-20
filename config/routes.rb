Rails.application.routes.draw do
  
  post "login", to: "sessions#create"
  
  api_version( :module => "V1", :path => { :value => "v1"}) do
    get 'quotes/:search_tag', controller: 'quotes', action: 'show'
  end
    
end