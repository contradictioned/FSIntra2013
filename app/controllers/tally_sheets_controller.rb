class TallySheetsController < ApplicationController
  before_action :signed_in_user
  authorize_resource :class => false
  before_action :get_users, only: [:print_users]
  before_action :get_beverages, only: [:print_items]

  def index
    @tabs = Tab.running
    @beverage_tabs = BeverageTab.where(tab_id: @tabs).select(:name, :price, :capacity).distinct
    @users = User.includes(:tabs).where(tabs: {status: Tab::STATUS_RUNNING}) | User.where(on_beverage_list: true)
    @data = {}
    @users.each do |user|
      tab = @tabs.find_by(user: user)
      @data[user] = {tab: tab}
      @data[user][:beverage_tabs] = []
      unless tab.nil?
        @beverage_tabs.each_with_index do |bt,j|
          @data[user][:beverage_tabs][j] = tab.beverage_tabs.where(name: bt.name, price: bt.price, capacity: bt.capacity).sum(:count)
        end
      else
        @beverage_tabs.each_with_index do |bt,j|
          @data[user][:beverage_tabs][j] = 0
        end
      end
    end
  end

  def edit
    @new_candidates = User.all.where(:on_beverage_list => false)
    @delete_candidates = User.all.where(:on_beverage_list => true)
  end

  def update
    User.where(:id => params['new']).update_all(:on_beverage_list => true)
    User.where(:id => params['delete']).update_all(:on_beverage_list => false)
    redirect_to tally_sheet_edit_url, notice: t('.updated')
  end

  def print_users
    respond_to do |format|
      format.pdf do
        render :pdf => "Benutzerliste.pdf"
      end
    end
  end

  def print_items
    @items = Beverage.available
    respond_to do |format|
      format.pdf do
        render :pdf => "Preisliste.pdf"
      end
    end
  end

  def print_price_list
    @items = Beverage.available
    respond_to do |format|
      format.pdf do
        render :pdf => "Preisliste_Aushang.pdf"
      end
    end
  end


  private
    def get_users
      @search = User.where(:on_beverage_list => true).order('lastname, firstname').search(params[:q])
      @users = @search.result
    end

    def get_beverages
      @beverages = Beverage.available
    end

    def tally_sheet_params
      params[:tabs]
    end
  end
