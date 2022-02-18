require "json"
require "open-uri"

class ListsController < ApplicationController
  before_action :set_list, only: %i[show]
  def index
    @lists = List.all
  end

  def show; end

  def new
    @list = List.new
  end

  def create
    @image_search = params[:image_search]
    # @unsplash_json = image(@image_search)
    @list = List.new()

    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  # def image(image_search)
  #   @url = "https://api.unsplash.com/search/photos?page=1&per_page=10&query=#{image_search}&client_id=SYLNEOhroZr_ufWU1PgbMZuWjtGyH1WfdKuupbQdjlQ"
  #   @unparsed_data = URI.open(url).read
  #   JSON.parse(user_serialized)
  # end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :image_url)
  end
end
