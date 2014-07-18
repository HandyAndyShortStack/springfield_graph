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
