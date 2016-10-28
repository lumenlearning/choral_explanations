class ChorusSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :license, :learning_outcome_guid,
  :response_count, :created_at, :user

  # belongs_to :user
  belongs_to :context
  has_many :responses

  def user
    if object.user
      {
              id: object.user.id,
              name: object.user.name,
              avatar_url: ''
      }
    end
  end

  def response_count
    object.responses.count
  end

end
