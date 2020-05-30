class AddDisplaysymbolToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :display_symbol, :string
  end
end
