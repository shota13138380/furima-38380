class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.references :purchase,      null: false, foreign_key: true
      t.string     :postcode,      null: false
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false
      t.string     :block,         null: false
      t.string     :building
      t.integer    :phone_number,  null: false
      t.timestamps
    end
  end
end