class PlantsController < ApplicationController
    def index
      plants = Plant.all
      render json: plants, only: [:id, :name, :image, :price]
    end
  
    def show
      plant = Plant.find_by(id: params[:id])
      if plant
        render json: plant, only: [:id, :name, :image, :price]
      else
        render json: { error: 'Plant not found' }, status: :not_found
      end
    end
  
    def create
      plant = Plant.new(plant_params)
      if plant.save
        render json: plant, only: [:id, :name, :image, :price], status: :created
      else
        render json: { error: plant.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def plant_params
      params.permit(:name, :image, :price)
    end
  end
  