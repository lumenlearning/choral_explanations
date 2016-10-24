require 'rails_helper'

RSpec.describe Response, type: :model do
  let(:response) { FactoryGirl.create(:response) }

  it "should restrict licenses" do
    response.license = "oi"

    expect { response.save! }.to raise_error ActiveRecord::RecordInvalid
  end
end
