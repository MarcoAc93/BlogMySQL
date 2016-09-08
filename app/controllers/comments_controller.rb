class CommentsController < ApplicationController
	def create
		find_post
		@comment = @post.comments.build(comments_params)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to post_path(@post)
		else
			render 'comments/form'
		end
	end



	private
		def comments_params
			params.require(:comment).permit(:comentario)
		end

		def find_post
			@post = Post.find(params[:post_id])
		end
end
