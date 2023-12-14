class VendorService

  def get_vendors
    response = vendors_conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  def vendors_conn
    Faraday.new(url: "http://localhost:5000/api/v0/vendors")
  end

  def get_vendor(id)
    response = vendor_conn(id).get
    JSON.parse(response.body, symbolize_names: true)
  end

  def vendor_conn(id)
    Faraday.new(url: "http://localhost:5000/api/v0/vendors/#{id}")
  end
end