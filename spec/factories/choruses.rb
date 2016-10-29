FactoryGirl.define do
  factory :chorus do
    name "Test Chorus"
    description "<p><strong>Test data</strong></p>"
    learning_outcome_guid "abc123"
    license "cc_by"

    user
    context
  end

end
