Rails.application.routes.draw do
  resource :turbo_stream_demo, only: :show

  resources :posts, only: :create do
    resources :likes, only: :create
  end
end
