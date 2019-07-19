class MembersController < ApplicationController
  def index
    @facade = MembersIndexFacade.new(params[:q])
  end
end
