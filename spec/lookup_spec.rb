require_relative '../lib/modules/constants'
require_relative '../lib/helpers/lookup'

describe LookUp do
  describe '#read' do
    let(:lookup_word) { LookUp.new(Configs::WORD_OF_DAY_API) }
    let(:lookup_quote) { LookUp.new(Configs::PROGRAMMING_QUOTE_API) }
    let(:lookup_covid) { LookUp.new("#{Configs::COVID_API_URL}?country=rwanda", 'covid') }
    let(:lookup_covid_no_result) { LookUp.new("#{Configs::COVID_API_URL}?country=ruby_is_such_great", 'covid') }
    it 'word link is given, hash' do
      expect(lookup_word.read).to be_kind_of(Hash)
    end
    it 'word link is given, key text' do
      expect(lookup_word.read).to have_key('text')
    end
    it 'word link is given, key author' do
      expect(lookup_word.read).to have_key('author')
    end
    it 'word link is given, value of text is a string' do
      expect(lookup_word.read['text']).to be_kind_of(String)
    end
    it 'word link is given, value of author is a string' do
      expect(lookup_word.read['author']).to be_kind_of(String)
    end
    it 'quote link is given, hash' do
      expect(lookup_quote.read).to be_kind_of(Hash)
    end
    it 'quote link is given, key en' do
      expect(lookup_quote.read).to have_key('en')
    end
    it 'quote link is given, key author' do
      expect(lookup_quote.read).to have_key('author')
    end
    it 'quote link is given, value of en is a string' do
      expect(lookup_quote.read['en']).to be_kind_of(String)
    end
    it 'quote link is given, value of author is a string' do
      expect(lookup_quote.read['author']).to be_kind_of(String)
    end
    it 'covid link is given, hash' do
      expect(lookup_covid.read).to be_kind_of(Hash)
    end
    it 'covid link is given, key response' do
      expect(lookup_covid.read).to have_key('response')
    end
    it 'covid link is given, key response value is array' do
      expect(lookup_covid.read['response']).to be_kind_of(Array)
    end
    it 'covid link is given, key response value is array not empty' do
      expect(lookup_covid.read['response'].length).not_to eql(0)
    end
    it 'covid link is given, no result' do
      expect(lookup_covid_no_result.read['response'].length).to eql(0)
    end
  end
end
