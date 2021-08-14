class Key < ApplicationRecord
    has_many :key_notes
    has_many :notes, through: :key_notes
    has_many :key_scales
    has_many :scales, through: :key_scales
    has_many :scale_chords
    has_many :chords, through: :scale_chords
    has_many :song_keys
    has_many :songs, through: :song_keys

    # builder methods

    def add_notes_to_primary_scale
        primary_scale = self.primary_scale

        if primary_scale.notes.empty?
            root_note = self.find_root_note
            new_interval = 0

            primary_scale.notes << root_note

            primary_scale.intervals.each do |interval|
                new_interval += interval
                primary_scale.notes << Key.calculate_note(root_note, new_interval)
            end
        else
            primary_scale
        end
    end
    
    def add_notes_to_modes
        notes = self.primary_scale.notes
        modes = self.scales[0, 6]
        counter = 0
        
        if primary_scale.name.include?("Major")
            note_indexes = [0, 1, 2, 3, 4, 5, 6]
        else
            note_indexes = [2, 3, 4, 5, 6, 0, 1]
        end

        scales.each do |scale|
            root_note = notes[note_indexes[counter]]
            new_interval = 0
            counter += 1

            if scale.notes.empty?
                scale.notes << root_note
                scale.intervals.each do |interval|
                    new_interval += interval
                    scale.notes << Key.calculate_note(root_note, new_interval)
                end
            end
        end
    end

    # Helper Methods

    def find_root_note
        root_note = Note.all.select do |note| 
            if self.name.length > 1
                note.name.include?(self.name)
            else
                note.name == self.name
            end
        end.shift
        root_note.keys << self
        root_note
    end
    
    def self.calculate_note(root_note, interval)
        num = root_note.id + interval
        id = num > 12 ? num % 12 : num
        note = Note.find_by(id: id)
    end

    # chord degrees, chord options, and scale formula

    def select_accidental(note)
        self.name.split
    end

    def primary_scale
        Scale.find_by(id: self.primary_scale_id)
    end

    def primary_scale=(scale)
        self.update(primary_scale_id: scale.id)
        scale
    end

end