class WeiboService
	include HTTParty

	base_uri 'https://api.weibo.com/'
	format :json

	def self.mentions access_token, since_id = 0
		query = {
			:access_token => access_token,
			:filter_by_type => 1,
			:filter_by_source => 0,
			:since_id => since_id
		}
		get('/statuses/mentions.json', :query => query)['statuses']
	end

	def self.access_token code
		data = 'client_id=1665390066&'
		data << 'client_secret=d1077720768a5f7b8e61c25e03d08e84&'
		data << 'grant_type=authorization_code&'
		data << 'code=' + code + '&'
		data << 'redirect_uri=' + Meiri1pai::Application.config.callback_context + '%2Fweibo'
		post('/oauth2/access_token?' + data)['access_token']
	end
end
