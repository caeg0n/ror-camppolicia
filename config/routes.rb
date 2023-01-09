Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #resources :central_devices
  #resources :central_devices
  #resources :citizen_devices
  get "is_registered/:citizen_device", to: "citizen_devices#is_registered?"
  get "is_central_registered/:central_device", to: "central_devices#is_registered?"
  post "register_device", to: "central_devices#register_device"
  post "update_token", to: "notifications#update_token"
  post "send_emergency_message", to: "notifications#send_emergency_message"
end
