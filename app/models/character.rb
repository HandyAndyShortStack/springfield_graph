class Character < ActiveRecord::Base
  has_many :connections, foreign_key: :connector_id
end
