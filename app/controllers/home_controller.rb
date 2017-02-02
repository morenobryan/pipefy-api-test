class HomeController < ApplicationController
  def index
    @organization = Organization.find(Organization::ORGANIZATION_ID)
  end
end
