class Api::V1::AlertsController < ApplicationController
	respond_to :json
	def index
		respond_with  Alert.within_school(params[:id])
	end
end