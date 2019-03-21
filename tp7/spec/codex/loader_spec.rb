require 'spec_helper'

describe Codex::Loader do
  subject do
    described_class.new(path)
  end

  let(:path) do
    'spec/etc/sample_journal.codex'
  end

  describe '#entries' do
    let(:entries) do
      subject.entries
    end

    it 'has the right number of entries' do
      expect(entries).to have(3).items
    end
  end
end
