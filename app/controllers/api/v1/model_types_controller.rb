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
        @model = Model.find_by(params[:model_slug])
        new_modeltype_params = modeltype_params.except("model_slug")
        @model_type = ModelType.new(new_modeltype_params)
        @model_type.update(model_id: @model.id)
        if @model_type.save
          redirect_to api_model_model_type_path @model, @model_type
        end
      end
      
      def update
        respond_with ModelType.update(params[:id], params[:model_types])
      end
      
      def destroy
        respond_with ModelType.destroy(params[:id])
      end


      private
        def modeltype_params
          params.require(:model_type).permit(:name, :model_type_slug, :model_type_code, :base_price, :model_slug)
        end
		end
	end
end