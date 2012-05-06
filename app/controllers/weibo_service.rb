class WeiboService
	include HTTParty

	base_uri 'https://api.weibo.com/'

	def self.mentions access_token
		get '/statuses/mentions.json', :query => {:access_token => access_token}
	end

	def self.access_token code
		data = 'client_id=1665390066&'
		data += 'client_secret=d1077720768a5f7b8e61c25e03d08e84&'
		data += 'grant_type=authorization_code&'
		data += 'code=' + code + '&'
		data += 'redirect_uri=http%3A%2F%2F127.0.0.1%3A3000%2Fweibo'
		result = post '/oauth2/access_token?' + data
		JSON.parse(result.body)['access_token']
	end
end