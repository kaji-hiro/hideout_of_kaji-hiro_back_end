module Api
  module V1
    class StaticPagesController < ApplicationController
      def home
        render json: { message: 'hello world !' }
      end
    end
  end
end
