Rails.application.routes.draw do
  get "spreads" => "spreads#shrimpy_all"
  # end point to get all supported currency for all exchanges
  # get "exchanges/assets" => "spreads#get_exchange_assets"

  get "prices/market_chart" => "prices#market_chart"
  get "prices/current_price" => "prices#current_price"
end
