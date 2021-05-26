Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      root 'static_pages#home'
      resources :posts
    end
  end
end
