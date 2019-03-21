module Codex
  class Entry
    # Modelize a journal entry
    #
    # @param [String] id the entry's identifier
    # @param [DateTime] date the entry's date
    # @param [String] content the entry's content
    def initialize(
        id:,
        date:,
        content:
    )
      @id = id
      @date = date
      @content = content
    end

    # Reader for date
    #
    # @return [DateTime] the entry's date
    attr_reader :date

    # Reader for content
    #
    # @return [String] the entry's content
    attr_reader :content
  end
end
