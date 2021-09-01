Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :products #la ruta /api/v1/product
    end
  end
end
