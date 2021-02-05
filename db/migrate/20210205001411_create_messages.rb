class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.belongs_to :conversation, null: false, foreign_key: true
      t.string :message
      t.string :sender
      t.timestamps
    end
  end
end
