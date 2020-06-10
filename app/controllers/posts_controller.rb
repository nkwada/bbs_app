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

	def destroy
		@topic = Topic.find(params[:topic_id])
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to topic_url(@topic)
	end

	private

	def params_post
		params.require(:post).permit(:name, :body)
	end
end
