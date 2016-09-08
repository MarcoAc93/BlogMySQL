class PostsController < ApplicationController
#before_action :authenticate_user!, except: [:index, :show]

	def index
		@posts = Post.all.order('created_at DESC')
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def show
		find_post
	end


	def edit
		find_post
	end

	def update
		find_post
		if @post.update(post_params)
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end

	def destroy
		find_post
		@post.delete
		redirect_to root_path
	end




	private
		def post_params
			params.require(:post).permit(:titulo,:estracto,:contenido)
		end

		def find_post
			@post = Post.find(params[:id])
		end

end
