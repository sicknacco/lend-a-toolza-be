Rails.application.routes.draw do
  get "/api/v1/stores/:location/:radius", to: "api/v1/stores#index"
end
