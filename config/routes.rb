Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    resources :users
    resources :courses
    get '/favs/:id', to: 'users#fav'
    post 'user_token' => 'user_token#create'
  end
end


