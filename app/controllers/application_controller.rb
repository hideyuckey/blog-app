class ApplicationController < ActionController::Base

  def after_sign_out_for(resource)
    '/users/sign_in'
  end

end
