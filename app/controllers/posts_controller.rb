class PostsController < ApplicationController
  # before_action :move_to_index, except: :index

  def index
    @posts = Post.includes(:user).page(params[:page]).per(6).order("created_at DESC")
    # page(params[:page]).per(7)
  end

  def new
  end

  def create
    Post.create(title: post_params[:title], text: post_params[:text], image: post_params[:image], user_id: current_user.id)
  end

  # , user_id: current_user.id

  # def edit
  #   @post = Post.find(params[:id])
  # end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id == current_user.id
    
  end

  def show
    @post = Post.find(params[:id])

  end

  def edit
    @post = Post.find_by(id: params[:id])
  end
  def update
    @post = Post.find_by(id: params[:id])
    @post.update(title: params[:title], text: params[:text])
    redirect_to("/")
  end


  # def update
  #   @post = Post.find(params[:id])
  #   if @post.update(post_params)
  #   redirect_to root_path
  #   else
  #   render 'edit'
  #   end
        
  # end

  private
  def post_params
    params.permit(:title, :text, :image)
  end

  def move_to_index
    redirect_to action: :index 
  end

end
