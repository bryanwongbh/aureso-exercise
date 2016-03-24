module Api
	module V1
		class ModelTypesController < ApplicationController
			respond_to :json
      
      def index
        respond_with ModelType.all
      end
      
      def show
        respond_with ModelType.friendly.find(params[:id])
      end
      
      def create
        respond_with ModelType.create(params[:model_type])
      end
      
      def update
        respond_with ModelType.update(params[:id], params[:model_types])
      end
      
      def destroy
        respond_with ModelType.destroy(params[:id])
      end
		end
	end
end