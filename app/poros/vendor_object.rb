class VendorObject
  attr_reader :name, :id
  def initialize(vendor_data)
    @name = vendor_data[:attributes][:name]
    @id = vendor_data[:id]

  end

end