#encoding: utf-8
require 'net/http'
class CastsController < ApplicationController

	def index

	end

	def catch
		url = params[:url]
		name = params[:name]
		file = File.new(name, "wb")
		while url do
			url = Page.get_page_items(url,file)
		end
		file.close
		flash[:notice] = '结束抓取'
		redirect_to :action=>"index"
	end

end
