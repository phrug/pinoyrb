require 'spec_helper'

describe Venue do
  it 'should generate slug on create' do
    expect(FactoryGirl.create(:venue, name: "Nowhere Land").slug).to eq("nowhere-land")
  end
end
