Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :leagues, only: %i[index create] do
        get 'find', on: :collection
      end
    end
  end
end
