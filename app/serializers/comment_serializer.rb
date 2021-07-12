class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
end

# attributesを指定することで、不要なものを無くした状態でjsonを簡単に作れるのがserializer
