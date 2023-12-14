class MarketService

  def get_markets
    response = markets_conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  def markets_conn
    Faraday.new(url: "http://localhost:5000/api/v0/markets")
  end

  def get_market(id)
    response = market_conn(id).get
    JSON.parse(response.body, symbolize_names: true)
  end

  def market_conn(id)
    Faraday.new(url: "http://localhost:5000/api/v0/markets/#{id}")
  end
end