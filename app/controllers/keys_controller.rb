class KeysController < ApplicationController
    
    def index
        keys = Key.all
        render json: keys.to_json(
            :include => {
                :scales => {include: [
                    :notes, 
                    :chords => {include: [:notes]}
                ]}
            },
        )
    end

    def show 
        key = Key.find_by(key_type: params[:type], name: params[:name])

        render json: key.to_json(
            :include => {
                :scales => {include: [
                    :notes, 
                    :chords => {include: [:notes]}
                ]}
            }
        )
    end
end

# Scale.calculate_primary_scale_formula(key)
# key.add_notes_to_primary_scale

# Scale.calculate_mode_formulas(key, key.primary_scale)
# key.add_notes_to_modes

# Chord.build_chords_for_scales(key)