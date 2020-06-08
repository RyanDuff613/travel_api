class AddReviewsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :user_name
      t.string :content
      t.string :country
      t.string :city
      t.integer :rating

      t.timestamps()
    end
  end
end