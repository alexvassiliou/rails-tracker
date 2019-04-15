class GoodsController < ApplicationController
  def index
    @goods = Good.all
  end

  def import
    Good.import(params[:file])
    redirect_to root_url, notice: "file uploaded!"
  end
end
