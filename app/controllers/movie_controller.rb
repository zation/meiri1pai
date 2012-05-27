require 'weibo_service'

class MovieController < ApplicationController
	def show
		@images = Image.where(:user_id => params['user_id']).order('weibo_id DESC')
	end
end


