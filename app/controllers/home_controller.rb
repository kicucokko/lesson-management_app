class HomeController < ApplicationController
  def index
    if admin_signed_in?
     @admin = Admin.find(current_admin.id)
    elsif customer_signed_in?
     @customer = Customer.find(current_customer.id)
    else
   end
  end
end
