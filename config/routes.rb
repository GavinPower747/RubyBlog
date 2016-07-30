Rails.application.routes.draw do
  resources :blog_posts, :path => "blogposts" #sets up the blog posts routes and states that requests to the blog posts controller should be to blogposts rather than the default blog_posts
  
  get 'home/index' 
  get ":title/p/:id" => "blog_posts#show", :id => /[0-9]+/ #Routes requests with title/p/id to the show method on the blog posts controller
  
  root :to => "home#index" #Sets default route to home/index
end
