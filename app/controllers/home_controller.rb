class HomeController < ApplicationController
  def unbounce

      if Rails.env =="production"
        redirect_to "http://unbouncepages.com/mhapp-home/"
      else
        redirect_to root_path
      end
  end

  def index
  end

end
