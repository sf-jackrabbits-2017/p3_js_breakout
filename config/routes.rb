Rails.application.routes.draw do
  get '/locations/:name' => "locations#location_by_name"
  root "locations#index"
end
