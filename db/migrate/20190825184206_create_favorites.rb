class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :title
      t.references :favorite_post, polymorphic: true, index: true
    end
  end
end
