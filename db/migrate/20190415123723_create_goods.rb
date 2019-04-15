class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.string :name
      t.string :category
      t.string :source
      t.string :destination
      t.string :consignment
      t.datetime :entry_at
      t.datetime :exit_at

      t.timestamps
    end
  end
end
