class MovieController < ApplicationController
	include HTTParty
	require 'json'

	def show
		access_token = SystemConfig.find_by_name 'access_token'
		response = self.class.get 'https://api.weibo.com/2/statuses/mentions.json?access_token=' + access_token.value
		@items = JSON.parse(response.body)['statuses']
	end
end
