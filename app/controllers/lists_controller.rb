class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  #   <ul>
  #   <% @bookmarks.each do |bookmark| %>
  #   <li>
  #       <%= bookmark.movie.title %>
  #   </li>
  # </ul>
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  privateit

  def list_params
    params.require(:list).permit(:name)
  end
end
