class MarketVendorsController < ApplicationController

  def create
    json = {
      market_id: params[:market_id],
      vendor_id: params[:vendor_id]
    }
    conn = Faraday.new(url: "http://localhost:5000/api/v0/market_vendors") 
    
    response = conn.post("", json)
    data = JSON.parse(response.body, symbolize_names: true)
    if response.status == 201
      flash[:notice] = "Vendor was added to market"
    else
    require 'pry'; binding.pry

      flash[:notice] = "Vendor already in market"
    end
    redirect_to "/vendors/#{params[:vendor_id]}"
  end

end