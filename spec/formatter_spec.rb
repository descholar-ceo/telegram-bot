require_relative '../lib/formatter'
require_relative '../lib/constants'

describe Formatter do
  let(:quote_res) do
    Formatter.format_response('word', TestMockData::SAMPLE_WORD_FROM_INTERNET) ==
      TestMockData::SAMPLE_WORD_TO_USER
  end
  describe '#format_response' do
    it 'When we pass object containing a word to formatter' do
      expect(quote_res).to be_kind_of(TrueClass)
    end
    it 'When we pass object containing a word to formatter' do
      expect(quote_res).to eql(true)
    end
  end
end
