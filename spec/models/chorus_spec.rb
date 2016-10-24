require 'rails_helper'

RSpec.describe Chorus, type: :model do
  let(:chorus) { FactoryGirl.create(:chorus) }

  it "should restrict licenses" do
    chorus.license = "oi"

    expect { chorus.save! }.to raise_error ActiveRecord::RecordInvalid
  end
end
