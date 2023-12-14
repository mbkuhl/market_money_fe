class MarketObject
  attr_reader :name, :id, :city, :state, :vendors, :street, :full_city
  def initialize(market_data, find_vendors = false)
    @name = market_data[:attributes][:name]
    @id = market_data[:id]
    @street = market_data[:attributes][:street]
    @full_city = "#{market_data[:attributes][:city]}, #{market_data[:attributes][:state]} #{market_data[:attributes][:zip]}"
    @city = market_data[:attributes][:city]
    @state = market_data[:attributes][:state]
    @vendors = get_vendors(market_data) if find_vendors
  end

  def get_vendors(market_data)
    @vendors ||= begin
      vf = VendorsFacade.new
      market_data[:relationships][:vendors][:data].map do |vendor|
        vf.vendor(vendor[:id])
      end
    end
  end
end