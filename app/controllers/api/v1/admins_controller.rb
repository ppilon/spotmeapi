class Api::V1::AdminsController < ApplicationController
	respond_to :json
	def show
		respond_with Admin.find(params[:id])
	end
end
