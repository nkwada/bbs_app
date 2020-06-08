class TopicsController < ApplicationController
	def top
	end

	def index
		@topics = Topic.all
		@newTopic = Topic.new
	end

	def create
	  @topic = Topic.new(params[:topic].permit(:title))
	  @topic.save
	  redirect_to index_path
	end

	def show
	  @topic = Topic.find(params[:id])
	end

	def delete
	  @topic = Topic.find(params[:id])
	  @topic.destroy
	  redirect_to index_path
	end
end
