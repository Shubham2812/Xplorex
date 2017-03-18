Rails.application.routes.draw do

  get '/signup' => 'authentication#signup'
  post '/addUser' => 'authentication#addUser'
  get '/login' => 'authentication#login'
  get '/loginStatus' => 'authentication#loginStatus'

  get '/logout' => 'authentication#logout'
  post '/addFood/confirm' => 'food#addFoodFinal'
  get '/' => 'home#home'
  get '/cancel' => 'home#home'
  get '/timeline' => 'home#timeline'
  get '/services' => 'home#services'
  get '/profile' => 'home#profile'
  get '/profile/edit' => 'home#editProfile'
  post '/profile/edit/confirm' => 'home#editProfileFinal'
  get '/edit/cancel' => 'home#profile'
  get '/myBookings' => 'home#myBookings'
  get '/notifications' => 'home#notifications'

  get '/food' => 'food#food'
  get '/addFood' => 'food#addFood'
  get '/serviceMenu' => 'home#serviceMenu'
  get '/foodoutlet' => 'home#foodoutlet'
  get '/editfood' => 'food#editFood'
  get '/food/cancel' => 'food#food'
  post '/food/edit/confirm' => 'food#editfood'
  get '/food/delete' => 'food#delete'
  get '/food/offers' => 'food#offers'
  get '/food/addOffer' => 'food#addOffer'
  get '/food/offers/edit' => 'food#editOffer'
  get '/food/ofers/delete' => 'food#deleteOffer'
  get '/food/editOfferFinal' => 'food#editOfferFinal'
  get '/food/review/notVisited' => 'food#notVisited'
  get '/food/review/visited' => 'food#visited'
  get '/food/review/add' => 'food#addReview'
  get '/food/addReview/confirm' => 'food#confirmReview'
  get '/food/review/delete' => 'food#deleteReview' 
  get '/food/review/edit' => 'food#editReview'
  get '/food/editReview/confirm' => 'food#confirmEditReview'
  get '/food/booking/:outletID' => 'food#booking'
  get '/food/addbooking/confirm/:outletID' => 'food#addBooking'
  get '/food/booking/confirm/:bookingID' => 'food#confirmBooking'
  get '/food/booking/reject/:bookingID' => 'food#rejectBooking'
  get '/food/booking/cancel/:bookingID' => 'food#cancelBooking'


  get '/education' => 'education#education'
  get '/travel' => 'travel#travel'
  get '/entertainment' => 'entertainment#entertainment'
  get '/health' => 'health#health'
  get '/others' => 'health#health'

  get '/redirect/food/:outletID' => 'food#food' 


  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
