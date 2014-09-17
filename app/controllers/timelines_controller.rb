class TimelinesController < ApplicationController
	def index
	  #@activities = PublicActivity::Activity.all
	  per_page_count = 3
	  @activities = PublicActivity::Activity.paginate(:page => params[:page], :per_page => per_page_count)
	  @total_pages = @activities.total_pages
	  @current_page = params[:page].nil? ? 0 : Integer(params[:page])
	end
end
