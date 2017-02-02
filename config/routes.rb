Rails.application.routes.draw do
  root 'home#index'

  get 'pipefy-fetch-data', to: 'pipefy_api#fetch_data', as: 'pipefy_fetch_data'
end
