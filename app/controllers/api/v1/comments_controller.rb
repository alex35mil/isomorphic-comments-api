class Api::V1::CommentsController < ApplicationController

  skip_before_action :authenticate_api_user!, only: [:index, :show, :create]
  before_action :get_comment, only: [:show, :destroy]

  def index
    @comments = Comment.all.order(:id).reverse
    respond_with @comments
  end

  def show
    respond_with @comment
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment, status: 201
    else
      render json: { errors: @comment.errors.full_messages }, status: 422
    end
  end

  def destroy
    @comment.destroy if Rails.env.development?
    head 204
  end


  private

    def get_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:author, :comment)
    end

end
