class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.string :payer, null: false
      t.string :receiver, null: false
      t.string :price, null: false

      t.timestamps
    end
  end
end
