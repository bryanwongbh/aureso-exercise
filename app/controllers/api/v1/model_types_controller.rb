module Api
	module V1
		class ModelTypesController < ApplicationController
      skip_before_filter  :verify_authenticity_token, :only => [:create]

			respond_to :json
      
      def index
        respond_with ModelType.all
      end
      
      def show
        respond_with ModelType.friendly.find(params[:id])
      end
      
      def create
        respond_with ModelType.create(modeltype_params)
      end
      
      def update
        respond_with ModelType.update(params[:id], params[:model_types])
      end
      
      def destroy
        respond_with ModelType.destroy(params[:id])
      end


      private
        def modeltype_params
          params.require(:model_type).permit(:name, :model_type_slug, :model_type_code, :model_id, :base_price)
        end
		end
	end
end