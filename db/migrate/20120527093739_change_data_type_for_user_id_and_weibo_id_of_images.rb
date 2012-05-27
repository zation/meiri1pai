class ChangeDataTypeForUserIdAndWeiboIdOfImages < ActiveRecord::Migration
  def up
  	change_table :images do |t|
      t.change :user_id, :text
      t.change :weibo_id, :text
    end
  end

  def down
  	change_table :images do |t|
      t.change :user_id, :text
      t.change :weibo_id, :text
    end
  end
end
