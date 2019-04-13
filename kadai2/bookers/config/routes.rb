Rails.application.routes.draw do
	root :to => 'impressions#top'
  resources :impressions
end
