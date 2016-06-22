Rails.application.routes.draw do
  root "categories#index"
  resources :categories
    # resources :snippets, only: [:show, :edit, :update, :destroy] do
    #   post :create, on: :collection
    # end
  resources :snippets
end
