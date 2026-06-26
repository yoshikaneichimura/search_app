class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿が成功しました。"
      redirect_to post_path(@post.id)
    else
     render :new
    end
  end

  def index
    @search_form = Post.ransack(params[:q])
    # 複数ワード検索　~>
    # if params[:q] && params[:q][:title_or_body_or_user_name_cont_all].present?
    #   key_words = params[:q][:title_or_body_or_user_name_cont_all].split(/[\p{blank}\s]+/)
    #   grouping_hash = key_words.reduce({}) do |hash, word|
    #     hash.merge(word => {title_or_body_or_user_name_cont: word})
    #   end
    # end
    # @search_form = Post.ransack({
    #   combinator: "and",
    #   groupings: grouping_hash
    # })
    # <~ 複数ワード検索
    @posts = @search_form.result(distinct: true).includes(:user)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿が成功しました。"
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :price, :day, :status)
  end
end
