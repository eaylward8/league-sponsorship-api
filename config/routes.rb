Rails.application.routes.draw do
  resources :leagues, only: %i[index create] do
    get 'find', on: :collection
  end
end
