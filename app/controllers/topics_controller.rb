class TopicsController < ApplicationController
	before_action :authenticate_user!, except: %i[index show]

	def index
		@q = Topic.includes([:topic_categories], [:categories]).ransack(params[:q])
  		@topics = @q.result(distinct: true).reverse_order
	end

	def show
     	@topic = Topic.includes(:posts).find(params[:id])
		@post = Post.new
	end

	def new
		@topic = Topic.new
		@topic.posts.build
	end

	def create
		@topic = Topic.new(params_topic)
		@topic.user_id = current_user.id
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
		params.require(:topic).permit(:title, :name, :user_id, category_ids: [], posts_attributes:[:id, :name, :body, :topic_id])
	end
 
end
