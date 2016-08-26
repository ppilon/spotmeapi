class Api::V1::AlertsController < ApplicationController
	respond_to :json
	def index
		respond_with  Alert.within_school(params[:id])
	end
	def show
		respond_with Alert.find(params[:id])
	end
end