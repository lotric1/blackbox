Rails.application.routes.draw do
  resources :bbox_contents
  root to: "blackbox#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
