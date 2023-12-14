class VendorsController <ApplicationController

  def show
    vf = VendorsFacade.new
    @vendor = vf.vendor(params[:id])
  end
end