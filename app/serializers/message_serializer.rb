class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :subject, :from, :name
end
