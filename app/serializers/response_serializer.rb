class ResponseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :license, :user, :created_at

  # belongs_to :chorus
  # belongs_to :context
  # belongs_to :user

  def user
    if object.user
      {
              id: object.user.id,
              name: object.user.name,
              avatar_url: ''
      }
    end
  end

end
