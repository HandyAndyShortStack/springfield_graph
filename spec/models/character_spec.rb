require "rails_helper"

describe Character do

  let(:character) { Character.create }

  describe "#connections" do

    before :each do
      character.connections.create(connectee_id: 1, description: "is connected to")
    end

    it "provides a relation consisting of outgoing connections" do
      expect(character.connections.length).to eq(1)
    end
  end
end
