module Codex
  class Loader
    COLUMNS_SEPARATOR = '|'.freeze

    # Loads a path and make the entries available
    #
    # @param [String] path the path where the journal is
    def initialize(path)
      @path = path
    end

    # Returns the parsed array of entries
    #
    # @return [Array] the parsed entries
    def entries
      @entries ||= build_entries
    end

    private
    attr_reader :path

    # Parses the file and returns the entries
    def build_entries
      # for each line of the file, map
      File.readlines(path).map do |raw_entry|
        # into real entries
        build_entry(raw_entry)
      end
    end

    # Parses a specific entry and returns a real Entry model
    def build_entry(raw_entry)
      id, date, *text = raw_entry.split(COLUMNS_SEPARATOR)

      Entry.new(
          id: Integer(id),
          date: DateTime.parse(date),
          content: text.join(COLUMNS_SEPARATOR)
      )
    end
  end
end
