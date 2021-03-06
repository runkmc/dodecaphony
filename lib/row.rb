require_relative 'pitch'
require 'set'

module Dodecaphony
  class Row
    include Enumerable

    attr_reader :original_row, :intervals

    alias_method :pitches, :original_row

    def initialize tone_row
      self.original_row = create_row_with_pitches(tone_row)
      validate_size_of original_row
      self.intervals = create_list_with_intervals(original_row,
                                                           starting_pitch)
    end

    def to_s
      to_a.join(" ")
    end
    
    def to_a
      pitches.each_with_object([]) do |pitch, row|
        row << pitch.name
      end
    end

    def spell_with_sharps
      normalize_row(:spell_as_sharp)
    end

    def spell_with_flats
      normalize_row(:spell_as_flat)
    end

    def == other
      (other.pitches).zip(pitches).all? do |pitches|
        pitches[0] == pitches[1]
      end
    end

    def each &block
      pitches.each &block
    end
    private

    attr_writer :intervals, :original_row

    def create_list_with_intervals(row, first_pitch)
      row_list = row.each_with_object({}) do |pitch, hash|
        distance = first_pitch.distance_from pitch
        validate_uniqueness_of distance, hash
        hash[distance] = pitch
      end
      finalize_pitches(row_list)
    end

    def finalize_pitches(row_list)
      row_list[12] = starting_pitch
      row_list
    end

    def starting_pitch
      original_row[0]
    end

    def create_row_with_pitches tone_row
      tone_row.each_with_object([]) do |pitch, row|
        row << Pitch.new(pitch)
      end
    end

    def validate_size_of row
      row_size = row.to_set.length
      unless row_size == 12
        raise ArgumentError, "incorrect number of pitches (#{row_size}) in row"
      end
    end

    def validate_uniqueness_of distance, hash
      if hash.has_key? distance
        raise ArgumentError, "duplicate pitch (#{hash[distance].name})"
      end
    end

    def normalize_row message
      original_row.each_with_object([]) do |pitch, row|
        row << pitch.send(message)
      end
    end

  end
end
