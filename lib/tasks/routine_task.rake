namespace :routine_task do
  desc "update_company_list"
  task :search_list_update => :environment do
    require 'net/https'
    require 'uri'
    require 'json'

      #finnhubアクセストークン
      token = 'br48hbfrh5rcrh1r2a50'
      base_url = "https://finnhub.io/api/v1/stock/symbol?exchange=US&token=#{token}"
  
      # GETリクエストを送信する
      uri = URI.parse(base_url)
      
      response = Net::HTTP.get_response(uri)
      #parse    
      result = JSON.parse(response.body)
  
      #新規上場株式の登録
      i = 0
      r_count = result.length
      while i < r_count
        stock = Stock.find_by(symbol: result[i]["symbol"])
        if stock == nil
          stock = Stock.new(name: result[i]["description"],display_symbol: result[i]["displaySymbol"],symbol: result[i]["symbol"])
          stock.save
        end
        i = i + 1
      end
      #更新の確認。シンボル一致の場合はレコードの内容にアップデートがないか確認する。全く一致しなかった場合はInfoカラムに上場廃止の旨追記。
      stocks = Stock.all
      stocks.each do |s|
        i = 0
        while i < r_count
          if s.symbol == result[i]["symbol"]
            #社名、表示用シンボルの更新有無を確認し、更新がある場合はupdateする。
            unless s.name == result[i]["description"] 
              s.update(name: result[i]["description"]) 
            end
            unless s.display_symbol == result[i]["displaySymbol"] 
              s.update(display_symbol: result[i]["displaySymbol"]) 
            end
            break #次のレコード確認
          end
          i = i + 1
        end
        #すべて株価シンボルと一致しなかった場合は上場廃止と判断してinfoカラムをupdateする。
        if i == r_count && s.info == nil
          s.update(info: "Delisted")
        end
      end
  end
end
