class Admin::HomeController < ApplicationController
	before_action :authenticate_admin!
end
