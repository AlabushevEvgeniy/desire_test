class CreateReadPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :read_posts do |t|
      t.string :title
      t.references :read_item, polymorphic: true, index: true
    end
  end
end
