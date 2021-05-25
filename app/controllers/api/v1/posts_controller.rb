module Api
  module V1
    class PostsController < ApplicationController
      def index
        render json: Post.all.to_json
      end

      def show
        render json: Post.find(params[:id]).to_json
      end

      def create
        post = Post.new(params.permit(:title, :body))
        if post.save
          render json: post.id
        else
          render json: post.errors.full_messages.to_json
        end
      end

      def update
        post = Post.find(params[:id])
        if post.update(params.permit(:title, :body))
          render json: post.id
        else
          render json: post.errors.full_messages.to_json
        end
      end

      def destroy
        post = Post.find(params[:id])
        # TODO: 削除ではなく非表示にするように修正する
        post.destroy
      end
    end
  end
end
