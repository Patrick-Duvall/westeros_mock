class WesterosService

  def initialize(house_name)
    @house_name = house_name
  end

  def members
    response = conn.get("/api/v1/house/#{@house_name}?api_key=#{ENV['WESTEROS_KEY']}")
    JSON.parse(response.body)['data'][0]['attributes']['members']
  end

  private

  def conn
    conn = Faraday.new(:url => "http://westerosapi.herokuapp.com") do |faraday|
      faraday.adapter  Faraday.default_adapter  
    end

  end

end
