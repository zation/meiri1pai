require File.join(File.expand_path(File.dirname(__FILE__)), '..', '..', 'app', 'services', 'weibo_service.rb')

namespace :db do
	task :update_image => :environment do
		puts 'Start to update image.'
		access_token = SystemConfig.find_by_name 'access_token'
		last_image_weibo_id = Image.maximum('weibo_id')
		last_image_weibo_id = last_image_weibo_id.nil? ? 0 : last_image_weibo_id
		mentions = WeiboService.mentions(access_token.value, last_image_weibo_id)
		mentions.each do |mention|
			Image.create(
				:user_id => mention['user']['id'],
				:url => mention['original_pic'],
				:weibo_id => mention['id'])
		end
		puts 'Updating complete. Total number: ' + mentions.size.to_s
	end
end