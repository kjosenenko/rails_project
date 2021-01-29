class CreateBids < ActiveRecord::Migration[6.1]
  def change
    create_table :bids do |t|
      t.string :message
      t.integer :amount
      t.belongs_to :listing, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
