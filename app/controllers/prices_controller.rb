class PricesController < ApplicationController
  def market_chart
    # hard coded currency for now
    response = Faraday.get("https://api.coingecko.com/api/v3/coins/bitcoin/market_chart?vs_currency=usd&days=7&interval=hourly")
    if response.success?
      render json: JSON.parse(response.body), status: response.status
    else
      render json: { errors: JSON.parse(response.body) }, status: response.status
    end
  end

  def current_price
    # hard coded currency for now
    response = Faraday.get("https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd&include_24hr_change=true")
    if response.success?
      render json: JSON.parse(response.body), status: response.status
    else
      render json: { errors: JSON.parse(response.body) }, status: response.status
    end
  end
end
