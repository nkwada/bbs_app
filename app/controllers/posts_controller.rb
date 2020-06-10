class PostsController < ApplicationController
	def create
		@topic = Topic.find(params[:topic_id])
		@post = Post.new(params_post)
		@post.topic = @topic

		if @post.save
			redirect_to topic_url(@topic)
		else
			render "topics/show"
		end
	end


	private

	def params_post
		params.require(:post).permit(:name, :body)
	end
end
