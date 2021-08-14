class Scale < ApplicationRecord
    has_many :scale_notes
    has_many :notes, through: :scale_notes
    has_many :key_scales
    has_many :keys, through: :key_scales
    has_many :scale_chords
    has_many :chords, through: :scale_chords
    has_many :song_scales
    has_many :songs, through: :song_scales
    serialize :intervals, Array
    serialize :degrees, Hash

    MODES = [
        "Ionian",
        "Dorian",
        "Phryigian",
        "Lydian",
        "Mixolydian",
        "Aeolian",
        "Locrian"
    ]

    def self.calculate_primary_scale_formula(key)
        root_note = key.find_root_note
        name = "#{root_note.name} #{key.key_type}"
        scale = Scale.find_by(name: name)
        if scale
            key.primary_scale = scale unless key.primary_scale
        else
            scales = {
                :"Major_scale_formula" => {
                    :name => name,
                    :scale_type => key.key_type,
                    :intervals => [2, 2, 1, 2, 2, 2],
                    :degrees => {
                        I: "major, major_seventh", 
                        ii: "minor, minor_seventh", 
                        iii: "minor, minor_seventh", 
                        IV: "major, major_seventh", 
                        V: "major, dominant_seventh", 
                        vi: "minor, minor_seventh", 
                        viidim: "diminished, minor_seventh_flat_five"
                    }
                },
                :"minor_scale_formula" => {
                    :name => name,
                    :scale_type => key.key_type,
                    :intervals=> [2, 1, 2, 2, 1, 2],
                    :degrees => {
                        i: "minor, minor_seventh", 
                        iidim: "diminished, minor_seventh_flat_five", 
                        III: "major, major_seventh", 
                        iv: "minor, minor_seventh", 
                        v: "minor, minor_seventh",
                        VI: "major, major_seventh",
                        VII: "major, dominant_seventh"
                    },
                }
            }

            scale = Scale.find_or_create_by(scales[:"#{key.key_type}_scale_formula"])
            key.primary_scale = scale unless key.primary_scale == scale
        end
    end

    def self.calculate_mode_formulas(key, primary_scale)
        if primary_scale.name.include?("Major")
            note_indexes = [0, 1, 2, 3, 4, 5, 6]
        else
            note_indexes = [2, 3, 4, 5, 6, 0, 1]
        end

        modes = {
            :"Ionian_scale_formula" => {
                :name => primary_scale.notes[note_indexes[0]].name + " Ionian",
                :scale_type => "Ionian",
                :intervals => [2, 2, 1, 2, 2, 2],
                :degrees => {
                    I: "major, major_seventh", 
                    ii: "minor, minor_seventh", 
                    iii: "minor, minor_seventh", 
                    IV: "major, major_seventh", 
                    V: "major, dominant_seventh", 
                    vi: "minor, minor_seventh", 
                    viidim: "diminished, minor_seventh_flat_five"
                }
            },
            :"Dorian_scale_formula" => {
                :name => primary_scale.notes[note_indexes[1]].name + " Dorian",
                :scale_type => "Dorian",
                :intervals => [2, 1, 2, 2, 2, 1],
                :degrees => {
                    ii: "minor, minor_seventh", 
                    iii: "minor, minor_seventh", 
                    IV: "major, major_seventh", 
                    V: "major, dominant_seventh", 
                    vi: "minor, minor_seventh", 
                    viidim: "diminished, minor_seventh_flat_five",
                    I: "major, major_seventh"
                }
            },
            :"Phryigian_scale_formula" => {
                :name => primary_scale.notes[note_indexes[2]].name + " Phryigian",
                :scale_type => "Phryigian",
                :intervals => [1, 2, 2, 2, 1, 2],
                :degrees => {
                    iii: "minor, minor_seventh", 
                    IV: "major, major_seventh", 
                    V: "major, dominant_seventh", 
                    vi: "minor, minor_seventh", 
                    viidim: "diminished, minor_seventh_flat_five",
                    I: "major, major_seventh",
                    ii: "minor, minor_seventh",
                }
            },
            :"Lydian_scale_formula" => {
                :name => primary_scale.notes[note_indexes[3]].name + " Lydian",
                :scale_type => "Lydian",
                :intervals => [2, 2, 2, 1, 2, 2],
                :degrees => {
                    IV: "major, major_seventh", 
                    V: "major, dominant_seventh", 
                    vi: "minor, minor_seventh", 
                    viidim: "diminished, minor_seventh_flat_five",
                    I: "major, major_seventh",
                    ii: "minor, minor_seventh", 
                    iii: "minor, minor_seventh"
                }
            },
            :"Mixolydian_scale_formula" => {
                :name => primary_scale.notes[note_indexes[4]].name + " Mixolydian",
                :scale_type => "Mixolydian",
                :intervals => [2, 2, 1, 2, 2, 1],
                :degrees => {
                    V: "major, dominant_seventh", 
                    vi: "minor, minor_seventh", 
                    viidim: "diminished, minor_seventh_flat_five",
                    I: "major, major_seventh",
                    ii: "minor, minor_seventh", 
                    iii: "minor, minor_seventh",
                    IV: "major, major_seventh"
                }
            },
            :"Aeolian_scale_formula" => {
                :name => primary_scale.notes[note_indexes[5]].name + " Aeolian",
                :scale_type => "Aeolian",
                :intervals => [2, 1, 2, 2, 1, 2],
                :degrees => {
                    vi: "minor, minor_seventh", 
                    viidim: "diminished, minor_seventh_flat_five",
                    I: "major, major_seventh",
                    ii: "minor, minor_seventh", 
                    iii: "minor, minor_seventh",
                    IV: "major, major_seventh",
                    V: "major, dominant_seventh"
                }
            },
            :"Locrian_scale_formula" => {
                :name => primary_scale.notes[note_indexes[6]].name + " Locrian",
                :scale_type => "Locrian",
                :intervals => [1, 2, 2, 1, 2, 2],
                :degrees => {
                    viidim: "diminished, minor_seventh_flat_five",
                    I: "major, major_seventh",
                    ii: "minor, minor_seventh", 
                    iii: "minor, minor_seventh",
                    IV: "major, major_seventh",
                    V: "major, dominant_seventh",
                    vi: "minor, minor_seventh"
                }
            }
        }

        modes.each do |k, v|
            scale = Scale.find_or_create_by(v)
            key.scales << scale unless key.scales.include?(scale)
        end
    end

    # Stretch Goals

    def self.calculate_harmonic_and_melodic_minor(key)
        scales = {
            :"Harmonic_minor_scale_formula" => {
                :name => primary_scale.notes[note_indexes[5]].name + " Harmonic minor",
                :scale_type => "Harmonic minor",
                :intervals => [2, 1, 2, 2, 1, 3],
                :degrees => {
                    vi: "", 
                    viidim: "",
                    I: "",
                    ii: "",
                    iii: "",
                    IV: "",
                    V: "", 
                }
            },
            :"Melodic_minor_scale_formula" => {
                :name => primary_scale.notes[note_indexes[5]].name + " Melodic minor",
                :scale_type => "Melodic minor",
                :intervals => [2, 1, 2, 2, 2, 2],
                :degrees => {
                    vi: "", 
                    viidim: "",
                    I: "",
                    ii: "",
                    iii: "",
                    IV: "",
                    V: "", 
                }
            }
        }
    end
end