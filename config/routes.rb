Rails.application.routes.draw do
  root "categories#index"
  resources :categories
    # resources :snippets, only: [:show, :edit, :update, :destroy] do
    #   post :create, on: :collection
    # end
  resources :users
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  resources :snippets
end
