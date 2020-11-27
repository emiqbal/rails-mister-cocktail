class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :detail
      t.references :cocktail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
