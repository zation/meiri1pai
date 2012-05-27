class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :user_id
      t.text :url
      t.integer :weibo_id

      t.timestamps
    end
  end
end
