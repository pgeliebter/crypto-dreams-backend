class PricesController < ApplicationController
  # can be refactored in future to run both of these api calls concurrently
  # get the past 7 days of price data for a given coin
  def market_chart
    response = Faraday.get("https://api.coingecko.com/api/v3/coins/bitcoin/market_chart?vs_currency=usd&days=7&interval=hourly")
    if response.success? #happy path
      render json: JSON.parse(response.body), status: response.status
    else # sad path
      render json: { errors: JSON.parse(response.body) }, status: response.status
    end
  end

  # get the current price of a given coin
  def current_price
    # hard coded currency but can be used in future to get data for multiple currencies
    response = Faraday.get("https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd&include_24hr_change=true")
    if response.success? # happy path
      render json: JSON.parse(response.body), status: response.status
    else # sad path
      render json: { errors: JSON.parse(response.body) }, status: response.status
    end
  end
end
