# frozen_string_literal: true

# app/serializers/content_serializer.rb
class ContentSerializer < ActiveModel::Serializer
  attributes :data

  def created_at
    object.created_at.iso8601
  end

  def updated_at
    object.updated_at.iso8601
  end

  def data
    {
      id: object.id,
      type: "content",
      attributes: {
        title: object.title,
        body: object.body,
        createdAt: created_at,
        updatedAt: updated_at
      }
    }
  end
end
