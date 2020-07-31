require 'telegram/bot'
require_relative '../lib/bot'
require_relative '../lib/modules/constants'

describe Bot do
  it 'when it is called, it works' do
    expect(described_class).to be
  end
end
