module Api
	module V1
		class ModelTypesController < ApplicationController
      before_action :authenticate_user_from_token!
      skip_before_filter  :verify_authenticity_token, :only => [:create, :update]

			respond_to :json
      
      def index
        @model = Model.friendly.find(params[:model_id])
        respond_with @model.model_types.all
      end
      
      def show
        @model = Model.friendly.find(params[:model_id])
        respond_with @model.model_types.friendly.find(params[:id])
      end
      
      def create
        @model = Model.friendly.find(params[:model_id])
        new_model_type_params = model_type_params.except("model_slug")
        @model_type = ModelType.new(new_model_type_params)
        @model_type.update(model_id: @model.id)
        if @model_type.save
          redirect_to api_model_model_type_path @model, @model_type
        end
      end
      
      def update
        @model = Model.friendly.find(params[:model_id])
        @model_type = @model.model_types.friendly.find(params[:id])
        new_model_type_params = model_type_params.except("model_slug")
        respond_to do |format|
          if @model_type.update_attributes(new_model_type_params)
            format.json {render json: @model_type}
          end
        end
      end
      
      def destroy
        respond_with ModelType.destroy(params[:id])
      end


      private
        def model_type_params
          params.require(:model_type).permit(:name, :model_type_slug, :model_type_code, :base_price, :model_slug, :model_id)
        end
		end
	end
end