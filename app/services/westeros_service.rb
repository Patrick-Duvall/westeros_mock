class WesterosService

  def initialize(house_name)
    @house_name = house_name.
  end

  def members
    require "pry"; binding.pry

    JSON.parse(conn.get("/api/v1/house/").body)
    response = conn.get("/api/v1/house/#{@house_name}")
    JSON.parse(response.body)['data'][0]['attributes']['members']
  end

  private

  def conn
    conn = Faraday.new(:url => "http://westeros-as-a-service.herokuapp.com") do |faraday|
      faraday.headers['x_api_key'] = ENV['WESTEROS_KEY']
      faraday.headers['Content-Type'] = 'application/json'
      faraday.adapter  Faraday.default_adapter
    end

  end

end
