class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.text :body
      t.string :language

      t.timestamps
    end
  end
end
