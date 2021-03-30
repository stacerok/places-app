class Api::PlacesController < ApplicationController

  def index
    @places = Place.all
    render "index.json.jb"
  end

  def create
    @place = Place.new(
      name: params[:name],
      address: params[:address],
    )
    if @place.save
      render "show.json.jb"
    else
      render json: { errors: @place.errors.full_messages }, status: 406
    end
  end

  def show
    input = params[:id]
    @place = Place.find_by(id: input)
    render "show.json.jb"
  end

  def update
    input = params[:id]
    @place = Place.find_by(id: input)

    @place.name = params[:name] | @place.name
    @place.address = params[:address] | @place.address

    if @place.save
      render "show.json.jb"
    else
      render json: { errors: @place.errors.full_messages }, status: 406
    end
  end

  def destroy
    input = params[:id]
    @place = Place.find_by(id: input)

    @place.destroy
    render json: "Your place has been destroyed."
  end
end
