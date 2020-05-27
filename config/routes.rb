Rails.application.routes.draw do
	require 'sidekiq/web'

	mount Sidekiq::Web => "/sidekiq"

	get 'event/index'

	resources :interviews

	root 'event#index'

	get '/404' , to: 'errors#not_found'
	get '/422' , to: 'errors#unacceptable'
	get '/500' , to: 'errors#server_errors'

end
