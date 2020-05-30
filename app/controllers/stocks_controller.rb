class StocksController < ApplicationController
require 'net/https'
require 'uri'
require 'json'
require 'time'

  def index
    @stocks = Stock.all
  end

  def show
    @stock = Stock.find(params[:id])
    symbol = @stock.symbol
    #finnhubアクセストークン
    token = 'br48hbfrh5rcrh1r2a50'
    t = Time.current
    end_time = t.to_i
    base_url = "https://finnhub.io/api/v1/stock/candle?symbol=#{symbol}&resolution=D&from=1510000000&to=#{end_time}&token=#{token}"
    # GETリクエストを送信する
    uri = URI.parse(base_url)
    response = Net::HTTP.get_response(uri)
    #Hash形式にparse    
    @result = JSON.parse(response.body)
      unless @result["s"] == "no_data"
        i=0
        count = @result["t"].length 
        @data = Array.new()
        while i < count 
          @data.push([@result["t"][i],@result["o"][i],@result["h"][i],@result["l"][i],@result["c"][i]])
          i = i + 1
        end 
        @data_json = @data.to_json.html_safe
      end
  end

  def create
  end

  
end
