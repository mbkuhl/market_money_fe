class VendorsFacade

  def vendors
    vendor_service = VendorService.new
    vendors_json = vendor_service.get_vendors

    vendors_json[:data].map do |vendor|
      VendorObject.new(vendor)
    end
  end

  def vendor(id)
    vendor_service = VendorService.new
    vendor_json = vendor_service.get_vendor(id)

    VendorObject.new(vendor_json[:data])
  end

end