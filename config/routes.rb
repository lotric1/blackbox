Rails.application.routes.draw do
  resources :bboxes do
    member do
      post :flip_starred
    end
  end
  devise_for :users
  resources :bbox_contents do
    member do
      post :pass
      post :flip_pinned
      post :flip_completed
    end
  end
  root to: "blackbox#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
