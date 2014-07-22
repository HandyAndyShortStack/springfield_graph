class Connection < ActiveRecord::Base
  has_one :connector, foreign_key: :id, primary_key: :connector_id, class_name: "Character"
  has_one :connectee, foreign_key: :id, primary_key: :connectee_id, class_name: "Character"

  def attributes
    {connector_id: connector_id, connectee_id: connectee_id, description: description, id: id}
  end
end
