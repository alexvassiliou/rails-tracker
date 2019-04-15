class GoodsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @goods = Good.search(params[:search]).order(sort_column + " " + sort_direction)
  end

  def import
    Good.import(params[:file])
    redirect_to root_url, notice: "file uploaded!"
  end

  private

  def sort_column
    Good.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
