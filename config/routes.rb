Rails.application.routes.draw do

  resources :flats do
    collection do
      post 'ask_openai'
    end
  end
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
