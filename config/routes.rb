Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope protocol: 'https' do
    namespace :api do
      namespace :v1 do
        
      end
    end
  end

end
