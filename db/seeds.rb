character_names = [
  "Abe Simpson", "Ned Flanders", "Krusty the Clown", "Otto Mann",
  "Troy McClure", "Lisa Simpson", "Chief Wiggum", "Homer Simpson",
  "Springfield Elementary", "Springfield", "Seymour Skinner", "Nelson Muntz"
]

character_names.each do |name|
  character = Character.find_or_create_by(name: name)
  define_method character.underscore_name do
    character
  end
end

Character.all.each do |character|
  ned_flanders.connect_to(character, "prays for")
  unless [troy_mcclure, springfield, springfield_elementary].include? character
    character.connect_to(springfield, "resides in")
  end
end

abe_simpson.connect_to(lisa_simpson, "is a grandfather to")
    .connect_to(homer_simpson, "is a father to")
    .connect_to(troy_mcclure, "is a fan of")
    .connect_to(seymour_skinner, "is a friend of")
    .connect_to(krusty_the_clown, "dislikes")
