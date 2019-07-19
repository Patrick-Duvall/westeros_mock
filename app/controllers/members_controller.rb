class MembersController < ApplicationController
  def index
    # require "pry"; binding.pry
    @facade = MembersIndexFacade.new(params[:q])
  end
end
