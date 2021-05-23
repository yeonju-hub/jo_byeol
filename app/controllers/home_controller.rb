class HomeController < ApplicationController
  def index
	@meetings = Meeting.all
	@admins = Admin.all
  end
end
