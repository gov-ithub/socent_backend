Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope protocol: 'https',
      defaults: {format: :json} do
    namespace :api do
      namespace :v1 do
        post 'login', to: 'login#create'
        resources :districts, only: [:index, :show]
        resources :addresses, only: [:show, :create, :update, :destroy]
        resources :industry_classifications,
            only: [:index, :show],
            path: 'industry-classifications'
        resources :enterprise_categories,
            only: [:index, :show],
            path: 'enterprise-categories'
        resources :social_intervention_domain_categories,
            only: [:index, :show],
            path: 'social-intervention-domain-categories'
        resources :social_intervention_domains,
            only: [:index, :show],
            path: 'social-intervention-domains'
        resources :vulnerable_groups,
            only: [:index, :show],
            path: 'vulnerable-groups'

        resources :entrepreneurs, only: [:index, :show, :create, :update, :destroy]

        resources :enterprises, only: [:index, :show, :create, :destroy, :update]
      end
    end
  end

end
