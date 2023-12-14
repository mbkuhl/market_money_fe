class MarketsFacade

  def markets
    market_service = MarketService.new
    markets_json = market_service.get_markets

    markets_json[:data].map do |market|
      MarketObject.new(market)
    end
  end

  def market(id)
    market_service = MarketService.new
    market_json = market_service.get_market(id)

    MarketObject.new(market_json[:data], true)
  end

end