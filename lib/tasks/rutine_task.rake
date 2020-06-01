namespace :rutine_task do
  desc "実行処理の説明"
  task :sample do
    # require 'net/https'
    # require 'uri'
    # require 'json'

    puts "Hello World"
    
    # def self.testcode
    #   logger.debug("true")
    # end
    # def self.search_list_update
    #   #finnhubアクセストークン
    #   token = 'br48hbfrh5rcrh1r2a50'
    #   base_url = "https://finnhub.io/api/v1/stock/symbol?exchange=US&token=#{token}"
  
    #   # GETリクエストを送信する
    #   uri = URI.parse(base_url)
      
    #   response = Net::HTTP.get_response(uri)
    #   #parse    
    #   result = JSON.parse(response.body)
  
    #   #新規上場株式の登録
    #   i = 0
    #   r_count = result.length
    #   while i < r_count
    #     stock = Stock.find_by(symbol: result[i]["symbol"])
    #     if stock == nil
    #       stock = Stock.new(name: result[i]["description"],display_symbol: result[i]["displaySymbol"],symbol: result[i]["symbol"])
    #       stock.save
    #     end
    #     i = i + 1
    #   end
    #   #更新の確認。シンボル一致の場合はレコードの内容にアップデートがないか確認する。全く一致しなかった場合はInfoカラムに上場廃止の旨追記。
    #   t = 1
    #   s_count = Stock.count
    #   while t <= s_count
    #     stock = Stock.find(id: t)
    #     i = 0
    #     while i < r_count 
    #       if stock.symbol == result[i]["symbol"]
    #         #社名、表示用シンボルの更新有無を確認し、更新がある場合はupdateする。
    #         unless stock.name == result[i]["description"] 
    #           stock.update(name: result[i]["description"]) 
    #         end
    #         unless stock.display_symbol == result[i]["displaySymbol"] 
    #           stock.update(display_symbol: result[i]["displaySymbol"]) 
    #         end
    #         break #次のレコード確認
    #       end
    #     end
    #     #すべて株価シンボルと一致しなかった場合は上場廃止と判断してinfoカラムをupdateする。
    #     if stock.info == nil
    #       stock.update(info: "Delisted")
    #     end
    #   end
    # end
  end    
end
