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

abe_simpson
    .connect_to(lisa_simpson, "is a grandfather to")
    .connect_to(homer_simpson, "is a father to")
    .connect_to(troy_mcclure, "is a fan of")
    .connect_to(seymour_skinner, "is a friend of")
    .connect_to(krusty_the_clown, "dislikes")

ned_flanders
    .connect_to(lisa_simpson, "is neighbors with")
    .connect_to(homer_simpson, "is neighbors with")

homer_simpson
    .connect_to(lisa_simpson, "is a father to")
    .connect_to(abe_simpson, "is a son of")
    .connect_to(ned_flanders, "is a neighbor to")
    .connect_to(ned_flanders, "is friends with")
    .connect_to(otto_mann, "is friends with")
    .connect_to(chief_wiggum, "is friends with")

krusty_the_clown
    .connect_to(troy_mcclure, "is a fan of")
    .connect_to(troy_mcclure, "is friends with")

lisa_simpson
    .connect_to(springfield_elementary, "attends")
    .connect_to(homer_simpson, "is a daughter of")
    .connect_to(abe_simpson, "is a granddaughter of")
    .connect_to(krusty_the_clown, "is a fan of")
    .connect_to(otto_mann, "is friends with")
    .connect_to(ned_flanders, "is a neighbor to")
    .connect_to(nelson_muntz, "likes")
    # .connect_to(marge_simpson, "is a daughter of")

nelson_muntz
    .connect_to(springfield_elementary, "attends")
    .connect_to(krusty_the_clown, "is a fan of")

otto_mann
    .connect_to(springfield_elementary, "works at")
    .connect_to(seymour_skinner, "works with")
    .connect_to(krusty_the_clown, "is a fan of")
    .connect_to(lisa_simpson, "drives")
    .connect_to(nelson_muntz, "drives")

seymour_skinner
    .connect_to(springfield_elementary, "works at")
    .connect_to(otto_mann, "works with")
    .connect_to(nelson_muntz, "is enemies with")

troy_mcclure
    .connect_to(krusty_the_clown, "is friends with")

chief_wiggum
    .connect_to(homer_simpson, "is friends with")
    .connect_to(krusty_the_clown, "is a fan of")
