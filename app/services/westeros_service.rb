class WesterosService

  def initialize(house_name)
    @house_name = house_name
  end

  def members
    data = JSON.parse(conn.get("/api/v1/house/").body)
    id = data.find{|house| house['name'] == @house_name}['id'] 
    response = conn.get("/api/v1/house/#{id}")
    JSON.parse(response.body)
  end

  private

  def conn
    Faraday.new(:url => "http://westeros-as-a-service.herokuapp.com") do |faraday|
      faraday.headers['x_api_key'] = ENV['WESTEROS_KEY']
      faraday.adapter  Faraday.default_adapter
    end

  end

end
