class ToppagesController < ApplicationController
require 'net/https'
require 'uri'
require 'json'

  def index
        #finnhubアクセストークン
    token = 'br48hbfrh5rcrh1r2a50'
    base_url = "https://finnhub.io/api/v1/stock/candle?symbol=AAPL&resolution=D&from=1510000000&to=1585000000&token=#{token}"

    # GETリクエストを送信する
    uri = URI.parse(base_url)
    
    response = Net::HTTP.get_response(uri)
    #Hash形式にparse    
    result = JSON.parse(response.body)

    i=0
    count = result["t"].length 
    
    @data = Array.new()
    while i < count 
      @data.push([result["t"][i],result["o"][i],result["h"][i],result["l"][i],result["c"][i]])
      i = i + 1
    end 
    @data_json = @data.to_json.html_safe
  end
end
