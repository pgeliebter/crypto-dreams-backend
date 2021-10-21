class SpreadsController < ApplicationController
  def shrimpy_all
    query_params = { exchange: "all", limit: "1", baseSymbol: params[:base], quoteSymbol: params[:quote] }
    if Rails.application.credentials.shrimpy[:api_key]
      key = Rails.application.credentials.shrimpy[:api_key]
    end
    response = Faraday.get("https://dev-api.shrimpy.io/v1/orderbooks", query_params, "DEV-SHRIMPY-API-KEY": key)
    if response.success?
      # I want to map through my response and return only exchanges that have order books
      formatted_response = JSON.parse(response.body)
      formatted_response[0]["orderBooks"].reject! { |book| book["orderBook"].blank? }
      render json: formatted_response
    else
      render json: { errors: JSON.parse(response.body) }, status: response.status
    end
  end

  # end point to get all supported currency for all exchanges
  # def get_exchange_assets
  #   response = Faraday.get("https://dev-api.shrimpy.io/v1/exchanges/#{params[:exchange]}/assets", {}, "DEV-SHRIMPY-API-KEY": Rails.application.credentials.shrimpy[:api_key])
  #   if response.success?
  #     formatted_response = JSON.parse(response.body)
  #     render json: formatted_response
  #   else
  #     render json: { errors: JSON.parse(response.body) }, status: response.status
  #   end
  # end
end
