class CreateNewsItems < ActiveRecord::Migration[5.2]
  def change
    create_table :news_items do |t|
      t.string :title
      t.string :preview
      t.text :text
      t.boolean :published
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
