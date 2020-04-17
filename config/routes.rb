Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
      #get "empresas" => "empresas#index"
      #get "empresas/:id" => "empresas#show"
      resources :empresas
    end
  end
end