class ApiController < ApplicationController
  http_basic_authenticate_with :name => HTTP_AUTH_USER, :password => HTTP_AUTH_PASSWORD
  skip_before_filter :verify_authenticity_token

  # expect post-data:
  # params[:buy] => {:user => loginname, :beverages => { $id => $count, 3 => 4}}
  def buy
    begin
      beverages = buy_params[:beverages]
      loginname = buy_params[:user]

      user = User.find_by(loginname: loginname, on_beverage_list: true)
      tab = Tab.running.find_or_create_by(user_id: user.id)
      beverages.each do |id, count|
        beverage = Beverage.available.find(id)
        beverage_tab = BeverageTab.create(name: beverage.name, price: beverage.price, capacity: beverage.capacity, count: count)
        tab.beverage_tabs << beverage_tab
        
        raise Exception unless beverage_tab.save
      end
      render :json => buy_params.to_json, status: :ok 
    rescue Exception => e
      logger.debug "Exception while buying: #{e.inspect}"
      render :json => buy_params.to_json, status: :unprocessable_entity
    end
  end

  # Gets all items and renders them as json
  def items
    @beverages = Beverage.available
    respond_to do |format|
      format.json { render :json => @beverages.to_json(methods: :image_url)}
    end
  end

  # expect params[:user] => {:name => 'name'}
  def user
    name = params[:name]
    user = User.find_by(loginname: name, on_beverage_list: true)
    respond_to do |format|
      format.json { render :json => user.to_json(only: [], methods: [:email_md5, :debts, :running_debts]) }
    end
  end

  private
    def buy_params
      params[:buy]
    end
end
