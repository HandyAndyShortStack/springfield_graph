class Character < ActiveRecord::Base
  has_many :connections, foreign_key: :connector_id

  def connect_to connectee, description
    connections.find_or_create_by(connectee_id: connectee.id, description: description)
    self
  end

  def underscore_name
    name.to_s.underscore.gsub " ", "_"
  end
end
