# app/serializers/user_serializer.rb
class UserSerializer < ActiveModel::Serializer
  attributes :data

  def initialize(object, options = {})
    @token = options[:token]
    super(object, options)
  end

  def token
    "#{@token} (JWT)"
  end

  def name
    "#{object.first_name} #{object.last_name}"
  end

  def created_at
    object.created_at.iso8601
  end

  def updated_at
    object.updated_at.iso8601
  end

  def type
    "users"
  end

  def data
    {
      id: object.id,
      type: type,
      attributes: {
        token: token,
        email: object.email,
        name: name,
        country: object.country,
        createdAt: created_at,
        updatedAt: updated_at
      }
    }
  end
end
