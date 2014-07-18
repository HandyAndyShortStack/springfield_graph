require "rails_helper"

describe Connection do

  let(:connector) { Character.create }
  let(:connectee) { Character.create }
  let :connection do
    Connection.create({
      connector_id: connector.id,
      connectee_id: connectee.id,
      description: "is connected to"
    })
  end

  describe "#connector" do

    it "is a character" do
      expect(connection.connector).to be_a(Character)
    end
  end

  describe "#connectee" do

    it "is a character" do
      expect(connection.connectee).to be_a(Character)
    end
  end
end
