class MarketsController < ApplicationController
  def index
    markets_facade = MarketsFacade.new
    @markets = markets_facade.markets
  end

  def show
    markets_facade = MarketsFacade.new
    @market = markets_facade.market(params[:id])
  end
end