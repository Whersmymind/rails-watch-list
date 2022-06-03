class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update]
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    if @list.save
      redirect_to list_path(@list), notice: 'list was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to @list, notice: 'list was successfully updated.'
    else
      render :edit
    end
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
