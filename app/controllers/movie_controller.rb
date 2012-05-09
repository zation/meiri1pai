require 'weibo_service'

class MovieController < ApplicationController
	def show
		access_token = SystemConfig.find_by_name 'access_token'
		@items = WeiboService.mentions(access_token.value)
	end
end


