Rails.application.routes.draw do
  get '/', controller: 'bid_summary', action: :index

  resources :products
  resources :bidders
  resources :bids

end
