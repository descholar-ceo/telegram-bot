require 'time'
require_relative '../lib/helpers/formatter'
require_relative '../lib/modules/constants'

describe Formatter do
  let(:formatter) { Formatter.new }
  let(:word_res) do
    formatter.format_response('word', TestMockData::SAMPLE_WORD_FROM_INTERNET) ==
      TestMockData::SAMPLE_WORD_TO_USER
  end

  let(:quote_res) do
    formatter.format_response('quote', TestMockData::SAMPLE_QUOTE_FROM_INTERNET) ==
      TestMockData::SAMPLE_QUOTE_TO_USER
  end

  let(:date_res) do
    formatter.format_response('date', nil, 'neza', 'bot', Time.parse('2020-07-29 22:01:27 +0200')) ==
      TestMockData::SAMPLE_DATE
  end

  let(:time_res) do
    formatter.format_response('time', nil, 'neza', 'bot', Time.parse('2020-07-29 22:26:35 +0200')) ==
      TestMockData::SAMPLE_TIME
  end

  describe '#format_response' do
    it 'When we pass object containing a word to formatter' do
      expect(word_res).to be_kind_of(TrueClass)
    end

    it 'When we pass object containing a word to formatter' do
      expect(word_res).to eql(true)
    end

    it 'When we pass object containing a quote to formatter' do
      expect(quote_res).to be_kind_of(TrueClass)
    end

    it 'When we pass object containing a quote to formatter' do
      expect(quote_res).to eql(true)
    end

    it 'When we pass object containing a date to formatter' do
      expect(date_res).to be_kind_of(TrueClass)
    end

    it 'When we pass object containing a date to formatter' do
      expect(date_res).to eql(true)
    end

    it 'When we pass object containing a time to formatter' do
      expect(time_res).to be_kind_of(TrueClass)
    end

    it 'When we pass object containing a time to formatter' do
      expect(time_res).to eql(true)
    end

    it 'When we pass object containing a covid stats to formatter' do
      expect(
        formatter.format_response('covid', TestMockData::SAMPLE_COVID_STATS_FROM_INTERNET, 'neza', 'bot')
      ).to eql(TestMockData::SAMPLE_COVID_STATS_TO_USER)
    end
  end
end
