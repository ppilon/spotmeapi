class Api::V1::SchoolsController < ApplicationController
	respond_to :json
	def show
		respond_with School.find(params[:id])
	end
end
