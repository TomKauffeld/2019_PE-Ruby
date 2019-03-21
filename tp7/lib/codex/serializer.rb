
module Codex
  class Serializer
    # Serialize entries into paths
    #
    # @param [Array] entries that will be serialized
    def initialize(entries)
      @entries = entries
    end

    # Writes the entries into the given path
    #
    # @param [String] path path into which we will serialize the entries
    def dump(path)
      File.open(path, 'w+') do |file|
        entries.each do |entry|
          file << [
              entry.id,
              entry.date.to_s,
              entry.content
          ].join('|')

          file << "\n"
        end
      end
    end

    protected
    attr_reader :entries
  end
end
