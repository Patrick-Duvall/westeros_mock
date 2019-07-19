require "rails_helper"

describe WesterosService do
  before :each do
    houses = File.read('fixtures/houses_with_ids.json')
    greyjoy_members = File.read('fixtures/house_greyjoy_members.json')

    @service = WesterosService.new('Greyjoy')
    stub_request(:get, "http://westeros-as-a-service.herokuapp.com/api/v1/house/").with( body: houses)
    stub_request(:get, "http://westeros-as-a-service.herokuapp.com/api/v1/house/5").with( body: greyjoy_members)
  end

  it "can get all members of a house" do
    ids = (38..44)
    ids.each do|id|
       expect(@service.members.map{|member|member['id']}.include?(id)).to eq(true)
    end

    names = @service.members.map{|member|member['name']}
      names.each do |name|
        expect(name).to match('Greyjoy')
      end
      
    expect(@service.members.count).to eq(7)
  end


end
