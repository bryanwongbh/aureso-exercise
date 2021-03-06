module Api
	module V1
		class ModelsController < ApplicationController
		  before_action :authenticate_user_from_token!
			respond_to :json
      
      def index
        respond_with Model.all
      end
      
      def show
        respond_with Model.friendly.find(params[:id]), root: "models"
      end
      
      def create
        respond_with Model.create(params[:model])
      end
      
      def update
        respond_with Model.update(params[:id], params[:models])
      end
      
      def destroy
        respond_with Model.destroy(params[:id])
      end
		end
	end
end