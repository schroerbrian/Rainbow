Rainbow::Application.routes.draw do
  
  resources :plu_codes
  root :to => "plu_codes#index"

end
