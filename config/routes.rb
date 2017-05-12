Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  	resources :snippets do
  		member do
  			put "like", to: "snippets#upvote"
        put 'dislike', to: 'snippets#dislike'
        put 'unvote', to: 'snippets#unvote'
  		end
      
      resources :comments do
        member do
          put "like", to: "comments#upvote"
          put 'dislike', to: 'comments#dislike'
          put 'unvote', to: 'comments#unvote'
        end
      end
  	end

  	root 'snippets#home'

  	get '/css', to: 'snippets#css'
    get '/javascript', to: 'snippets#javascript'
    get '/ruby', to: 'snippets#ruby'
    get '/python', to: 'snippets#python'
    get '/about', to: 'sections#about'
    get '/playground', to: 'sections#playground'
    get 'users/leaderboard' => 'users#leaderboard'
    get '/users/:id', :to => 'users#show', :as => :user
end
