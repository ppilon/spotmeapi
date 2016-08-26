class Api::V1::AlertsController < ApplicationController
	before_action :authenticate_with_token!, only: [:create]
	respond_to :json
	def index
		respond_with  Alert.within_school(params[:id])
	end
	def show
		respond_with Alert.find(params[:id])
	end
	def create
		alert = Alert.new(alert_params)
		alert.user_id = current_user.id
		if alert.save
			render json: alert, status: 201, location: [:api, alert]
		else
			render json: { errors: alert.errors }, status: 422
		end
	end
	def update

		alert = Alert.find(params[:id])

		if alert.update(alert_params)
			render json: alert, status: 200, location: [:api, alert]
		else
			render json: { errors: alert.errors }, status: 422
		end
	end
	private

    def alert_params
      params.require(:alert).permit(:latitude, :longitude, :status, :admin_description, :user_description)
    end
end