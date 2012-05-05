class WeiboController < ApplicationController
	include HTTParty
	require 'json'

	def index
		code = params['code']
		if code
			data = 'client_id=1665390066&'
			data += 'client_secret=d1077720768a5f7b8e61c25e03d08e84&'
			data += 'grant_type=authorization_code&'
			data += 'code=' + code + '&'
			data += 'redirect_uri=http%3A%2F%2F127.0.0.1%3A3000%2Fweibo'
			response = JSON.parse self.class.post 'https://api.weibo.com/oauth2/access_token?' + data
			
			access_token = SystemConfig.find_by_name 'access_token'
			access_token.value = response['access_token']
			p response[:access_token]
			access_token.save
		end
	end
end