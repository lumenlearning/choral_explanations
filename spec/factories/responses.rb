FactoryGirl.define do
  factory :response do
    name "Re: Test Chorus"
    description "Test response description."
    license "cc_by"

    chorus
    context
    user
  end

end
