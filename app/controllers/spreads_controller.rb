class SpreadsController < ApplicationController
  def shrimpy_all
    query_params = { exchange: "all", limit: "1", baseSymbol: "BTC", quoteSymbol: "USD" }
    response = Faraday.get("https://dev-api.shrimpy.io/v1/orderbooks", query_params, "DEV-SHRIMPY-API-KEY": Rails.application.credentials.shrimpy[:api_key])
    if response.success?
      # I want to map through my response and return only exchanges that have order books
      boo = JSON.parse(response.body)
      boo[0]["orderBooks"].reject! { |book| book["orderBook"] == nil }
      render json: boo
    else
      render json: { errors: JSON.parse(response.body) }, status: response.status
    end
  end
end
