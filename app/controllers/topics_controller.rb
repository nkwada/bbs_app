class TopicsController < ApplicationController

	def index
		@topics = Topic.all
	end

	def show
     	@topic = Topic.includes(:posts).find(params[:id])
		@post = Post.new
	end

	def new
		@topic = Topic.new
	end

	def create
		@topic = Topic.new(params_topic)
		if @topic.save
			redirect_to topic_url(@topic)
		else
			render "new"
		end
	end

	def edit
		@topic = Topic.find(params[:id])
	end

	def update
		@topic = Topic.find(params[:id])
		if @topic.update_attributes(params_topic)      
			redirect_to topic_url(@topic)
		else
			render "edit"
		end
	end

	def destroy
		@topic = Topic.find(params[:id])
		@topic.destroy
		redirect_to topics_url
	end
 

	private

	def params_topic
		params.require(:topic).permit(:title, :name, category_ids: [])
	end
 
end
