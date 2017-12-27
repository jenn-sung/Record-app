Rails.application.routes.draw do

  namespace :v1 do

    get '/records' => 'records#index'
    get '/records/:id' => 'records#show'
    post '/records' => 'records#create'
    patch '/records/:id' => 'records#update'
  end
end
