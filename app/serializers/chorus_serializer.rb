class ChorusSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :license, :learning_outcome_guid

  belongs_to :user
  belongs_to :context

end