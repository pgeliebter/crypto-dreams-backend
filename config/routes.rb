Rails.application.routes.draw do
  get "spreads/:base" => "spreads#shrimpy_all"
end
