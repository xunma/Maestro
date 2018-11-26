class PagesController < ApplicationController
  # subject to change...
  # should we include other pages like search results, show pages
  skip_before_action :authenticate_user!, only: :home
  def home
  end

end
