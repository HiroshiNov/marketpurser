# README

Finhub.ioのAPIで取得できる米国の金融商品の価格を表示するシステムです。Ruby on Railsを使っています。
なお、ユーザ登録機能を便宜上設けていますが、こちらに登録するユーザ名、メールアドレスは何の用途にも使われず、認証機能もありませんので、別に適当な文字列でログインしていただいても問題ありません。
また、このデモサイトの登録メールアドレスは予告なく削除する可能性がありますので、ご了承ください。

デモサイトはこちらです。
https://marketpurser.herokuapp.com/

後述しますが、上記の実装環境であるHerokuのデータベースの制限により、NASDAQのグローバルセレクトマーケットの銘柄のみ閲覧ができます。
データベースは開発環境でMySQL、実行環境でPostgreを使っています。

# USAGE
1.Finhub.ioでご自身のAPIアクセストークンを取得してください。
  https://finnhub.io/

2.以下のファイルのAIPトークンを自身のものに置き換えてください。
　(1)/marketpurser/app/controllers/stocks_controller.rb
　(2)/marketpurser/lib/tasks/routine_task.rake

 例えば、あなたのAPIアクセストークンがAAAAAAAAAAAなら、
 token = ENV['FINNHUB'] 
 の部分を
 token = "AAAAAAAAAAA"

 といった感じです。
 コメントでfinhubアクセストークンと記載していますので、そちらを目印にしてください。
 
3.以下のファイルのexchange=US&mic=XNGSの部分については、Finhub.ioのドキュメントに従って変更することで、米国以外の金融商品の価格を取得することも可能です。
　具体的な例を言いますと、USをTに変えると東京証券取引所のデータを取得できるようになります。
  また、mic=の後に続くXNGSは市場コード（mic Code)指定する場合に記載します。特に指定しなければすべてを取得しますので、&mic=XNGS の一文を削除してください。
  これらのURLの記述についてFinhub.ioのドキュメントに従ってください。
  https://finnhub.io/docs/api/stock-symbols
  
4.最後に、bundle install、db:migrationを行ったあと、以下を実行します。これは、stocksというデータベースに株のシンボルや会社名などの情報を登録するための操作です。 
　最初にこの操作をしなかった場合、株式一覧画面に何も表示されません。
 rake routine_task:search_list_update

5.準備は整いました。
　rails s でサーバを起動して、実行してみてください！
 
 以上
