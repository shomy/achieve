Rails.application.routes.draw do



  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root'top#index'



  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
}


resources :users, only: [:index,:show]


resources :blogs do
  resources :comments
  post :confirm, on: :collection
end

  resources :ques, only: [:new,:create] do
    collection do
      post :confirm
    end
  end

  resources :poems, only: [:index, :show]

  resources :relationships, only: [:create, :destroy]


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end