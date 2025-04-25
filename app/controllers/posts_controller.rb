class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_post, only: [ :edit, :update, :destroy ]

  def index
    if params[:tag_name].present?
      @posts = Post.joins(:tags).where(tags: { name: params[:tag_name] }).includes(:user).order(created_at: :desc)
    else
      @posts = Post.includes(:user).order(created_at: :desc)
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    tag_names = params[:tag_names].to_s.split(",").map(&:strip).uniq

    if @post.save
      @post.save_tags(tag_names)
      redirect_to posts_path, notice: "投稿が作成されました。"
    else
      render :new
    end
  end

  def edit
    @tag_names = @post.tags.map(&:name).join(",")
  end

  def update
    if @post.update(post_params)
      tag_names = params[:tag_names].to_s.split(",").map(&:strip).uniq
      @post.tags.clear
      @post.save_tags(tag_names)

      redirect_to posts_path, notice: "投稿が更新されました。"
    else
      @tag_names = @post.tags.map(&:name).join(",")
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "投稿を削除しました。"
  end

  private

  def set_post
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_path, alert: "この投稿にはアクセスできません。" unless @post
  end

  def post_params
    params.require(:post).permit(:amount, :body)
  end
end
