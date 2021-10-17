class SpreadsController < ApplicationController
  def shrimpy_all
    query_params = { exchange: "all", limit: "1", baseSymbol: "BTC", quoteSymbol: "USD" }
    response = Faraday.get("https://dev-api.shrimpy.io/v1/orderbooks", query_params, "DEV-SHRIMPY-API-KEY": Rails.application.credentials.shrimpy[:api_key])
    if response.success?
      render json: JSON.parse(response.body, symbolize_names: true)
    else
      render json: { errors: JSON.parse(response.body) }, status: response.status
    end
  end
end
