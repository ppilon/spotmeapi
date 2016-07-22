class Api::V1::SchoolsController < ApplicationController
	respond_to :json
	def show
		respond_with School.find(params[:id])
	end
	def create
		school = School.new(school_params)

		if school.save
			render json: school, status: 201, location: [:api, school]
		else
			render json: { errors: school.errors }, status: 422
		end
	end
	private

	def school_params
		params.require(:school).permit(:school_name, :latitude, :longitude, :radius, admins_attributes: [:email, :password, :password_confirmation])
	end
end
