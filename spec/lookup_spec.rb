require_relative '../lib/constants'
require_relative '../lib/lookup'

describe LookUp do
    describe '#read' do
        let(:lookup){ LookUp.new(Configs::WORD_OF_DAY_API) }
        it 'When a link is given, hash' do
            expect(lookup.read).to be_kind_of(Hash)
        end
        it 'When a link is given, key text' do
            expect(lookup.read).to have_key('text')
        end
        it 'When a link is given, key author' do
            expect(lookup.read).to have_key('author')
        end
        it 'When a link is given, value of text is a string' do
            expect(lookup.read['text']).to be_kind_of(String)
        end
        it 'When a link is given, value of author is a string' do
            expect(lookup.read['author']).to be_kind_of(String)
        end
    end
end
