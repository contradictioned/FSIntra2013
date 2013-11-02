class Minutes::ItemsController < ApplicationController
  before_action :set_minutes_item, only: [:show, :edit, :update, :destroy]
  before_action :set_minute
  respond_to :html, :js

  # GET /minutes/items
  # GET /minutes/items.json
  def index
    @minutes_items = Minutes::Item.all
  end

  # GET /minutes/items/1
  # GET /minutes/items/1.json
  def show
  end

  # GET /minutes/items/new
  def new
    @minutes_item = @minutes_minute.items.build
    #respond_with(:minutes, @minutes_minute, @minutes_item)
    respond_with(@minutes_item)
  end

  # GET /minutes/items/1/edit
  def edit
  end

  # POST /minutes/items
  # POST /minutes/items.json
  def create
    @minutes_item = @minutes_minute.items.build(minutes_item_params)

    respond_to do |format|
      if @minutes_item.save
        format.html { redirect_to @minutes_minute, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @minutes_minute }
      else
        format.html { render action: 'new' }
        format.json { render json: @minutes_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /minutes/items/1
  # PATCH/PUT /minutes/items/1.json
  def update
    respond_to do |format|
      if @minutes_item.update(minutes_item_params)
        format.html { redirect_to @minutes_minute, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @minutes_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minutes/items/1
  # DELETE /minutes/items/1.json
  def destroy
    @minutes_item.destroy
    respond_to do |format|
      format.html { redirect_to minutes_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_minutes_item
      @minutes_item = Minutes::Item.find(params[:id])
    end

    def set_minute
      @minutes_minute = Minutes::Minute.find(params[:minute_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def minutes_item_params
      params.require(:minutes_item).permit(:date, :title, :content, :order, :minute_id)
    end
end
