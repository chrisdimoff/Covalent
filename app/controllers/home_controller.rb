class HomeController < ApplicationController
  def index

    if Rails.env == "production"
      redirect_to "http://unbouncepages.com/mhapp-home/"
    end
  end


end
