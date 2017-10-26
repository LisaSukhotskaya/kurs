Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :shoes
  resources :t_shirts
  resources :jackets
  resources :blouses
  resources :headdresses
  resources :jumpers
  resources :jeans
  resources :dresses
  resources :shirts
  resources :skirts
  resources :sport_suits
  resources :pants
  resources :orders
  resources :clothes, only: %i[show]
  root 'home#start_page'
  get 'add_clothes', to: 'clothes#add_clothes', as: :add_clothes
  get 'about', to: 'home#about', as: :about
  get 'men_jackets_index', to: 'jackets#men_index', as: :men_jackets_index
  get 'women_jackets_index', to: 'jackets#women_index', as: :women_jackets_index
  get 'women_blouses_index', to: 'blouses#women_index', as: :women_blouses_index
  get 'women_dresses_index', to: 'dresses#women_index', as: :women_dresses_index
  get 'men_headdresses_index', to: 'headdresses#men_index',
                               as: :men_headdresses_index
  get 'women_headdresses_index', to: 'headdresses#women_index',
                                 as: :women_headdresses_index
  get 'men_jeans_index', to: 'jeans#men_index', as: :men_jeans_index
  get 'women_jeans_index', to: 'jeans#women_index', as: :women_jeans_index
  get 'men_shirts_index', to: 'shirts#men_index', as: :men_shirts_index
  get 'women_shirts_index', to: 'shirts#women_index', as: :women_shirts_index
  get 'men_jumpers_index', to: 'jumpers#men_index', as: :men_jumpers_index
  get 'women_jumpers_index', to: 'jumpers#women_index', as: :women_jumpers_index
  get 'men_pants_index', to: 'pants#men_index', as: :men_pants_index
  get 'women_pants_index', to: 'pants#women_index', as: :women_pants_index
  get 'men_shoes_index', to: 'shoes#men_index', as: :men_shoes_index
  get 'women_shoes_index', to: 'shoes#women_index', as: :women_shoes_index
  get 'men_t_shirts_index', to: 't_shirts#men_index', as: :men_t_shirts_index
  get 'women_t_shirts_index', to: 't_shirts#women_index', as: :women_t_shirts_index
  get 'men_sport_suits_index', to: 'sport_suits#men_index', as: :men_sport_suits_index
  get 'women_sport_suits_index', to: 'sport_suits#women_index', as: :women_sport_suits_index
  get 'women_skirts_index', to: 'skirts#women_index', as: :women_skirts_index
  get 'men_category', to: 'home#men_category', as: :men_category
  get 'women_category', to: 'home#women_category', as: :women_category
  get 'add_to_basket', to: 'clothes#add_to_basket', as: :add_to_basket
  get 'delete_from_basket', to: 'clothes#delete_from_basket', as: :delete_from_basket
  get 'basket', to: 'clothes#basket', as: :basket
  get 'new_clothes', to: 'clothes#new_clothes', as: :new_clothes
end
