class WesterosService

  def initialize(house_name)
    @house_name = house_name
  end

  def count
    conn.get("#{@house_name}") {api_key: {ENV['WESTEROS_KEY']}

    require "pry"; binding.pry
  end

  private

  def conn
    conn = Faraday.new(:url => "http://westerosapi.herokuapp.com/api/v1/ do |faraday|
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

  end

end
