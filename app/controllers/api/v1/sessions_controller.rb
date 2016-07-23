class Api::V1::SessionsController < ApplicationController
    before_action :authenticate_with_token!, only: [:destroy]
	def create
		user_password = params[:session][:password]
    	user_email = params[:session][:email]

        if User.find_by(email: user_email)
            user = User.find_by(email: user_email)
        else
            user = Admin.find_by(email: user_email)
        end

    	if user && user.valid_password?(user_password)
    		sign_in user, store: false
    		user.generate_authentication_token!
    		user.save
    		render json: user, status: 200, location: [:api, user]
    	else
    		render json: { errors: "Invalid email or password" }, status: 422
    	end
    end
    def destroy
        if user_signed_in?
            current_user.generate_authentication_token!
            user.save
        else
            current_admin.generate_authentication_token!
            current_admin.save
        end
        head 204
    end

    private

    def session_params
      params.require(:session).permit(:email, :password)
    end
end
