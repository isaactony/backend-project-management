class AdminsController < ApplicationController

    def index
        admins = Admin.all
        render json: admins, status: :ok
    end
    
      def create
        admin = Admin.new(admin_params)
        if admin.save
          render json: admin, status: :created
        else
          render json: { errors: admin.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      private
    
      def admin_params
        params.permit(:username, :email, :password)
      end

end
