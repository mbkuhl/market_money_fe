class VendorsController <ApplicationController

  def show
    vf = VendorsFacade.new
    @vendor = vf.vendor(params[:id])
    if params[:commit]
      if params[:city] && params[:state] == ""
        flash[:notice] = "Cannot search city without state."
        render :show
      else
        @markets = MarketsFacade.new.market_search(params)
        @city = params[:city]
        @state = params[:state]
        @name = params[:name]
      end
    end
  end
end