class MembersIndexFacade

  def initialize(house_name)
    @house_name = house_name
  end

  def member_count
    service = WesterosService.new(@house_name)
    service.count
    response = Faraday.get "http://westerosapi.herokuapp.com/api/v1/house/#{@house_name}?api_key=egg"
    JSON.parse(response.body)['data'][0]['attributes']['members'].count
  end

  def members
    response = Faraday.get "http://westerosapi.herokuapp.com/api/v1/house/#{@house_name}?api_key=egg"
    member_info = JSON.parse(response.body)['data'][0]['attributes']['members']
    member_info.map{|info| Member.new(info)}
  end

end
