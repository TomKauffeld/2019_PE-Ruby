require 'spec_helper'

describe Codex::Entry do
  subject do
    described_class.new(params)
  end

  let(:params) do
    {
        id: id,
        date: date,
        content: content
    }
  end

  let(:id) do
    4242
  end

  let(:date) do
    DateTime.now
  end

  let(:content) do
    'Tu es un gros totoro !'
  end

  describe '#date' do
    it 'returns the right date' do
      expect(subject.date).to eq date
    end
  end

  describe '#content' do
    it 'returns the right content' do
      expect(subject.content).to eq content
    end
  end
end
