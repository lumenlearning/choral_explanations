require 'rails_helper'

RSpec.describe Context, type: :model do
  let(:context) { FactoryGirl.create(:context) }

  it "should create factory example" do
    expect(context).to_not eq nil
    expect(context.name).to eq "Test Context"
  end

  it "should find parent" do
    child = FactoryGirl.create(:context, parent_context: context)

    expect(child.parent_context_id).to eq context.id
  end

end
