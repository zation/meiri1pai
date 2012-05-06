require 'weibo_service'

class WeiboController < ApplicationController
	def index
		code = params['code']
		if code
			access_token_value = WeiboService.access_token(code)
			
			access_token = SystemConfig.find_by_name 'access_token'
			access_token.value = access_token_value
			access_token.save
		end
	end
end