Rails.application.routes.draw do
  devise_for :users
  root to: "allposts#index"  
  
  
  resources :wnews_posts do
    member do
      put "like" => "wnews_posts#upvote"
      put "dislike" => "wnews_posts#downvote"
    end
  end  
  

  resources :sport_posts do
   member do
      put "like" => "sport_posts#upvote"
      put "dislike" => "sport_posts#downvote"
    end
  end 
  
  resources :pol_posts do
     member do
      put "like" => "pol_posts#upvote"
      put "dislike" => "pol_posts#downvote"
    end
  end 
    

  resources :tech_posts do
    member do
      put "like" => "tech_posts#upvote"
      put "dislike" => "tech_posts#downvote"
    end
  end
    
      
 
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
