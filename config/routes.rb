Rails.application.routes.draw do
  # get spread data from shrimpy
  get "spreads" => "spreads#shrimpy_all"

  # get market data from coingecko
  get "prices/market_chart" => "prices#market_chart"
  get "prices/current_price" => "prices#current_price"
end
