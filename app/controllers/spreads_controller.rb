class SpreadsController < ApplicationController
  def shrimpy_all
    # setting up my query params for the call
    query_params = { exchange: "all", limit: "1", baseSymbol: params[:base], quoteSymbol: params[:quote] }
    # check if the user has correct master key to unlock api key otherwise not necessary
    if Rails.application.credentials.shrimpy
      key = Rails.application.credentials.shrimpy[:api_key]
    end
    # call the shrimpy api with the query params and the key
    response = Faraday.get("https://dev-api.shrimpy.io/v1/orderbooks", query_params, "DEV-SHRIMPY-API-KEY": key)

    if response.success? # happy path
      # looping through response and return only exchanges that have order books as blanks are included in response
      formatted_response = JSON.parse(response.body)
      formatted_response[0]["orderBooks"].reject! { |book| book["orderBook"].blank? }
      render json: formatted_response
    else # sad path
      # check if rate limit has been exceeded and send prompt to add correct master key to unlock api key
      if response.status == 429
        render json: { message: "Please make sure the master key was added correctly.", errors: JSON.parse(response.body) }, status: response.status
      else
        render json: { errors: JSON.parse(response.body) }, status: response.status
      end
    end
  end
end
