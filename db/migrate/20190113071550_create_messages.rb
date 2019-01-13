class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :name
      t.text :body
      t.references :post

      t.timestamps
    end
  end
end
