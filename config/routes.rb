Rails.application.routes.draw do
  root to: "home#index"

  scope "api" do

    scope "v1" do
      resources :characters
    end
  end
end
