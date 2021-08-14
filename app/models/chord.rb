class Chord < ApplicationRecord
    has_many :chord_notes
    has_many :notes, through: :chord_notes
    has_many :scale_chords
    has_many :scales, through: :scale_chords
    has_many :chord_progression_chords
    has_many :chord_progressions, through: :chord_progression_chords
    has_many :song_chords
    has_many :songs, through: :song_chords

    def self.calculate_note_id(root_note, interval)
        id = root_note.id + interval
        id > 12 ? id % 12 : id
    end

    # Chord building methods

    def self.build_chords_for_scales(key)
        Chord.build_chords_for_primary_scale(key)
        Chord.build_chords_for_modes(key)
    end

    def self.build_chords_for_primary_scale(key)
        primary_scale = key.primary_scale

        if primary_scale.chords.empty?
            primary_scale.degrees.each do |degree| 
                degree[1].split(", ").each do |chord_name|
                primary_scale.chords << Chord.send("build_#{chord_name}_chord", 
                    primary_scale.notes[primary_scale.degrees.find_index { |k| k==degree}],
                    degree[0])
                end
            end
        end
    end

    def self.build_chords_for_modes(key)
        key.scales.each do |scale|
            if scale.chords.empty?
                scale.degrees.each do |degree| 
                degree[1].split(", ").each do |chord_name|
                    scale.chords << Chord.send("build_#{chord_name}_chord", 
                        scale.notes[scale.degrees.find_index { |k| k==degree}],
                        degree[0])
                    end
                end
            end
        end     
    end

    # individual chords

    def self.build_major_chord(note, degree)
        chord = Chord.find_by(name: "#{note.name} " + "Major")

        if !chord
            root = note
            major_third = Note.find_by(id: Chord.calculate_note_id(note, 4))
            major_fifth = Note.find_by(id: Chord.calculate_note_id(note, 7))

            chord = Chord.find_or_create_by(name: "#{note.name} " + "Major", chord_type: "Major")

            [root, major_third, major_fifth].each do |note|
                chord.notes << note
            end
        end
        chord
    end

    def self.build_minor_chord(note, degree)
        chord = Chord.find_by(name: "#{note.name} " + "minor")

        if !chord
            root = note
            minor_third = Note.find_by(id: Chord.calculate_note_id(note, 3))
            major_fifth = Note.find_by(id: Chord.calculate_note_id(note, 7))

            chord = Chord.find_or_create_by(name: "#{note.name} " + "minor", chord_type: "minor")

            [root, minor_third, major_fifth].each do |note|
                chord.notes << note
            end
        end
        chord
    end

    def self.build_major_seventh_chord(note, degree)
        chord = Chord.find_by(name: "#{note.name} " + "major_seventh")

        if !chord
            root = note
            major_third = Note.find_by(id: Chord.calculate_note_id(note, 4))
            major_fifth = Note.find_by(id: Chord.calculate_note_id(note, 7))
            major_seventh = Note.find_by(id: Chord.calculate_note_id(note, 10))

            chord = Chord.find_or_create_by(name: "#{note.name} " + "major_seventh", chord_type: "major_seventh")
            [root, major_third, major_fifth, major_seventh].each do |note|
                chord.notes << note
            end
        end
        chord
    end

    def self.build_dominant_seventh_chord(note, degree)
        chord = Chord.find_by(name: "#{note.name} " + "dominant_seventh")

        if !chord
            root = note
            major_third = Note.find_by(id: Chord.calculate_note_id(note, 4))
            major_fifth = Note.find_by(id: Chord.calculate_note_id(note, 7))
            minor_seventh = Note.find_by(id: Chord.calculate_note_id(note, 9))

            chord = Chord.find_or_create_by(name: "#{note.name} " + "dominant_seventh", chord_type: "dominant_seventh")

            [root, major_third, major_fifth, minor_seventh].each do |note|
                chord.notes << note
            end
        end
        chord
    end

    def self.build_minor_seventh_chord(note, degree)
        chord = Chord.find_by(name: "#{note.name} " + "minor_seventh")

        if !chord
            root = note
            minor_third = Note.find_by(id: Chord.calculate_note_id(note, 3))
            major_fifth = Note.find_by(id: Chord.calculate_note_id(note, 7))
            minor_seventh = Note.find_by(id: Chord.calculate_note_id(note, 9))

            chord = Chord.find_or_create_by(name: "#{note.name} " + "minor_seventh", chord_type: "minor_seventh")

            [root, minor_third, major_fifth, minor_seventh].each do |note|
                chord.notes << note
            end
        end
        chord
    end

    def self.build_diminished_chord(note, degree)
        chord = Chord.find_by(name: "#{note.name} " + "diminished")

        if !chord
            root = note
            minor_third = Note.find_by(id: Chord.calculate_note_id(note, 3))
            diminished_fifth = Note.find_by(id: Chord.calculate_note_id(note, 6))

            chord = Chord.find_or_create_by(name: "#{note.name} " + "diminished", chord_type: "diminished")

            [root, minor_third, diminished_fifth].each do |note|
                chord.notes << note
            end
        end
        chord
    end

    def self.build_minor_seventh_flat_five_chord(note, degree)
        chord = Chord.find_by(name: "#{note.name} " + "minor_seventh_flat_five")

        if !chord
            root = note
            minor_third = Note.find_by(id: Chord.calculate_note_id(note, 3))
            diminished_fifth = Note.find_by(id: Chord.calculate_note_id(note, 6))
            minor_seventh = Note.find_by(id: Chord.calculate_note_id(note, 9))

            chord = Chord.find_or_create_by(name: "#{note.name} " + "minor_seventh_flat_five", chord_type: "minor_seventh_flat_five")

            [root, minor_third, diminished_fifth, minor_seventh].each do |note|
                chord.notes << note
            end
        end
        chord
    end
end