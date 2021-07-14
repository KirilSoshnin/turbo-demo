Rails.application.routes.draw do
  resource :turbo_stream_demo, only: :show

  resources :posts, only: [:create, :index] do
    resources :likes, only: :create
  end
end
