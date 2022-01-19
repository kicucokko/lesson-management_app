class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource
    when Customer
      customer_session_path
    when Admin
      aadmin_session_path
    end
  end
end
