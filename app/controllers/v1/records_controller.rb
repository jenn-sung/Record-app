class V1::RecordsController < ApplicationController
  def index
    records = Record.all
    render json: records.as_json
  end

  def show
    record = Record.find_by(id: params[:id])
    render json: record.as_json
  end

  def create
    record = Record.new(
      title: params[:title],
      artist: params[:artist],
      year: params[:year],
      price: params[:price],
      )
    if record.save
      render json: record.as_json 
    else
      render json: {errors: record.errors.full_messages}
    end
  end

  def update
    record = Record.find_by(id: params[:id])
    if record.update(
      title: params[:title],
      artist: params[:artist],
      year: params[:year],
      price: params[:price]
      )
      render json: record.as_json
    else
      render json: {errors: record.errors.full_messages}
    end
  end

  def destroy
    record = Record.find_by(id: params[:id])
    record.destroy
    render json: record.as_json
  end
end
