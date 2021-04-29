class ApplicationController < ActionController::Base
    
    include UsersHelper
    before_action :login_check

end
