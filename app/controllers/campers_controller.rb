class CampersController < ApplicationController
    def index
      campers = Camper.all
      render json: campers
    end
  
    def show
      camper = Camper.find(params[:id])
      render json: camper
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Camper not found' }, status: :not_found
    end
  
    def show_with_activities
      camper = Camper.includes(:activities).find(params[:id])
      render json: camper, include: :activities
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Camper not found' }, status: :not_found
    end
  
    def create
      camper = Camper.new(camper_params)
      if camper.save
        render json: camper, status: :created
      else
        render json: { errors: camper.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def camper_params
      params.require(:camper).permit(:name, :age)
    end
  end