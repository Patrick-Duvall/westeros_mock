class MembersIndexFacade

  def initialize(house_name)
    @house_name = house_name
  end

  def member_count
    service = WesterosService.new(@house_name)
    members = service.members
    members.count
  end

  def members
    members = service.members
    members.map{|info| Member.new(info)}
  end

  private

  def service
    @service ||= WesterosService.new(@house_name)
  end
end
