class PagesController < ApplicationController
  
  def home
    redirect_to shoes_path if logged_in?
  end

end