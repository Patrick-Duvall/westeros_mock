require "rails_helper"

describe Member do
  it "has a name and id" do
    member = Member.new({'name' => 'tom', 'id' => 1})
    expect(member.name).to eq('tom')
    expect(member.id).to eq(1)
  end


end
