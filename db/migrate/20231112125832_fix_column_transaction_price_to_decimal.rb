class FixColumnTransactionPriceToDecimal < ActiveRecord::Migration[7.1]
  def change
    change_column :transactions, :price, :decimal, using: 'price::decimal'
  end
end
