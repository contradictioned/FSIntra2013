class Minutes::MotionsController < ApplicationController
  before_action :signed_in_user
  load_and_authorize_resource
  
  before_action :set_minutes_motion, only: [:show, :edit, :update, :destroy]
  before_action :set_minute_and_item
  before_action :convert_currency_to_cent, only: [:create, :update]

  # GET /minutes/motions
  # GET /minutes/motions.json
  def index
    @minutes_motions = Minutes::Motion.all
  end

  # GET /minutes/motions/1
  # GET /minutes/motions/1.json
  def show
  end

  # GET /minutes/motions/new
  def new
    @minutes_motion = @minutes_item.motions.build
  end

  # GET /minutes/motions/1/edit
  def edit
  end

  # POST /minutes/motions
  # POST /minutes/motions.json
  def create
    @minutes_motion = @minutes_item.motions.build(minutes_motion_params)

    respond_to do |format|
      if @minutes_motion.save
        format.html { redirect_to @minutes_minute, notice: t('feedback.created', :model => Minutes::Motion.model_name.human) }
        format.json { render action: 'show', status: :created, location: @minutes_minute }
      else
        format.html { render action: 'new' }
        format.json { render json: @minutes_motion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /minutes/motions/1
  # PATCH/PUT /minutes/motions/1.json
  def update
    params[:minutes_motion][:amount] ||= ""
    params[:minutes_motion][:pro] ||= ""
    params[:minutes_motion][:con] ||= ""
    params[:minutes_motion][:abs] ||= ""
    respond_to do |format|
      if @minutes_motion.update(minutes_motion_params)
        format.html { redirect_to @minutes_minute, notice: t('feedback.updated', :model => Minutes::Motion.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @minutes_motion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minutes/motions/1
  # DELETE /minutes/motions/1.json
  def destroy
    @minutes_motion.destroy
    respond_to do |format|
      format.html { redirect_to @minutes_minute, notice: t('feedback.destroyed', :model => Minutes::Motion.model_name.human) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_minutes_motion
      @minutes_motion = Minutes::Motion.find(params[:id])
    end

    def set_minute_and_item
      @minutes_minute = Minutes::Minute.find(params[:minute_id])
      @minutes_item = Minutes::Item.find(params[:item_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def minutes_motion_params
      params.require(:minutes_motion).permit(:order, :mover_id, :pro, :con, :abs, :rationale, :amount, :minutes_item_id, :approved, :apparent_majority)
    end

    def convert_currency_to_cent
      # compute cent value
      str = params[:minutes_motion][:amount].to_s
      if matches = str.match(/(?<integral>\d+)((\.|,)(?<fractional>\d\d))?€?/)
        params[:minutes_motion][:amount] = (matches[:integral].to_i * 100) + matches[:fractional].to_i
      else
        params[:minutes_motion][:amount] = ""
      end
    end
end
