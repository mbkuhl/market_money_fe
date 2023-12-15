class VendorsController <ApplicationController

  def show
    vf = VendorsFacade.new
    @vendor = vf.vendor(params[:id])
    if params[:commit]
      if params[:city].present? && params[:state] == ""
        flash[:notice] = "Cannot search city without state."
        render :show
      else
        @markets = MarketsFacade.new.market_search(params)
        @city = params[:city] if params[:city].present?
        @state = params[:state] if params[:state].present?
        @name = params[:name] if params[:name].present?
      end
    end
  end
end