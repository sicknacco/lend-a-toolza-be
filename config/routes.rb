Rails.application.routes.draw do
  resources :tools
  get "/api/v1/stores/:location/:radius", to: "api/v1/stores#index"
  get "/api/v1/chat_request", to: "api/v1/chats#show"
end
