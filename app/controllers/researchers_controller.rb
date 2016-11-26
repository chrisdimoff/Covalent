class ResearchersController < ApplicationController
  def new
    @user = User.new
  end
end
