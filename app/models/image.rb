class Image < ActiveRecord::Base
  attr_accessible :url, :user_id, :weibo_id
end
