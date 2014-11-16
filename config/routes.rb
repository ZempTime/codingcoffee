Rails.application.routes.draw do
  devise_for :users

  resources :venues, except: [:create] do 
    resources :reviews
  end

  resources :venues, only: [:create] do
    resources :venue_parts, only: [:edit, :update]
  end

  root to: "venues#main"

end
