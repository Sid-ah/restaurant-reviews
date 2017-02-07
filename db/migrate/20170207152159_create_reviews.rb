class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :description, null: false
      t.string :rating, null: false
      t.references :restaurant, null: false

      t.timestamps null: false
    end
  end
end
