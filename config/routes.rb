Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  namespace :api, defaults: { formats: :json } do
    namespace :v1 do
      get 'tokenizer', to: 'generator#tokenizer', as: 'generator_tokenizer'
      get 'parser', to: 'generator#parser', as: 'generator_parser'
      get 'generator', to: 'generator#generator', as: 'generator_generator'
    end
  end
end
