module Api
	module V1
		class OrganizationsController < ApplicationController
			respond_to :json
      
      def index
        respond_with Organization.all
      end
      
      def show
        respond_with Organization.find(params[:id])
      end
      
      def create
        respond_with Organization.create(params[:organization])
      end
      
      def update
        respond_with Organization.update(params[:id], params[:organizations])
      end
      
      def destroy
        respond_with Organization.destroy(params[:id])
      end
		end
	end
end