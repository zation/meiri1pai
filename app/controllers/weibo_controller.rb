require 'weibo_service'

class WeiboController < ApplicationController
	def index
		@link_address = 'https://api.weibo.com/oauth2/authorize?' +
		'client_id=1665390066' +
		'&response_type=code' +
		'&redirect_uri=' + Meiri1pai::Application.config.callback_context + '%2Fweibo'

		code = params['code']
		if code
			access_token_value = WeiboService.access_token(code)
			
			access_token = SystemConfig.find_by_name 'access_token'
			access_token = SystemConfig.create(:name => 'access_token', :value => '') if access_token.nil?
			access_token.value = access_token_value
			access_token.save
		end
	end
end