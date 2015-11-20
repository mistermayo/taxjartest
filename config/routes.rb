Rails.application.routes.draw do
  root 'weather#index'
  get "map", to: 'weather#map'
end
