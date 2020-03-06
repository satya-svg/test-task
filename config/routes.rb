Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  root "home#index"
  post "/tweets" => "home#tweets",  as: :tweets

  	namespace :api, :defaults => {:format => :json} do
	  namespace :v1 do
	    resources :tweet_follow do
	      collection do
	      	get :follow
	      	get :unfollow
	      end
	    end
	  end
   	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
