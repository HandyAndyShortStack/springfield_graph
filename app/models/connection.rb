class Connection < ActiveRecord::Base
  has_one :connector, foreign_key: :id, primary_key: :connector_id, class_name: "Character"
  has_one :connectee, foreign_key: :id, primary_key: :connectee_id, class_name: "Character"
end
