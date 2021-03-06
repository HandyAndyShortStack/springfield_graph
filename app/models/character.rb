class Character < ActiveRecord::Base
  has_many :connections, foreign_key: :connector_id

  def attributes
    {name: name, id: id, image_url: image_url}
  end

  def connect_to connectee, description
    connections.find_or_create_by(connectee_id: connectee.id, description: description)
    self
  end

  def underscore_name
    name.to_s.downcase.gsub " ", "_"
  end

  def image_url
    "/#{underscore_name}.png"
  end
end
