class MarketService

  def market_conn
    Faraday.new(url: "http://localhost:5000")
  end

  def get_markets
    response = market_conn.get("/api/v0/markets")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_market(id)
    response = market_conn.get("/api/v0/markets/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def search_markets(query)
    response = market_conn.get("/api/v0/markets/search#{query}")
    JSON.parse(response.body, symbolize_names: true)
  end
end