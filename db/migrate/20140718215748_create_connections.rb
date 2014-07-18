class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :connector_id
      t.integer :connectee_id
      t.string :description

      t.timestamps
    end
  end
end
