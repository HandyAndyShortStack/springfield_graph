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

  describe "#connect_to" do

    let(:other_character) { Character.create }

    before :each do
      character.connect_to(other_character, "is connected to")
    end

    it "creates a connection" do
      expect(character.connections.length).to eq(1)
    end

    it "returns the character" do
      result = character.connect_to(other_character, "is connected to")
      expect(result).to be(character)
    end

    it "does not duplicate identical connections" do
      character.connect_to(other_character, "is connected to")
      expect(character.connections.length).to eq(1)
    end
  end
end
