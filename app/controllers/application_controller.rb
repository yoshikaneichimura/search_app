class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
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

  def after_sign_in_path_for(resource)
   top_path
  end

  def after_sign_out_path_for(resouce)
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
