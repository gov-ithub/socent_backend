Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope protocol: 'https',
      defaults: {format: :json} do
    namespace :api do
      namespace :v1 do
        resources :districts, only: [:index, :show]
        resources :caens, only: [:index, :show]
        resources :enterprise_categories, only: [:index, :show]
      end
    end
  end

end
