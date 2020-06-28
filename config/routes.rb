Rails.application.routes.draw do
  resources :bboxes
  devise_for :users
  resources :bbox_contents do
    member do
      post :pass
    end
  end
  root to: "blackbox#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
