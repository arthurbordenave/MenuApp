Rails.application.routes.draw do
  resources :items do
      collection do
        patch :sort
      end
  end

  root "items#index"
end
