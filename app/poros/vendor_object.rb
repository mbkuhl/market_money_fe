class VendorObject
  attr_reader :name, :id, :contact_name, :contact_phone, :description, :credit_accepted
  def initialize(vendor_data)
    @name = vendor_data[:attributes][:name]
    @id = vendor_data[:id]
    @contact_name = vendor_data[:attributes][:contact_name]
    @contact_phone = vendor_data[:attributes][:contact_phone]
    @description = vendor_data[:attributes][:description]
    @credit_accepted = vendor_data[:attributes][:credit_accepted] ? "YES" : "NO"
  end

end