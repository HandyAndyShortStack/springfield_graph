character_names = [
  "Abe Simpson", "Ned Flanders", "Krusty the Clown", "Otto Mann",
  "Troy McClure", "Lisa Simpson", "Chief Wiggum", "Homer Simpson",
  "Springfield Elementary", "Springfield", "Seymour Skinner", "Nelson Muntz"
]

character_names.each do |name|
  character = Character.find_or_create_by(name: name)
  image_url = "#{character.name.underscore.gsub(" ", "_")}.png"
  character.update_attributes(image_url: image_url)
end

springfield = Character.find_by(name: "Springfield")
Character.all.each do |character|
  next if ["Troy McClure", "Springfield", "Springfield Elementary"].include? name
  character.connections.find_or_create_by({
    connectee_id: springfield.id,
    description: "resides in"
  })
end

ned = Character.find_by(name: "Ned Flanders")
Character.all.each do |character|
  ned.connections.find_or_create_by({
    connectee_id: character.id
    description: "prays for"
  })
end
