# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Note.find_or_create_by(name: "C")
Note.find_or_create_by(name: "C♯/D♭")
Note.find_or_create_by(name: "D")
Note.find_or_create_by(name: "D♯/E♭")
Note.find_or_create_by(name: "E")
Note.find_or_create_by(name: "F")
Note.find_or_create_by(name: "F♯/G♭")
Note.find_or_create_by(name: "G")
Note.find_or_create_by(name: "G♯/A♭")
Note.find_or_create_by(name: "A")
Note.find_or_create_by(name: "A♯/B♭")
Note.find_or_create_by(name: "B")

Key.find_or_create_by(name: "C", key_type: "Major")
Key.find_or_create_by(name: "C♯", key_type: "Major")
Key.find_or_create_by(name: "D♭", key_type: "Major")
Key.find_or_create_by(name: "D", key_type: "Major")
Key.find_or_create_by(name: "D♯", key_type: "Major")
Key.find_or_create_by(name: "E♭", key_type: "Major")
Key.find_or_create_by(name: "E", key_type: "Major")
Key.find_or_create_by(name: "F", key_type: "Major")
Key.find_or_create_by(name: "F♯", key_type: "Major")
Key.find_or_create_by(name: "G♭", key_type: "Major")
Key.find_or_create_by(name: "G", key_type: "Major")
Key.find_or_create_by(name: "G♯", key_type: "Major")
Key.find_or_create_by(name: "A♭", key_type: "Major")
Key.find_or_create_by(name: "A", key_type: "Major")
Key.find_or_create_by(name: "A♯", key_type: "Major")
Key.find_or_create_by(name: "B♭", key_type: "Major")
Key.find_or_create_by(name: "B", key_type: "Major")

Key.find_or_create_by(name: "C", key_type: "minor")
Key.find_or_create_by(name: "C♯", key_type: "minor")
Key.find_or_create_by(name: "D♭", key_type: "minor")
Key.find_or_create_by(name: "D", key_type: "minor")
Key.find_or_create_by(name: "D♯", key_type: "minor")
Key.find_or_create_by(name: "E♭", key_type: "minor")
Key.find_or_create_by(name: "E", key_type: "minor")
Key.find_or_create_by(name: "F", key_type: "minor")
Key.find_or_create_by(name: "F♯", key_type: "minor")
Key.find_or_create_by(name: "G♭", key_type: "minor")
Key.find_or_create_by(name: "G", key_type: "minor")
Key.find_or_create_by(name: "G♯", key_type: "minor")
Key.find_or_create_by(name: "A♭", key_type: "minor")
Key.find_or_create_by(name: "A", key_type: "minor")
Key.find_or_create_by(name: "A♯", key_type: "minor")
Key.find_or_create_by(name: "B♭", key_type: "minor")
Key.find_or_create_by(name: "B", key_type: "minor")


Key.all.each do |key|
    Scale.calculate_primary_scale_formula(key)
    key.add_notes_to_primary_scale

    Scale.calculate_mode_formulas(key, key.primary_scale)
    key.add_notes_to_modes

    Chord.build_chords_for_scales(key)
end